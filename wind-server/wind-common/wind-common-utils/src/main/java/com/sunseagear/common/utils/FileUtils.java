package com.sunseagear.common.utils;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * 文件操作类
 *
 * @author Administrator
 */
public class FileUtils extends org.apache.commons.io.FileUtils {

    protected static Logger logger = LoggerFactory.getLogger(FileUtils.class);

    // 验证字符串是否为正确路径名的正则表达式
    private static String matches = "[A-Za-z]:\\\\[^:?\"><*]*";
    boolean flag = false;
    File file;

    /**
     * 传入路径，返回是否是绝对路径，是绝对路径返回true，反之
     *
     * @param path
     * @return
     * @since 2015年4月21日
     */
    public static boolean isAbsolutePath(String path) {
        if (path.startsWith("/") || path.indexOf(":") > 0) {
            return true;
        }
        return false;
    }

    public boolean deleteFolder(String deletePath) {// 根据路径删除指定的目录或文件，无论存在与否
        flag = false;
        if (deletePath.matches(matches)) {
            file = new File(deletePath);
            if (!file.exists()) {// 判断目录或文件是否存在
                return flag; // 不存在返回 false
            } else {

                if (file.isFile()) {// 判断是否为文件
                    return deleteFile(deletePath);// 为文件时调用删除文件方法
                } else {
                    return deleteDirectory(deletePath);// 为目录时调用删除目录方法
                }
            }
        } else {
            //System.out.println("要传入正确路径！");
            return false;
        }
    }

    public boolean deleteFile(String filePath) {// 删除单个文件
        flag = false;
        file = new File(filePath);
        if (file.isFile() && file.exists()) {// 路径为文件且不为空则进行删除
            file.delete();// 文件删除
            flag = true;
        }
        return flag;
    }

    public boolean deleteDirectory(String dirPath) {// 删除目录（文件夹）以及目录下的文件
        // 如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!dirPath.endsWith(File.separator)) {
            dirPath = dirPath + File.separator;
        }
        File dirFile = new File(dirPath);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        flag = true;
        File[] files = dirFile.listFiles();// 获得传入路径下的所有文件
        for (int i = 0; i < files.length; i++) {// 循环遍历删除文件夹下的所有文件(包括子目录)
            if (files[i].isFile()) {// 删除子文件
                flag = deleteFile(files[i].getAbsolutePath());
                //System.out.println(files[i].getAbsolutePath() + " 删除成功");
                if (!flag)
                    break;// 如果删除失败，则跳出
            } else {// 运用递归，删除子目录
                flag = deleteDirectory(files[i].getAbsolutePath());
                if (!flag)
                    break;// 如果删除失败，则跳出
            }
        }
        if (!flag)
            return false;
        if (dirFile.delete()) {// 删除当前目录
            return true;
        } else {
            return false;
        }
    }

    // 创建单个文件
    public static boolean createFile(String filePath) {
        File file = new File(filePath);
        if (file.exists()) {// 判断文件是否存在
            //System.out.println("目标文件已存在" + filePath);
            return false;
        }
        if (filePath.endsWith(File.separator)) {// 判断文件是否为目录
            //System.out.println("目标文件不能为目录！");
            return false;
        }
        if (!file.getParentFile().exists()) {// 判断目标文件所在的目录是否存在
            // 如果目标文件所在的文件夹不存在，则创建父文件夹
            //System.out.println("目标文件所在目录不存在，准备创建它！");
            if (!file.getParentFile().mkdirs()) {// 判断创建目录是否成功
                //System.out.println("创建目标文件所在的目录失败！");
                return false;
            }
        }
        try {
            if (file.createNewFile()) {// 创建目标文件
                //System.out.println("创建文件成功:" + filePath);
                return true;
            } else {
                //System.out.println("创建文件失败！");
                return false;
            }
        } catch (IOException e) {// 捕获异常
            e.printStackTrace();
            //System.out.println("创建文件失败！" + e.getMessage());
            return false;
        }
    }

    // 创建临时文件
    public static String createTempFile(String prefix, String suffix, String dirName) {
        File tempFile = null;
        if (dirName == null) {// 目录如果为空
            try {
                tempFile = File.createTempFile(prefix, suffix);// 在默认文件夹下创建临时文件
                return tempFile.getCanonicalPath();// 返回临时文件的路径
            } catch (IOException e) {// 捕获异常
                e.printStackTrace();
                System.out.println("创建临时文件失败：" + e.getMessage());
                return null;
            }
        } else {
            // 指定目录存在
            File dir = new File(dirName);// 创建目录
            if (!dir.exists()) {
                // 如果目录不存在则创建目录
                if (FileUtils.mkDir(dirName)) {
                    System.out.println("创建临时文件失败，不能创建临时文件所在的目录！");
                    return null;
                }
            }
            try {
                tempFile = File.createTempFile(prefix, suffix, dir);// 在指定目录下创建临时文件
                return tempFile.getCanonicalPath();// 返回临时文件的路径
            } catch (IOException e) {// 捕获异常
                e.printStackTrace();
                System.out.println("创建临时文件失败!" + e.getMessage());
                return null;
            }
        }
    }

    /**
     * 在指定的位置创建指定的文件
     *
     * @param filePath 完整的文件路径
     * @param mkdir    是否创建相关的文件夹
     * @throws Exception
     */
    public static void mkFile(String filePath, boolean mkdir) throws Exception {
        File file = new File(filePath);
        file.getParentFile().mkdirs();
        file.createNewFile();
        file = null;
    }

    /**
     * 在指定的位置创建文件夹
     *
     * @param dirPath 文件夹路径
     * @return 若创建成功，则返回True；反之，则返回False
     */
    public static boolean mkDir(String dirPath) {
        File dir = new File(dirPath);
        if (dir.exists()) {// 判断目录是否存在
            System.out.println("创建目录失败，目标目录已存在！");
            return false;
        }
        if (!dirPath.endsWith(File.separator)) {// 结尾是否以"/"结束
            dirPath = dirPath + File.separator;
        }
        if (dir.mkdirs()) {// 创建目标目录
            System.out.println("创建目录成功！" + dirPath);
            return true;
        } else {
            System.out.println("创建目录失败！");
            return false;
        }
    }

    /**
     * 删除指定的文件
     *
     * @param filePath 文件路径
     * @return 若删除成功，则返回True；反之，则返回False
     */
    public static boolean delFile(String filePath) {
        return new File(filePath).delete();
    }

    /**
     * 删除指定的文件夹
     *
     * @param dirPath 文件夹路径
     * @param delFile 文件夹中是否包含文件
     * @return 若删除成功，则返回True；反之，则返回False
     */
    public static boolean delDir(String dirPath, boolean delFile) {
        if (delFile) {
            File file = new File(dirPath);
            if (file.isFile()) {
                return file.delete();
            } else if (file.isDirectory()) {
                if (file.listFiles().length == 0) {
                    return file.delete();
                } else {
                    int zfiles = file.listFiles().length;
                    File[] delfile = file.listFiles();
                    for (int i = 0; i < zfiles; i++) {
                        if (delfile[i].isDirectory()) {
                            delDir(delfile[i].getAbsolutePath(), true);
                        }
                        delfile[i].delete();
                    }
                    return file.delete();
                }
            } else {
                return false;
            }
        } else {
            return new File(dirPath).delete();
        }
    }

    /**
     * 复制文件/文件夹 若要进行文件夹复制，请勿将目标文件夹置于源文件夹中
     *
     * @param source   源文件（夹）
     * @param target   目标文件（夹）
     * @param isFolder 若进行文件夹复制，则为True；反之为False
     * @throws Exception
     */
    public static void copy(String source, String target, boolean isFolder) throws Exception {
        if (isFolder) {
            (new File(target)).mkdirs();
            File a = new File(source);
            String[] file = a.list();
            File temp = null;
            for (int i = 0; i < file.length; i++) {
                if (source.endsWith(File.separator)) {
                    temp = new File(source + file[i]);
                } else {
                    temp = new File(source + File.separator + file[i]);
                }
                if (temp.isFile()) {
                    FileInputStream input = new FileInputStream(temp);
                    FileOutputStream output = new FileOutputStream(target + "/" + (temp.getName()).toString());
                    byte[] b = new byte[1024];
                    int len;
                    while ((len = input.read(b)) != -1) {
                        output.write(b, 0, len);
                    }
                    output.flush();
                    output.close();
                    input.close();
                }
                if (temp.isDirectory()) {
                    copy(source + "/" + file[i], target + "/" + file[i], true);
                }
            }
        } else {
            int byteread = 0;
            File oldfile = new File(source);
            if (oldfile.exists()) {
                InputStream inStream = new FileInputStream(source);
                File file = new File(target);
                file.getParentFile().mkdirs();
                file.createNewFile();
                FileOutputStream fs = new FileOutputStream(file);
                byte[] buffer = new byte[1024];
                while ((byteread = inStream.read(buffer)) != -1) {
                    fs.write(buffer, 0, byteread);
                }
                inStream.close();
                fs.close();
            }
        }
    }

    /**
     * 移动指定的文件（夹）到目标文件（夹）
     *
     * @param source   源文件（夹）
     * @param target   目标文件（夹）
     * @param isFolder 若为文件夹，则为True；反之为False
     * @return
     * @throws Exception
     */
    public static boolean move(String source, String target, boolean isFolder) throws Exception {
        copy(source, target, isFolder);
        if (isFolder) {
            return delDir(source, true);
        } else {
            return delFile(source);
        }
    }

    /**
     * 将文件转字节数组
     *
     * @param filePath
     * @return
     * @throws IOException
     */
    public static byte[] toByteArray(String filePath) throws IOException {
        FileInputStream in = null;
        File file = new File(filePath);
        in = new FileInputStream(file);
        byte[] bytes = IOUtils.toByteArray(in);
        if (in != null) {
            in.close();
        }
        return bytes;
    }

    /**
     * 根据byte数组，生成文件
     */
    public static void saveFile(byte[] bfile, String filePath, String fileName) {
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        File file = null;
        try {
            File dir = new File(filePath);
            if (!dir.exists() && dir.isDirectory()) {//判断文件目录是否存在
                dir.mkdirs();
            }
            file = new File(filePath + "\\" + fileName);
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(bfile);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }


    public static String[] readDirFilesName(String filePath, boolean isAll) {
        String[] rs = null;
        List<File> fs = readDirFiles(filePath, isAll);
        int i;
        if (fs != null) {
            rs = new String[fs.size()];
            i = 0;
            for (File file : fs) {
                rs[i] = file.getName();
                i++;
            }
        } else {
            rs = new String[0];
        }

        return rs;
    }

    public static List<File> readDirFilesFilter(String filePath, boolean isAll, String filterName) {
        List<File> fs = readDirFiles(filePath, isAll);
        List rs = new ArrayList();
        for (File file : fs) {
            String fName = file.getName();
            if ((fName != null) && (fName.length() > 0) &&
                    (fName.toLowerCase().endsWith(filterName.toLowerCase()))) {
                rs.add(file);
            }
        }

        return rs;
    }

    public static List<File> readDirFiles(String filepath, boolean isAll) {
        List fs = new ArrayList();
        try {
            File file = new File(filepath);
            if ((!isAll) && (file.isDirectory())) {
                fs.addAll(Arrays.asList(file.listFiles()));
                return fs;
            }
            if (!file.isDirectory()) {
                fs.add(file);
            } else if (file.isDirectory()) {
                String[] filelist = file.list();
                for (int i = 0; i < filelist.length; i++) {
                    File readfile = new File(filepath + "\\" + filelist[i]);
                    if (!readfile.isDirectory())
                        fs.add(readfile);
                    else if (readfile.isDirectory())
                        readDirFiles(filepath + "\\" + filelist[i], isAll);
                }
            }
        } catch (Exception e) {
            System.out.println("readfile()   Exception:" + e.getMessage());
        }
        return fs;
    }

    public static boolean deleteFilePath(File file) {
        if (file == null) {
            return false;
        }
        return deleteFilePath(file.getAbsolutePath());
    }

    public static boolean deleteFilePath(String filePath) {
        System.runFinalization();
        System.gc();
        File file = null;
        file = new File(filePath);
        String[] list = file.list();
        if (!file.exists()) {
            return true;
        }
        if ((null == list) || (list.length == 0)) {
            return file.delete();
        }
        for (int i = 0; i < list.length; i++) {
            deleteFilePath(filePath + File.separator + list[i]);
            deleteFilePath(filePath);
        }
        return true;
    }

    public static void zipFile(String srcFileName, String zipFileName) {
        try {
            ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(zipFileName)));
            fileZip(out, new File(srcFileName), "");
            out.flush();
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void fileZip(ZipOutputStream out, File file, String base) throws IOException {
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            base = base + "/";
            for (File tmpFile : files)
                fileZip(out, tmpFile, base + tmpFile.getName());
        } else {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file), 10240);
            out.putNextEntry(new ZipEntry(base));

            byte[] buf = new byte[10240];
            int read;
            while ((read = bis.read(buf, 0, 10240)) != -1) {
                out.write(buf, 0, read);
            }
            bis.close();
        }
    }

    public void unZipFile(String unZipBeforeFile, String unZipAfterFile) {
        try {
            ZipInputStream zis = new ZipInputStream(new FileInputStream(unZipBeforeFile));
            File f = new File(unZipAfterFile);
            f.mkdirs();
            fileUnZip(zis, f);
            zis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fileUnZip(ZipInputStream zis, File file) throws Exception {
        ZipEntry zip = zis.getNextEntry();
        if (zip == null)
            return;
        String name = zip.getName();
        File f = new File(file.getAbsolutePath() + "/" + name);
        if (zip.isDirectory()) {
            f.mkdirs();
            fileUnZip(zis, file);
        } else {
            f.createNewFile();
            FileOutputStream fos = new FileOutputStream(f);
            byte[] b = new byte[10240];
            int aa = 0;
            while ((aa = zis.read(b)) != -1) {
                fos.write(b, 0, aa);
            }
            fos.close();
            fileUnZip(zis, file);
        }
    }

    public static byte[] getFileContent(String filePath) {
        File file = new File(filePath);
        if (!file.exists()) {
            return new byte[0];
        }
        InputStream fr = null;
        try {
            byte[] content = new byte[(int) file.length()];

            fr = new FileInputStream(file);
            int length = fr.read(content);
            if (length == file.length()) {
                byte[] arrayOfByte1 = content;
                return arrayOfByte1;
            }
        } catch (FileNotFoundException e) {
            logger.info("File:" + filePath + " getFileContent error", e);
        } catch (IOException e) {
            logger.info("File:" + filePath + " getFileContent error", e);
        } finally {
            safeCloseInputStream(fr);
        }
        return new byte[0];
    }

    public static String doCopyFile(String source, String targetPath) {
        File sFile = new File(source);
        String tFileName = sFile.getName();
        File targetFile = new File(targetPath);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        if (!sFile.exists()) {
            System.err.println("需要复制的文件不存在，请检查！");
        }
        FileInputStream fis = null;
        FileOutputStream outputStream = null;
        try {
            fis = new FileInputStream(sFile);
            outputStream = new FileOutputStream(new File(targetPath + "\\" + tFileName));
            byte[] buff = new byte[2048];
            int temp = 0;
            while ((temp = fis.read(buff, 0, 2048)) != -1) {
                outputStream.write(buff, 0, temp);
            }
            fis.close();
            outputStream.close();
            String str1 = targetPath + "\\" + tFileName;
            return str1;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                if (fis != null) {
                    fis.close();
                }
                if (outputStream != null)
                    outputStream.close();
            } catch (Exception e) {
                System.err.println(e.getMessage());
            }
        }
        return null;
    }

    public static void downloadFile(HttpServletRequest request, HttpServletResponse response, String filePath)
            throws IOException {
        File file = new File(filePath);
        downloadFile(request, response, filePath, file.getName());
    }

    public static void downloadFile(HttpServletRequest request, HttpServletResponse response, String filePath, String fileName) {
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(new FileInputStream(filePath + fileName));
            bos = new BufferedOutputStream(response.getOutputStream());

            long fileLength = new File(filePath).length();

            response.setHeader("content-disposition", String.format("attachment;filename=\"%s\"", new Object[]{fileName}));
            response.setHeader("content-length", String.valueOf(fileLength));
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bos.flush();
            bis.close();
            bos.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public static void fileDownload(HttpServletResponse response, String filePath, String fileName) throws Exception {
        byte[] data = toByteArray(filePath);
        fileName = URLEncoder.encode(fileName, "UTF-8");
        response.reset();
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.addHeader("Content-Length", "" + data.length);

        response.setContentType("application/x-download");
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
        outputStream.write(data);
        outputStream.flush();
        outputStream.close();
        response.flushBuffer();
    }

    public static void safeCloseReader(Reader reader) {
        if (null != reader)
            try {
                reader.close();
            } catch (IOException e) {
                logger.error("close file error:" + e.getMessage(), e);
            }
    }

    public static void safeCloseOutputStream(OutputStream out) {
        if (null != out)
            try {
                out.close();
            } catch (IOException e) {
                logger.error("close file error:" + e.getMessage(), e);
            }
    }

    public static void safeCloseInputStream(InputStream in) {
        if (null != in)
            try {
                in.close();
            } catch (IOException e) {
                logger.error("close file error:" + e.getMessage(), e);
            }
    }

    public static void safeFlushAndCloseOutputStream(OutputStream out) {
        if (null != out)
            try {
                out.flush();
            } catch (IOException e) {
                logger.error("close file error:" + e.getMessage(), e);
            } finally {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("close file error:" + e.getMessage(), e);
                }
            }
    }

    public static String getFileType(String url) {
        if (url == null || url.trim().isEmpty()) {
            return null;
        }
        int pos = url.lastIndexOf(".") + 1;
        return url.substring(pos);
    }

    //BASE64解码成File文件
    public static boolean base64ToFile(String destPath, String base64, String fileName) {
        File file = null;
        //创建文件目录
        String filePath = destPath;
        File dir = new File(filePath);
        if (!dir.exists() && !dir.isDirectory()) {
            dir.mkdirs();
        }
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        try {
            byte[] bytes = Base64.getDecoder().decode(base64);
            file = new File(filePath + "/" + fileName);
            fos = new FileOutputStream(file);
            bos = new BufferedOutputStream(fos);
            bos.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }

    /**
     * @param path
     * @return String
     * @description 将文件转base64字符串
     * @date 2018年3月20日
     * @author changyl
     * File转成编码成BASE64
     */

    public static String fileToBase64(String path) {
        String base64 = null;
        InputStream in = null;
        try {
            File file = new File(path);
            in = new FileInputStream(file);
            byte[] bytes = new byte[(int) file.length()];
            in.read(bytes);
            base64 = Base64.getEncoder().encodeToString(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return base64;
    }

    public static String fileToBase64(MultipartFile multipartFile) {
        String base64 = null;
        try {
            base64 = Base64.getEncoder().encodeToString(multipartFile.getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return base64;
    }


    public static void main(String[] args) {
        String dirName = "E:/createFile/";// 创建目录
        FileUtils.mkDir(dirName);// 调用方法创建目录
        String fileName = dirName + "/file1.txt";// 创建文件
        FileUtils.createFile(fileName);// 调用方法创建文件
        String prefix = "temp";// 创建临时文件
        String surfix = ".txt";// 后缀
        for (int i = 0; i < 10; i++) {// 循环创建多个文件
            System.out.println("创建临时文件: "// 调用方法创建临时文件
                    + FileUtils.createTempFile(prefix, surfix, dirName));
        }
    }


}

package com.sunseagear.wind.common.helper;

import com.sunseagear.common.oss.OSSUploadHelper;
import com.sunseagear.common.oss.config.OssConfig;
import com.sunseagear.common.oss.exception.FileNameLengthLimitExceededException;
import com.sunseagear.common.oss.exception.InvalidExtensionException;
import com.sunseagear.common.utils.IpUtils;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.modules.oss.entity.Attachment;
import com.sunseagear.wind.modules.oss.service.IAttachmentService;
import com.sunseagear.wind.modules.sys.entity.User;
import com.sunseagear.wind.utils.JWTHelper;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.oss.controller
 * @title: 附件上传助手
 * @description: 附件上传助手 * @date: 2018-04-25 14:25:55
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Component("attachmentHelper")
@EnableConfigurationProperties({OssConfig.class})
public class AttachmentHelper {

    @Autowired
    private IAttachmentService attachmentService;
    @Autowired
    private OssConfig ossConfig;

    private OSSUploadHelper uploadHelper;

    @PostConstruct
    public void initHelper() {
        uploadHelper = new OSSUploadHelper();
        uploadHelper.init(ossConfig);
    }


    public Attachment upload(HttpServletRequest request, MultipartFile file) throws FileSizeLimitExceededException,
            IOException, FileNameLengthLimitExceededException, InvalidExtensionException {
        String basePath = request.getParameter("directory");
        return upload(request, file, basePath);
    }

    public Attachment upload(HttpServletRequest request, MultipartFile file, String directory) throws FileSizeLimitExceededException,
            IOException, FileNameLengthLimitExceededException, InvalidExtensionException {
        String url = uploadHelper.upload(request, file, directory);
        String filename = file.getOriginalFilename();
        long size = file.getSize();
        //file.getContentType();
        String realFileName = StringUtils.getFileNameNoEx(filename);
        String fileExtension = StringUtils.getExtensionName(filename);
        // 保存上传的信息
        Attachment attachment = new Attachment();
        attachment.setFileExtension(fileExtension);
        attachment.setFileName(realFileName);
        attachment.setContentType(file.getContentType());
        attachment.setFilePath(url);
        attachment.setFileSize(size);
        attachment.setStatus("1");
        attachment.setUploadIp(IpUtils.getIpAddr(request));
        attachment.setUploadTime(new Date());
        attachment.setUserId(getUser(request).getId());
        attachment.setBasePath(directory);
        attachmentService.insert(attachment);
        return attachment;
    }

    public Attachment remote(HttpServletRequest request, String remoteUrl) throws FileSizeLimitExceededException,
            IOException, FileNameLengthLimitExceededException, InvalidExtensionException {
        String basePath = request.getParameter("base_path");
        String url = uploadHelper.remote(request, remoteUrl, basePath);
        String filename = remoteUrl.substring(remoteUrl.lastIndexOf('/') + 1);
        URL remoteUri = new URL(remoteUrl);
        HttpURLConnection conn = (HttpURLConnection) remoteUri.openConnection();
        conn.setConnectTimeout(10 * 1000);
        long size = Integer.parseInt(conn.getHeaderField("Content-Length"));
        String contentType = conn.getHeaderField("Content-Type");
        String realFileName = StringUtils.getFileNameNoEx(filename);
        String fileExtension = StringUtils.getExtensionName(filename);
        // 保存上传的信息
        Attachment attachment = new Attachment();
        attachment.setFileExtension(fileExtension);
        attachment.setFileName(realFileName);
        attachment.setFilePath(url);
        attachment.setFileSize(size);
        attachment.setStatus("1");
        attachment.setUploadIp(IpUtils.getIpAddr(request));
        attachment.setUploadTime(new Date());
        attachment.setContentType(contentType);
        attachment.setUserId(getUser(request).getId());
        attachment.setBasePath(basePath);
        attachmentService.insert(attachment);
        return attachment;
    }

    private User getUser(HttpServletRequest request) {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String token = httpServletRequest.getHeader("access_token");
        if (StringUtils.isEmpty(token)) {
            token = httpServletRequest.getParameter("access_token");
        }
        if (!StringUtils.isEmpty(token)) {
            String id = JWTHelper.getClaims(token, "id");
            String username = JWTHelper.getClaims(token, "username");
            String realname = JWTHelper.getClaims(token, "realname");
            User user = new User();
            user.setId(id);
            user.setUsername(username);
            user.setRealname(realname);
            return user;
        }
        return new User();
    }

}

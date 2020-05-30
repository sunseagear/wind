package com.sunseagear.common.utils;

import org.apache.commons.io.FilenameUtils;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @title: ImagesUtils.java
 * @package com.sunseagear.common.util
 * @description: 判断判断文件 * @date: 2017年5月22日 下午9:25:14
 * @copyright: 2017 www.sunseagear.com Inc. All rights reserved.
 */
public class ImagesUtils {

    private static final String[] IMAGES_SUFFIXES = {"bmp", "jpg", "jpeg", "gif", "png", "tiff"};

    /**
     * 是否是图片附件
     *
     * @param filename
     * @return
     */
    public static boolean isImage(String filename) {
        if (filename == null || filename.trim().length() == 0)
            return false;
        return ArrayUtils.contains(IMAGES_SUFFIXES, FilenameUtils.getExtension(filename).toLowerCase());
    }

}

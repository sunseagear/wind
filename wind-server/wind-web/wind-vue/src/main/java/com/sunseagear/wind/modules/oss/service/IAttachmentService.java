package com.sunseagear.wind.modules.oss.service;

import com.sunseagear.common.mvc.service.ICommonService;
import com.sunseagear.wind.modules.oss.entity.Attachment;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.oss.service
 * @title: 附件管理服务接口
 * @description: 附件管理服务接口 * @date: 2018-04-25 14:25:55
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
public interface IAttachmentService extends ICommonService<Attachment> {
    String upload(HttpServletRequest request, MultipartFile[] file, String dir);
}

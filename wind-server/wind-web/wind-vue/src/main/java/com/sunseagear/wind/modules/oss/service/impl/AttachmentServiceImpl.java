package com.sunseagear.wind.modules.oss.service.impl;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.service.impl.CommonServiceImpl;
import com.sunseagear.common.oss.exception.FileNameLengthLimitExceededException;
import com.sunseagear.common.oss.exception.InvalidExtensionException;
import com.sunseagear.common.utils.ArrayUtils;
import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.wind.common.helper.AttachmentHelper;
import com.sunseagear.wind.common.response.ResponseError;
import com.sunseagear.wind.modules.oss.entity.Attachment;
import com.sunseagear.wind.modules.oss.mapper.AttachmentMapper;
import com.sunseagear.wind.modules.oss.service.IAttachmentService;
import org.apache.commons.fileupload.FileUploadBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.oss.service.impl
 * @title: 附件管理服务实现
 * @description: 附件管理服务实现 * @date: 2018-04-25 14:25:54
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */
@Transactional
@Service("attachmentService")
public class AttachmentServiceImpl extends CommonServiceImpl<AttachmentMapper, Attachment> implements IAttachmentService {

    @Autowired
    private AttachmentHelper attachmentHelper;

    public String upload(HttpServletRequest request, MultipartFile[] file, String dir) {
        List<String> attachmentList = new ArrayList<>();

        for (MultipartFile item : file) {
            try {
                Attachment attachment = attachmentHelper.upload(request, item, dir);
                attachmentList.add(attachment.getFilePath());
                continue;
            } catch (IOException e) {
                return Response.error(ResponseError.NORMAL_ERROR, MessageUtils.getMessage("upload.server.error"));
            } catch (InvalidExtensionException e) {
                return Response.error(ResponseError.NORMAL_ERROR, MessageUtils.getMessage("upload.server.error"));
            } catch (FileUploadBase.FileSizeLimitExceededException e) {
                return Response.error(ResponseError.NORMAL_ERROR, MessageUtils.getMessage("upload.server.error"));
            } catch (FileNameLengthLimitExceededException e) {
                return Response.error(ResponseError.NORMAL_ERROR, MessageUtils.getMessage("upload.server.error"));
            }
        }

        String fileList = ArrayUtils.join(attachmentList, ",");
        return Response.successJson((Object) fileList);
    }


}

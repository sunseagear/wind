package com.sunseagear.wind.modules.sys.json;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.oss.exception.FileNameLengthLimitExceededException;
import com.sunseagear.common.oss.exception.InvalidExtensionException;
import com.sunseagear.common.utils.FileUtils;
import com.sunseagear.common.utils.JsonUtils;
import com.sunseagear.common.utils.MessageUtils;
import com.sunseagear.wind.common.response.ResponseError;
import com.sunseagear.wind.modules.oss.service.IAttachmentService;
import org.apache.commons.fileupload.FileUploadBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * All rights Reserved, Designed By www.sunseagear.com
 *
 * @version V1.0
 * @package com.sunseagear.oss.controller
 * @title: 附件管理控制器
 * @description: 附件管理控制器 * @date: 2018-04-25 14:25:55
 * @copyright: 2018 www.sunseagear.com Inc. All rights reserved.
 */

@RestController
@RequestMapping("json/oss")
public class OSSUploadJsonController {

    @Autowired
    private IAttachmentService attachmentService;

    /**
     * @param request,file,directory
     * @return
     * @title: ajaxUpload
     * @description: 文件上传
     * @return: AjaxUploadResponse
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String upload(HttpServletRequest request, MultipartFile[] file, @RequestParam(required = false, defaultValue = "") String dir) {
        try {
            return JsonUtils.successMessage((Object) attachmentService.upload(request, file, dir));
        } catch (IOException e) {
            return JsonUtils.failMessage(MessageUtils.getMessage("upload.server.error"));
        } catch (InvalidExtensionException e) {
            return JsonUtils.failMessage(MessageUtils.getMessage("upload.server.error"));
        } catch (FileUploadBase.FileSizeLimitExceededException e) {
            return JsonUtils.failMessage(MessageUtils.getMessage("upload.server.error"));
        } catch (FileNameLengthLimitExceededException e) {
            return JsonUtils.failMessage(MessageUtils.getMessage("upload.server.error"));
        }
    }

    @RequestMapping("imgToBase64")
    public String uploadImg(MultipartFile file) {

        String fileType = file.getOriginalFilename();
        fileType = FileUtils.getFileType(fileType).toLowerCase();
        String base64 = FileUtils.fileToBase64(file);
        if (base64 == null) {
            JsonUtils.failMessage("转换失败");
        }
        base64 = String.format("data:image/%s;base64,%s", fileType, base64);
        return JsonUtils.successMessage((Object) base64);

    }
}

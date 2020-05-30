package com.sunseagear.wind.modules.oss.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sunseagear.common.http.Response;
import com.sunseagear.common.mvc.controller.BaseBeanController;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.aspectj.enums.LogType;
import com.sunseagear.wind.modules.oss.entity.Attachment;
import com.sunseagear.wind.modules.oss.service.IAttachmentService;
import com.sunseagear.wind.utils.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;

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
@RequestMapping("oss/attachment")
@RequiresPermissions("oss:attachment")
@Log(title = "附件日志")
public class AttachmentController extends BaseBeanController<Attachment> {

    @Autowired
    private IAttachmentService attachmentService;

    /**
     * 根据页码和每页记录数，以及查询条件动态加载数据
     *
     * @param request
     * @throws IOException
     */
    @GetMapping(value = "list")
    @Log(logType = LogType.SELECT)
    @RequiresPermissions("oss:attachment:list")
    public String list(HttpServletRequest request) throws IOException {
        //加入条件
        QueryWrapper<Attachment> entityWrapper = new QueryWrapper<>();
        entityWrapper.orderByDesc( "upload_time");
        String fileName = request.getParameter("fileName");
        if (!StringUtils.isEmpty(fileName)) {
            entityWrapper.like("file_name", fileName);
        }
        // 预处理
        Page pageBean = attachmentService.selectPage(PageRequest.getPage(), entityWrapper);
        return Response.successPageJson(pageBean);
    }

    @PostMapping("delete/{id}")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("oss:attachment:delete")
    public String delete(@PathVariable("id") String id) {
        attachmentService.deleteById(id);
        return Response.ok();
    }

    @PostMapping("batch/delete")
    @Log(logType = LogType.DELETE)
    @RequiresPermissions("oss:attachment:delete")
    public String batchDelete(@RequestParam(value = "ids", required = false) String[] ids) {
        List<Serializable> idList = java.util.Arrays.asList(ids);
        attachmentService.deleteBatchIds(idList);
        return Response.ok("删除成功");
    }

    /**
     * @param request,file,directory
     * @return
     * @title: ajaxUpload
     * @description: 文件上传
     * @return: AjaxUploadResponse
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String upload(HttpServletRequest request, MultipartFile[] file, @RequestParam(required = false, defaultValue = "") String dir) {
        return attachmentService.upload(request, file, dir);
    }


}

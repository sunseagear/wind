package com.sunseagear.wind.common.controller;

import com.sunseagear.common.http.Response;
import com.sunseagear.common.utils.jcaptcha.JCaptcha;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * jcaptcha 验证码验证
 */
@RestController
public class JCaptchaValidateController {

    @GetMapping(value = "/jcaptcha/validate")
    public String jqueryValidationEngineValidate(HttpServletRequest request,
                                                 @RequestParam(value = "fieldKey", required = false) String fieldKey,
                                                 @RequestParam(value = "fieldValue", required = false) String fieldValue) {
        Response response = null;
        if (JCaptcha.hasCaptcha(request, fieldValue) == false) {
            return Response.successJson("jcaptcha.validate.error", fieldKey);
//            response = Response.error(MessageUtils.getMessage("jcaptcha.validate.error"));
//            response.put("fieldKey", fieldKey);

        } else {
            return Response.successJson("jcaptcha.validate.success", fieldKey);
//
//            response = Response.error(MessageUtils.getMessage("jcaptcha.validate.success"));
//            response.put("fieldKey", fieldKey);
        }
//        return response;
    }

    @GetMapping(value = "/jcaptcha.jpg")
    public void jqueryValidationEngineValidate(HttpServletRequest request,
                                               HttpServletResponse response)
            throws ServletException, IOException {
        response.setDateHeader("Expires", 0L);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");

        String id = request.getSession().getId();
        BufferedImage bi = JCaptcha.captchaService.getImageChallengeForID(id);
        ServletOutputStream out = response.getOutputStream();
        try {
            ImageIO.write(bi, "jpg", out);
            out.flush();
        } finally {
            out.close();
        }
    }
}

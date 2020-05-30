package com.sunseagear.wind.modules.sys.controller;

import com.sunseagear.common.utils.StringUtils;
import com.sunseagear.wind.utils.ThemeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    /**
     * 跳转到后台首页
     *
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("redirect:/admin");
    }

    /**
     * Coookie设置
     */
    @RequestMapping(value = "theme/{theme}")
    public String themeCookie(@PathVariable String theme, HttpServletRequest request) {
        if (StringUtils.isNotBlank(theme)) {
            ThemeUtils.setTheme(theme);
        }
        return "redirect:" + request.getParameter("url");
    }

    @RequestMapping("main")
    public String main() {
        return "modules/sys/index/main";
    }

}

package com.sunseagear.wind.modules.sys.json;

import com.sunseagear.common.utils.JsonUtils;
import com.sunseagear.wind.aspectj.annotation.Log;
import com.sunseagear.wind.utils.DictUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/json/dict")
@Log(title = "字典管理")
public class DictJsonController {

    @GetMapping(value = "")
    public String get() {
        try {
            //放入数据字典
            return JsonUtils.successMessage(DictUtils.getDict());
        } catch (Exception e) {
            e.printStackTrace();
            return JsonUtils.failMessage("获取失败");
        }
    }


}

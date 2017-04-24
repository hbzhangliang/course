package com.cubic.restful;

import com.cubic.base.entity.BaseJsonResult;
import com.cubic.util.json.JSONHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by liang_zhang on 2015/9/23.
 */
@RestController
@RequestMapping("restful")
public class RestfulAct {

  @RequestMapping("test")
  public String test() {
    return JSONHelper.formatObject(new BaseJsonResult());
  }
}

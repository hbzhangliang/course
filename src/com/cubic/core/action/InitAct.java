package com.cubic.core.action;

import com.cubic.base.action.BaseAct;
import com.cubic.util.codeHelper.PropertiesReader;
import com.cubic.core.util.DBHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by liang_zhang on 2014/9/19.
 */
@Controller
@RequestMapping("/sys/init")
public class InitAct extends BaseAct{

  @RequestMapping("ajDataClear")
  @ResponseBody
  public String ajDataClear(String tableNames) {
    return PropertiesReader.getValueWithPH("msg.sys.dataClearDone", new String[]{dbHandler.cleanData(tableNames) + ""});
  }

  @RequestMapping("list")
  public ModelAndView list() {
    return new ModelAndView("/sys/init/list");
  }

  @Resource
  private DBHandler dbHandler;
}

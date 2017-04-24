package com.cubic.core.manager.impl;

import com.cubic.base.entity.BaseJsonResult;
import com.cubic.base.manager.impl.BaseMngImpl;
import com.cubic.core.entity.Lookups;
import com.cubic.core.manager.LookupsMng;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-11.
 */
@Service("lookupsMng")
@Transactional
public class LookupsMngImpl extends BaseMngImpl<Lookups> implements LookupsMng {

  @Override
  public List<Lookups> getCacheLookupsByCode(String cCode) {
    return find("from Lookups where parent.cCode = ?0 order by seq,lCode", cCode);
  }

  @Override
  public List<Lookups> getCacheLookupsByCodeOrder(String cCode) {
    return find("from Lookups where parent.cCode = ?0 order by seq", cCode);
  }

  @Override
  public List<Lookups> getLookupsByCode(String cCode, String except) {
    return find("from Lookups where 1 = 1 and parent.cCode = ?0 and lCode not in (?1) order by lCode", cCode, except);
  }

  public List<Lookups> getCategory() {
    return find("from Lookups where 1 = 1 and parent is null and cName is not null");
  }

  @Override
  public String getScan(String category, String lookupsCode) {
    return find("from Lookups where 1 = 1 and parent.cCode = ?0 and lCode = ?1", category, lookupsCode).get(0).getlName();
  }

  @Override
  public String getJSONLookups(String cate) {
    //return JSONHelper.formatObject(getCacheLookupsByCode(cate));
	  List<Lookups> list=getCacheLookupsByCode(cate);
	  JsonConfig jc = new JsonConfig();
	  jc.setExcludes(new String[]{"parent","module","children"});
	  return JSONArray.fromObject(list, jc).toString();
  }

  @Override
  public String getCateByModuleId(String moduleId, String beanId) {
    Map<String, Object> result = new BaseJsonResult();
    List<Map<String, Object>> list = jdbcTemplate.queryForList("select pid as id,CATEGORY_NAME as name from t_core_lookups where MODULE_ID = ? and PARENT_ID is null order by CATEGORY_CODE", moduleId);
    result.put("data", list);
    if (StringUtils.isNotEmpty(beanId))
      result.put("parentId", jdbcTemplate.queryForList("select PARENT_ID as parent from t_core_lookups where pid = ?", beanId).get(0).get("parent").toString());
    return JSONObject.fromObject(result).toString();
  }
}

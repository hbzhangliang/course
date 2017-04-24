package com.cubic.core.manager;

import com.cubic.base.manager.BaseMng;
import com.cubic.core.entity.Lookups;

import java.util.List;

/**
 * Created by liang_zhang on 14-7-11.
 */

public interface LookupsMng extends BaseMng<Lookups> {

  List<Lookups> getCacheLookupsByCode(String cCode);

  List<Lookups> getCacheLookupsByCodeOrder(String cCode);
  
  /**
   * 获得字典项，不包括except中出现的code
   *
   * @param cCode  字典类别编码
   * @param except 不包括该code集合
   * @return 字典列表
   */
  List<Lookups> getLookupsByCode(String cCode, String except);

  List<Lookups> getCategory();

  String getScan(String category, String lookupsCode);

  String getJSONLookups(String cate);

  String getCateByModuleId(String moduleId, String beanId);
  
  
}

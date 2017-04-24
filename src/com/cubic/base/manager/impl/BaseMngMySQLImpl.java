package com.cubic.base.manager.impl;

import com.cubic.base.entity.BaseEntity;
import com.cubic.base.entity.BaseJsonResult;
import net.sf.json.JSONObject;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

/**
 * Created by liang_zhang on 2015/11/17.
 */
@Transactional
public class BaseMngMySQLImpl<T extends BaseEntity> extends BaseMngImpl<T> {

  @Override
  public String sqlQueryByPage(String sql, Integer page, Integer pageSize, Object... params) {
    int totalRow = 0;
    if (!jdbcTemplate.queryForList("select found_rows() as totalRow from (" + sql + ") as alltable", params).isEmpty())
      totalRow = ((Long) (jdbcTemplate.queryForList("select found_rows() as totalRow from (" + sql + ") as alltable", params).get(0).get("totalRow"))).intValue();
    Map<String, Object> result = new BaseJsonResult();
    result.put("data", jdbcTemplate.queryForList(sql + " LIMIT " + (getStart(page, pageSize) - 1) + "," + pageSize, params));
    result.put("totalRow", totalRow);
    result.put("page", page);
    result.put("totalPage", totalRow % pageSize == 0 ? (totalRow / pageSize) : (totalRow / pageSize + 1));
    return JSONObject.fromObject(result).toString();
  }
}

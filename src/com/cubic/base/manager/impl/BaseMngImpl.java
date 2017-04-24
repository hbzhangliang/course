package com.cubic.base.manager.impl;

import com.cubic.base.dao.BaseDao;
import com.cubic.base.entity.BaseEntity;
import com.cubic.base.entity.BaseJsonResult;
import com.cubic.base.manager.BaseMng;
import com.cubic.util.codeHelper.PropertiesReader;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-17.
 */
@Transactional
public class BaseMngImpl<T extends BaseEntity> implements BaseMng<T> {

  private Class<T> getEntityClass() {
    return (Class<T>) (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]);
  }

  private String getEntityName() {
    String className = getEntityClass().getName();
    return className.substring(className.lastIndexOf(".") + 1);
  }

  @Override
  public void saveOrUpdate(T t) {
    if (StringUtils.isEmpty(t.getId()))
      t.setId(null);
    baseDao.saveOrUpdate(t);
  }

  @Override
  public void merge(T t) {
    if (StringUtils.isEmpty(t.getId()))
      t.setId(null);
    baseDao.merge(t);
  }

  public T save(T t) {
    return baseDao.save(t);
  }

  public T load(Serializable id) {
    return baseDao.load(getEntityClass(), id);
  }

  public T get(Serializable id) {
    return baseDao.get(getEntityClass(), id);
  }

  public List<T> getAll() {
    return baseDao.find("from " + getEntityName() + " where 1 = 1");
  }

  public List<T> getAllOrderBy(String orderBy) {
    return baseDao.find("from " + getEntityName() + " where 1 = 1 order by " + (StringUtils.isEmpty(orderBy) ? " id desc" : orderBy));
  }

  public List<T> findOrderBy(String hql, String orderBy) {
    return baseDao.find(hql + " order by " + (StringUtils.isEmpty(orderBy) ? " id desc" : orderBy));
  }


  /**
   * 整合hql语句查询
   *
   * @param t   对象
   * @param hql 原查询语句
   * @return 对象列表的查询结果
   * tips: 查询参数加载说明
   * 1、所有查询参数封装在t.params的map中，遍历map.keySet()获得查询参数的键值对，包括order by
   * 2、如果有ign_开头，则忽略该结果
   * 3、如果key中包含Date,表示日期范围，根据是Date1还是Date2,查询出大于等于Date1小于Date2的结果，否则就直接等于
   * 4、如果key中包含逗号，表示多个值，用hql做in范围查询
   * 5、如果key中包含以eq_开头，用等于查询
   * 6、否则都用like查询
   * 7、最后拼接t.orderBy中的排序参数，为空则按ID排序
   */
  @Override
  public List<T> mergeHQL(T t, String hql) {
    StringBuilder sb = new StringBuilder("from ");
    List<Object> params = new ArrayList<>();
    sb.append(getEntityName());
    sb.append(" where 1=1 ");
    if (!t.getParams().isEmpty()) {
      Map<String, String> paramMap = t.getParams();
      int i = 0;
      for (String key : paramMap.keySet()) {
        if (!StringUtils.isEmpty(paramMap.get(key)) && !key.startsWith("ign_"))
          if (key.contains("Date")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if ("1".equals(key.substring(key.length() - 1))) {
              sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" >=?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            } else if ("2".equals(key.substring(key.length() - 1))) {
              sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" <=?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            } else {
              sb.append(" and ").append(key).append(" =?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            }
            i++;
          } else {
            if (paramMap.get(key).contains(",")) {
              sb.append(" and ").append(key).append(" in (");
              for (String subValue : paramMap.get(key).split(",")) {
                sb.append("?").append(i).append(",");
                params.add(i, subValue);
                i++;
              }
              sb.deleteCharAt(sb.length() - 1).append(")");
            } else if (key.startsWith("eq_")) {
              sb.append(" and ").append(key.substring(3)).append(" =?").append(i);
              params.add(i, paramMap.get(key));
              i++;
            } else if (key.startsWith("bool_")) {
              sb.append(" and ").append(key.substring(5)).append(" =?").append(i);
              params.add(i, "1".equals(paramMap.get(key)));
              i++;
            } else {
              sb.append(" and ").append(key).append(" like?").append(i);
              params.add(i, "%" + paramMap.get(key) + "%");
              i++;
            }
          }
      }
    }
    if (!StringUtils.isEmpty(hql))
      sb.append(hql);
    sb.append(" order by ");
    sb.append(StringUtils.isEmpty(t.getOrderBy()) ? "id desc" : t.getOrderBy());
    int totalRow = count("select count(*) " + sb.toString(), params);
    t.getPm().setTotalRows(totalRow);
    return baseDao.find(sb.toString(), params, t.getPm().getPage(), t.getPm().getPageSize());
  }

  @Override
  public List<T> mergeHQLwithOutPage(T t, String hql) {
    StringBuilder sb = new StringBuilder("from ");
    List<Object> params = new ArrayList<Object>();
    sb.append(getEntityName());
    sb.append(" where 1=1 ");
    if (!t.getParams().isEmpty()) {
      Map<String, String> paramMap = t.getParams();
      int i = 0;
      for (String key : paramMap.keySet()) {
        if (!StringUtils.isEmpty(paramMap.get(key)) && !key.startsWith("ign_"))
          if (key.contains("Date")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if ("1".equals(key.substring(key.length() - 1))) {
              sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" >=?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            } else if ("2".equals(key.substring(key.length() - 1))) {
              sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" <=?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            } else {
              sb.append(" and ").append(key).append(" =?").append(i);
              try {
                params.add(i, sdf.parse(paramMap.get(key)));
              } catch (ParseException e) {
                e.printStackTrace();
              }
            }
            i++;
          } else {
            if (paramMap.get(key).contains(",")) {
              sb.append(" and ").append(key).append(" in (");
              for (String subValue : paramMap.get(key).split(",")) {
                sb.append("?").append(i).append(",");
                params.add(i, subValue);
                i++;
              }
              sb.deleteCharAt(sb.length() - 1).append(")");
            } else if (key.startsWith("eq_")) {
              sb.append(" and ").append(key.substring(3)).append(" =?").append(i);
              // params.add(i, Integer.parseInt(paramMap.get(key)));
              params.add(i, paramMap.get(key));
              i++;
            } else {
              sb.append(" and ").append(key).append(" like?").append(i);
              params.add(i, "%" + paramMap.get(key) + "%");
              i++;
            }
          }
      }
    }
    if (!StringUtils.isEmpty(hql))
      sb.append(hql);
    sb.append(" order by ");
    sb.append(StringUtils.isEmpty(t.getOrderBy()) ? "id desc" : t.getOrderBy());
    int totalRow = count("select count(*) " + sb.toString(), params);
    t.getPm().setTotalRows(totalRow);
    return baseDao.find(sb.toString(), params);
  }

  @Override
  public List<Object> createHql(String hql) {
    return baseDao.getCurrentSession().createQuery(hql).list();
  }

  public List<T> findBy(String key, String value, String orderBy) {
    StringBuilder sb = new StringBuilder("from ")
        .append(getEntityName())
        .append(" where 1 = 1 and ")
        .append(key)
        .append(" like ?0 order by ")
        .append(StringUtils.isEmpty(orderBy) ? "id" : orderBy);
    return find(sb.toString(), value);
  }


  @Override
  public void del(String ids) {
    for (String id : ids.split(","))
      baseDao.delete(load(id));
  }

  @Override
  public String batchOpr(char op, String val, String ids) {
    int count = 0;
    switch (op) {
      case 'i':
        for (String id : ids.split(",")) {
          if (!StringUtils.isBlank(id)) {
            T t = load(id);
            saveOrUpdate(t);
            count++;
          }
        }
    }
    return PropertiesReader.getValueWithPH("msg." + getEntityName() + ".batchOpr"
        , ("0".equals(val) ? "禁用" : "发布") + count);
  }

  public List<T> find(String hql, Object... values) {
    return baseDao.find(hql, values);
  }

  @Override
  public List<T> topFind(String hql, Integer maxResult, Object... values) {
    return baseDao.topFind(hql, maxResult, values);
  }

  public List<T> find(String hql, Map<String, Object> values) {
    return baseDao.find(hql, values);
  }

  @Override
  public List<T> find(String hql, Integer page, Integer rows, Object... values) {
    return baseDao.find(hql, values, page, rows);
  }

  @Override
  public Integer executeHql(String hql, Object[] param) {
    return baseDao.executeHql(hql, param);
  }

  @Override
  public boolean checkDuplicated(String id, String key, String value) {
    if (StringUtils.isBlank(id)) {//新增
      return find("select " + key + " from " + getEntityName() + " where " + key + " = ?0 ", value).size() > 0;
    } else {//修改
      return find("select " + key + ",id " + "from " + getEntityName() + " where " + key + " = ?0 and id != ?1 ", value, id).size() > 0;
    }
  }

  @Override
  public Integer count(String hql, List<Object> param) {
    return baseDao.count(hql, param);
  }

  @Override
  public T initBean(T queryBean) {
    T t;
    if (StringUtils.isEmpty(queryBean.getId())) {
      try {
        t = (T) queryBean.getClass().newInstance();
        t.setParams(queryBean.getParams());
        t.setPm(queryBean.getPm());
        t.setOp(queryBean.getOp());
        return t;
      } catch (InstantiationException e) {
        e.printStackTrace();
      } catch (IllegalAccessException e) {
        e.printStackTrace();
      }
    } else {
      t = load(queryBean.getId());
      t.setParams(queryBean.getParams());
      t.setPm(queryBean.getPm());
      t.setOp(queryBean.getOp());
      return t;
    }
    return null;
  }

  public void refresh(T t) {
    baseDao.getCurrentSession().flush();
    baseDao.getCurrentSession().refresh(t);
  }

  /**
   * sql脚本查询
   *
   * @param sql     原查询条件
   * @param params  参数：按key：value的形式加载
   * @param orderBy 排序参数
   * @return 查询结果
   * @tips: 参数key说明：
   * 1、以str_开头，字符串，like查询；
   * 2、以eq_开头，对象，=查询
   * 3、其他的类型继续添加
   */
  @Override
  public List<Map<String, Object>> sqlQuery(String sql, Map<String, Object> params, String orderBy) {
    List<Object> l = new ArrayList<Object>();
    StringBuilder sb = new StringBuilder(sql);
    for (String key : params.keySet()) {
      if (params.get(key) != null)
        if (key.contains("time") && (StringUtils.isNotEmpty((String) params.get(key)))) {
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
          if ("1".equals(key.substring(key.length() - 1))) {
            sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" >=?");
            try {
              l.add(sdf.parse((String) params.get(key)));
            } catch (ParseException e) {
              e.printStackTrace();
            }
          } else if ("2".equals(key.substring(key.length() - 1))) {
            sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" <=?");
            try {
              l.add(sdf.parse((String) params.get(key)));
            } catch (ParseException e) {
              e.printStackTrace();
            }
          }
        } else {
          if (StringUtils.isNotEmpty((String) params.get(key)))
            if (key.contains("eq_")) {
              sb.append(" and ").append(key.substring(3)).append(" = ?");
              l.add(params.get(key));
            } else {
              sb.append(" and ").append(key).append(" like ?");
              l.add("%" + params.get(key) + "%");
            }
        }
    }
    sb.append(" order by ").append(StringUtils.isEmpty(orderBy) ? " pid" : orderBy);
    return jdbcTemplate.queryForList(sb.toString(), l.toArray());
  }

  private void mergeSql(StringBuilder sb, T t, List<Object> l) {
    for (String key : t.getParams().keySet()) {
      if (StringUtils.isNotEmpty(t.getParams().get(key)))
        if (key.contains("eq_")) {
          sb.append(" and ").append(key.substring(3)).append(" = ?");
          l.add(t.getParams().get(key));
        } else if (key.contains("Date")) {
          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
          if ("1".equals(key.substring(key.length() - 1))) {
            sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" >=?");
            try {
              l.add(sdf.parse(t.getParams().get(key)));
            } catch (ParseException e) {
              e.printStackTrace();
            }
          } else if ("2".equals(key.substring(key.length() - 1))) {
            sb.append(" and ").append(key.substring(0, key.length() - 1)).append(" <=?");
            try {
              l.add(sdf.parse(t.getParams().get(key)));
            } catch (ParseException e) {
              e.printStackTrace();
            }
          } else {
            sb.append(" and ").append(key).append(" =?");
            try {
              l.add(sdf.parse(t.getParams().get(key)));
            } catch (ParseException e) {
              e.printStackTrace();
            }
          }
        } else {
          sb.append(" and ").append(key).append(" like ?");
          l.add("%" + t.getParams().get(key) + "%");
        }
    }
  }

  @Override
  public List<Map<String, Object>> sqlQuery(String sql, T t, String orderBy) {
    List<Object> l = new ArrayList<Object>();
    StringBuilder sb = new StringBuilder(sql);
    mergeSql(sb, t, l);
    sb.append(" order by ").append(StringUtils.isEmpty(orderBy) ? "pid" : orderBy);
    return jdbcTemplate.queryForList(sb.toString(), l.toArray());
  }

  @Override
  public List<Map<String, Object>> sqlQueryByPage(String sql, T t, String orderBy) {
    List<Object> l = new ArrayList<Object>();
    StringBuilder sb = new StringBuilder(sql);
    mergeSql(sb, t, l);
    sb.append(" order by ").append(StringUtils.isEmpty(orderBy) ? "pid" : orderBy);
    int totalRow = ((Long) (jdbcTemplate.queryForList("select max(rownum) as totalrow from (" + sb.toString() + ")", l.toArray()).get(0).get("totalrow"))).intValue();
    String sqlCore = "select * from (select temp.*,rownum num from (" + sb.toString() + ") temp where rownum <= " + t.getPm().getEnd(totalRow, t.getPm().getPage()) + ") where num>=" + t.getPm().getStart(t.getPm().getPage());
    return jdbcTemplate.queryForList(sqlCore, l.toArray());
  }

  @Override
  public String sqlQueryByPage(String sql, Integer page, Integer pageSize, Object... params) {
    StringBuilder sb = new StringBuilder(sql);
    int totalRow = ((Long) (jdbcTemplate.queryForList("select max(rownum) as totalrow from (" + sb.toString() + ")", params).get(0).get("totalrow"))).intValue();
    String sqlCore = "select * from (select temp.*,rownum num from (" + sb.toString() + ") temp where rownum <= " + getEnd(totalRow, page, pageSize) + ") where num>=" + getStart(page, pageSize);
    Map<String, Object> result = new BaseJsonResult();
    result.put("data", jdbcTemplate.queryForList(sqlCore, params));
    result.put("totalRow", totalRow);
    result.put("page", page);
    return JSONObject.fromObject(result).toString();
  }

  @Override
  public String ajaxUpdate(String tableName, String id, String fieldName, Boolean fieldValue) {
    jdbcTemplate.update("update " + tableName + " set " + fieldName + " = " + (fieldValue ? 1 : 0) + ",updatetime=now() where pid = ?", id);
    return JSONObject.fromObject(new BaseJsonResult()).toString();
  }

  @Override
  public String ajaxUpdateBatch(String tableName, String fieldName,
  		String fieldValue, String conditionName,String conditionValue) {
	  jdbcTemplate.update("update " + tableName + " set " + fieldName + " = '" + fieldValue  + "' where "+conditionName+"  in  "+conditionValue);
	  return JSONObject.fromObject(new BaseJsonResult()).toString();
  }
  
  public Integer getStart(Integer page, Integer pageSize) {
    return (page - 1) * pageSize + 1;
  }

  public Integer getEnd(int totalRow, Integer page, Integer pageSize) {
    if (totalRow > 0)
      return ((page - 1) * pageSize + pageSize) < totalRow
          ? ((page - 1) * pageSize + pageSize)
          : totalRow;
    else
      return 0;
  }

  @Resource
  public BaseDao<T> baseDao;

  @Resource
  public JdbcTemplate jdbcTemplate;

}

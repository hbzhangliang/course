package com.cubic.base.manager;

import com.cubic.base.entity.BaseEntity;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-17.
 */
public interface BaseMng<T extends BaseEntity> {
  void saveOrUpdate(T t);

  void merge(T t);

  T save(T t);

  T get(Serializable id);

  T load(Serializable id);

  void del(String ids);

  List<T> getAll();

  List<T> getAllOrderBy(String orderBy);

  List<T> find(String hql, Object... values);

  List<T> topFind(String hql, Integer maxResult, Object... values);

  List<T> find(String hql, Map<String, Object> params);

  List<T> findBy(String key, String value, String orderBy);

  List<T> find(String hql, Integer page, Integer rows, Object... values);

  List<T> findOrderBy(String hql, String orderBy);

  List<T> mergeHQL(T t, String hql);

  List<T> mergeHQLwithOutPage(T t, String hql);

  List<Object> createHql(String hql);

  String batchOpr(char op, String val, String ids);

  Integer executeHql(String hql, Object[] param);

  boolean checkDuplicated(String id, String key, String value);

  Integer count(String hql, List<Object> param);

  T initBean(T queryBean);

  void refresh(T t);

  List<Map<String, Object>> sqlQuery(String sql, Map<String, Object> params, String orderBy);

  List<Map<String, Object>> sqlQuery(String sql, T t, String orderBy);

  List<Map<String, Object>> sqlQueryByPage(String sql, T t, String orderBy);

  String sqlQueryByPage(String sql, Integer page, Integer pageSize, Object... params);

  String ajaxUpdate(String tableName, String id, String fieldName, Boolean fieldValue);
  
  String ajaxUpdateBatch(String tableName,String fieldName,String fieldValue,String conditionName,String conditionValue);
  
}
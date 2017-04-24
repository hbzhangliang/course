package com.cubic.base.dao.impl;

import com.cubic.base.dao.BaseDao;
import com.cubic.base.entity.BaseEntity;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by liang_zhang on 14-7-11.
 */
@Repository("baseDao")
public class BaseDaoImpl<T extends BaseEntity> implements BaseDao<T> {

  @Autowired
  private SessionFactory sessionFactory;

  public Session getCurrentSession() {
    return sessionFactory.getCurrentSession();
  }

  public T load(Class clazz, Serializable id) {
    return (T) getCurrentSession().load(clazz, id);
  }

  public T save(T o) {
    this.getCurrentSession().save(o);
    return o;
  }

  public void delete(T o) {
    getCurrentSession().delete(o);
  }

  public void update(T o) {
    getCurrentSession().update(o);
  }

  public void saveOrUpdate(T o) {
    getCurrentSession().saveOrUpdate(o);
  }

  public void merge(T o) {
    getCurrentSession().merge(o);
  }

  public List<T> find(String hql) {
    return getCurrentSession().createQuery(hql).list();
  }

  public List<T> find(String hql, Object[] param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.length > 0) {
      for (int i = 0; i < param.length; i++) {
        q.setParameter("" + i, param[i]);
      }
    }
    return q.list();
  }

  public List<T> find(String hql, List<Object> param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.size() > 0) {
      for (int i = 0; i < param.size(); i++) {
        q.setParameter("" + i, param.get(i));
      }
    }
    return q.list();
  }

  public List<T> find(String hql, Map<String, Object> params) {
    Query q = getCurrentSession().createQuery(hql);
    if (params != null && !params.isEmpty()) {
      for (String key : params.keySet())
        if (String.class.equals(params.get(key).getClass())) {
          if (!StringUtils.isEmpty((String) params.get(key)))
            q.setParameter(key, params.get(key));
        } else
          q.setParameter(key, params.get(key));
    }
    return q.list();
  }

  @Override
  public List<T> topFind(String hql, Integer maxResult, Object[] values) {
    Query q = getCurrentSession().createQuery(hql);
    if (values != null && values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        q.setParameter("" + i, values[i]);
      }
    }
    q.setMaxResults(maxResult);
    return q.list();
  }

  public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
    if (page == null || page < 1) {
      page = 1;
    }
    if (rows == null || rows < 1) {
      rows = 10;
    }
    Query q = this.getCurrentSession().createQuery(hql);
    if (param != null && param.length > 0) {
      for (int i = 0; i < param.length; i++) {
        q.setParameter(i, param[i]);
      }
    }
    return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
  }

  public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
    if (page == null || page < 1) {
      page = 1;
    }
    if (rows == null || rows < 1) {
      rows = 10;
    }
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.size() > 0) {
      for (int i = 0; i < param.size(); i++) {
        q.setParameter("" + i, param.get(i));
      }
    }
    return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
  }

  public T get(Class<T> c, Serializable id) {
    return (T) getCurrentSession().get(c, id);
  }

  public T get(String hql, Object[] param) {
    List<T> l = find(hql, param);
    if (l != null && l.size() > 0) {
      return l.get(0);
    } else {
      return null;
    }
  }

  public T get(String hql, List<Object> param) {
    List<T> l = find(hql, param);
    if (l != null && l.size() > 0) {
      return l.get(0);
    } else {
      return null;
    }
  }

  public Integer count(String hql) {
    return (Integer) getCurrentSession().createQuery(hql).uniqueResult();
  }

  public Long count(String hql, Object[] param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.length > 0) {
      for (int i = 0; i < param.length; i++) {
        q.setParameter(i, param[i]);
      }
    }
    return (Long) q.uniqueResult();
  }

  public Integer count(String hql, List<Object> param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.size() > 0) {
      for (int i = 0; i < param.size(); i++) {
        q.setParameter("" + i, param.get(i));
      }
    }
    return Integer.parseInt(String.valueOf(q.uniqueResult()));
  }

  public Integer count(String hql, Map<String, Object> params) {
    Query q = getCurrentSession().createQuery(hql);
    if (params != null && !params.isEmpty()) {
      for (String key : params.keySet())
        if (String.class.equals(params.get(key).getClass())) {
          if (!StringUtils.isEmpty((String) params.get(key)))
            q.setParameter(key, params.get(key));
        } else
          q.setParameter(key, params.get(key));
    }
    return Integer.parseInt(String.valueOf(q.uniqueResult()));
  }

  public Integer executeHql(String hql) {
    return getCurrentSession().createQuery(hql).executeUpdate();
  }

  public Integer executeHql(String hql, Object[] param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.length > 0) {
      for (int i = 0; i < param.length; i++) {
        q.setParameter(i, param[i]);
      }
    }
    return q.executeUpdate();
  }

  public Integer executeHql(String hql, List<Object> param) {
    Query q = getCurrentSession().createQuery(hql);
    if (param != null && param.size() > 0) {
      for (int i = 0; i < param.size(); i++) {
        q.setParameter(i, param.get(i));
      }
    }
    return q.executeUpdate();
  }

  public List<T> createQuery(String hql, Map<String, String> params) {
    Query q = getCurrentSession().createQuery(hql);
    if (!params.isEmpty()) {
      for (String key : params.keySet()) {
        q.setString(key, "%" + params.get(key) + "%");
      }
    }
    return q.list();
  }
}

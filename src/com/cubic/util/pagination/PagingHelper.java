package com.cubic.util.pagination;

import com.cubic.base.entity.BaseEntity;

import java.util.List;

/**
 * Created by liang_zhang on 14-8-15.
 */

public class PagingHelper<T extends BaseEntity> {
  public void initPaging(T t, List<T> list) {
    if (t.getPm().getTotalRows() != null && t.getPm().getTotalRows() != list.size())
      t.getPm().setPage(1);
    t.getPm().setTotalRows(list.size());
  }
}

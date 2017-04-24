package com.cubic.core.util;

import com.cubic.core.entity.Menu;
import java.util.Comparator;

/**
 * Created by liang_zhang on 2015/03/16.
 */
public class ComparatorImpl implements Comparator<Menu> {
  @Override
  public int compare(Menu o1, Menu o2) {
    String age1 = o1.getSeq();
    String age2 = o2.getSeq();
    if (age1.compareTo(age2) > 0) {
      return 1;
    } else if (age1.compareTo(age2) < 0) {
      return -1;
    } else {
      return 0;
    }
  }
}

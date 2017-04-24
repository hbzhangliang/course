package com.cubic.util.codegen;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.HibernateException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.*;
import java.util.*;

/**
 * Created by liang_zhang on 14-7-21.
 */
public class EntityGen {

  private static final Logger log = LogManager.getLogger();
  private static final String[] CONTEXT_CONFIG_LOCATION = {"classpath*:s-context.xml"};

  public static void gen(String entityClassName, String tableName, String[] excludeFields) throws IOException, SQLException {
    StringBuilder code = new StringBuilder();
    code.append(EntityGenUtil.packageCode(entityClassName)).append(";\n\n");
    code.append("import com.cubic.base.entity.BaseEntity;\n");
    code.append("import org.hibernate.annotations.Where;\n");
    List<ColumnBean> list = getColumns(tableName, excludeFields);
    Set<String> set = EntityGenUtil.importsCode(list);
    for (String aSet : set) {
      code.append(aSet);
    }
    code.append("\n");
    code.append("@Entity\n");
    code.append("@Table(name=\"").append(tableName).append("\")\n");
    code.append("public class ")
        .append(EntityGenUtil.simpleClassName(entityClassName))
        .append(" extends BaseEntity{\n\n");
    int n = list.size();
    for (ColumnBean cb : list) {
      code.append(EntityGenUtil.propertyCode(cb)).append("\n\n");
    }

    for (ColumnBean cb : list) {
      code.append(EntityGenUtil.setterCode(cb)).append("\n\n");
      code.append(EntityGenUtil.getterCode(cb)).append("\n\n");
    }
    code.append("}");
    String filePath = System.getProperty("user.dir")
        + "\\src\\"
        + entityClassName.replaceAll("\\.", "\\\\")
        + ".java";
    File file = new File(filePath);
    file.getParentFile().mkdirs();
    OutputStreamWriter fw = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
    fw.write(code.toString());
    fw.flush();
    fw.close();
  }

  public static List<ColumnBean> getColumns(
      String tableName,
      String[] filterProperty) throws HibernateException, SQLException {
    ApplicationContext mContext = new ClassPathXmlApplicationContext(CONTEXT_CONFIG_LOCATION);
    ComboPooledDataSource ds = (ComboPooledDataSource) mContext.getBean("dataSource");
       /* DriverManagerDataSource ds = (DriverManagerDataSource) mContext.getBean("dataSource1");*/
    Connection connection = ds.getConnection();
    List<ColumnBean> list = new ArrayList<ColumnBean>();
    String sql = "select * from " + tableName;
    ResultSet rs = connection.createStatement().executeQuery(sql);
    ResultSetMetaData rsmd = rs.getMetaData();
    int n = rsmd.getColumnCount();
    DatabaseMetaData dbTable = connection.getMetaData();
    ResultSet rsColumn = null;
    for (int i = 1; i <= n; i++) {
      String name = rsmd.getColumnName(i);
      log.info("列名=" + name);
      if (EntityGenUtil.contains(filterProperty, name)) {
        continue;
      }
      ColumnBean bean = new ColumnBean();
      bean.setName(name);
      bean.setType(rsmd.getColumnClassName(i));
      rsColumn = dbTable.getColumns(null, null, tableName, null);
      //Map<String, String> comments = getComment(tableName, connection);
      bean.setComment(null);
      list.add(bean);
    }
    assert rsColumn != null;
    rsColumn.close();
    rs.close();
    connection.close();
    mContext = null;
    return list;
  }

  private static Map<String, String> getComment(
      String tableName,
      Connection conn) throws SQLException {
    Map<String, String> map = new HashMap<String, String>();
    String sql = "select column_name,comments from user_col_comments where table_name=upper('"
        + tableName
        + "')";
    ResultSet rs = conn.createStatement().executeQuery(sql);
    while (rs.next()) {
      map.put(rs.getString("column_name"), rs.getString("comments"));
    }
    return map;
  }
}

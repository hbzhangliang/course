package com.cubic.util.codeHelper;

import java.text.MessageFormat;
import java.util.Properties;

/**
 * Created by liang_zhang on 14-5-28.
 */
public class PropertiesReader {

  private final static String Properties_File_Path = "resource.properties";

  /**
   * 此方法只支持读取src目录property文件
   *
   * @param key 要读取的配置键
   * @return String 配置值
   */
  public static String getPropertiesValue(String key) {
    Properties props = new Properties();
    try {
      props.load(PropertiesReader.class.getClassLoader().getResourceAsStream(Properties_File_Path));
      return props.getProperty(key);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  /**
   * 拼接内容，参数为内容KEY+参数数组
   *
   * @param key  配置文件中的key
   * @param args 占位符替换内容的数组
   * @return String
   */
  @SuppressWarnings({"unchecked", "varargs"})
  public static String getValueWithPH(String key, String... args) {
    return MessageFormat.format(getPropertiesValue(key), args);
  }
}

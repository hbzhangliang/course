package com.cubic.util.codeHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Calendar;

/**
 * Created by liang_zhang on 14-6-10.
 */
@Service
public class CustomerCoder {

  /**
   * 补位0
   *
   * @param num 一共几位
   * @param str 原字符串
   * @return 新字符串
   */
  public static String convertInt2String(int num, String str) {
    char[] ary1 = str.toCharArray();
    String str0 = "";
    for (int i = 0; i < num; i++) {
      str0 += "0";
    }
    char[] ary2 = str0.toCharArray();
    System.arraycopy(ary1, 0, ary2, ary2.length - ary1.length, ary1.length);
    return new String(ary2);
  }

  /**
   * MD5编码
   *
   * @param str 要加密的字符串
   * @return 加密后的字符串
   */
  public String encoderMD5(String str) {
    MessageDigest md;
    try {
      md = MessageDigest.getInstance("MD5");
      md.update(str.getBytes());
      return new BigInteger(1, md.digest()).toString(16);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return str;
  }

  /**
   * 序列号生成
   * 公式： 前缀+n位序列编号
   *
   * @param suffix  前缀
   * @param current 当前数值
   * @param pattern 位数
   * @return 自动生成的编号
   */
  public static String autoSeqGenerator(String suffix, String current, Integer pattern) {
    suffix = suffix + Calendar.getInstance().get(Calendar.YEAR);
    if (StringUtils.isEmpty(current) || !current.contains(suffix))
      return suffix + convertInt2String(pattern, 1 + "");
    else {
      int seq = "".equals(current.substring(current.indexOf(suffix) + suffix.length() + 1))
          ? 0 : Integer.parseInt(current.substring(current.indexOf(suffix) + +suffix.length() + 1));
      return suffix + convertInt2String(pattern, (seq + 1) + "");
    }
  }

  /**
   * 流水字符串
   *
   * @param suffix  前缀
   * @param current 当前值
   * @param pattern 流水位数
   * @return 流水字符串
   */
  public static String autoNumberTemplate(String suffix, String current, Integer pattern) {
    String beforePlaceHolder = suffix.substring(0, suffix.indexOf("%"));
    String afterPlaceHolder = suffix.substring(suffix.indexOf("%") + 1);
    if (StringUtils.isEmpty(current))
      return beforePlaceHolder + convertInt2String(pattern, 1 + "") + afterPlaceHolder;
    else {
      Integer seq = Integer.parseInt(current.replace(beforePlaceHolder, "").replace(afterPlaceHolder, "").replace("0", ""));
      return beforePlaceHolder + convertInt2String(pattern, (seq + 1) + "") + afterPlaceHolder;
    }
  }

  public static String getBASE64(String s) {
    if (s == null) return null;
    return (new sun.misc.BASE64Encoder()).encode( s.getBytes() );
  }

  // 将 BASE64 编码的字符串 s 进行解码
  public static String getFromBASE64(String s) {
    if (s == null) return null;
    BASE64Decoder decoder = new BASE64Decoder();
    try {
      byte[] b = decoder.decodeBuffer(s);
      return new String(b);
    } catch (Exception e) {
      return null;
    }
  }


  public static void main(String[] args) {
    //System.out.print(new CustomerCoder().encoderMD5("gwideal"));
    //System.out.print(autoNumberTemplate("abc", "abc0049", 4));
    String s = "123456";
    System.out.println("原始：" + s);
    System.out.println("编码：" + getBASE64(s));
    System.out.println("解码：" + getFromBASE64(getBASE64(s)));
  }
}

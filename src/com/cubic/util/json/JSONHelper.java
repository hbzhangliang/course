package com.cubic.util.json;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;

/**
 * Created by liang_zhang on 2015/05/29.
 */
public class JSONHelper {
  public static String loadJson(String urlStr) throws IOException {
    StringBuilder sb = new StringBuilder("{");
    URL url = new URL(urlStr);
    HttpURLConnection httpURLConnection;
    httpURLConnection = (HttpURLConnection) url.openConnection(); // 获取连接
    httpURLConnection.setRequestMethod("GET"); // 设置请求方法为POST, 也可以为GET
    httpURLConnection.setDoOutput(true);
    // 接收返回结果
    InputStream is = httpURLConnection.getInputStream();
    BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf8"));
    while (br.read() != -1) {
      sb.append(br.readLine());
    }
    return new String(sb);
  }

  public static <T> T readJson(String jsonStr, Class<?> collectionClass, Class<?>... elementClasses) throws Exception {
    ObjectMapper mapper = new ObjectMapper();
    JavaType javaType = mapper.getTypeFactory().constructParametrizedType(collectionClass, collectionClass, elementClasses);
    return mapper.readValue(jsonStr, javaType);
  }

  public static String formatObject(Object obj) {
    ObjectMapper mapper = new ObjectMapper();
    mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
    mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
    try {
      return mapper.writeValueAsString(obj);
    } catch (JsonProcessingException e) {
      e.printStackTrace();
      return "";
    }
  }

}

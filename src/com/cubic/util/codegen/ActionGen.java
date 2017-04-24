package com.cubic.util.codegen;

import com.cubic.util.codeHelper.StringHelper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

public class ActionGen {

  /**
   * Action类生成器
   *
   * @param actionClassName
   * @param managerClassName
   * @param accessUrl
   * @throws Exception
   */
  public static void gen(String actionClassName, String managerClassName,
                         String accessUrl) throws Exception {

    String[] type = actionClassName.split("\\.");
    if (type.length < 2) {
      throw new Exception("param 'className' is a class's full name!");
    }

    String simpleClassName = type[type.length - 1];

    String filePath = System.getProperty("user.dir") + "\\src\\"
        + actionClassName.replaceAll("\\.", "\\\\") + ".java";
    File file = new File(filePath);
    file.getParentFile().mkdirs();
    OutputStreamWriter fw = new OutputStreamWriter(new FileOutputStream(
        file), "utf-8");
    fw.write(packageCode(actionClassName));
    fw.write(importsCode(managerClassName));
    fw.write(classCode(simpleClassName, accessUrl));
    fw.flush();
    fw.close();
  }

  private static String packageCode(String actionClassName) {

    if (!actionClassName.contains(".")) {
      return "package " + actionClassName + ";\n\n";
    }
    return "package "
        + actionClassName
        .substring(0, actionClassName.lastIndexOf("."))
        + ";\n\n";
  }

  private static String importsCode(String managerClassName) {
    StringBuilder code = new StringBuilder();
    code.append("import ").append(managerClassName).append(";\n");
    code.append("import org.apache.logging.log4j.Logger;\n");
    code.append("import org.apache.logging.log4j.LogManager;\n");
    code.append("import org.springframework.stereotype.Controller;\n");
    code.append("import org.springframework.web.bind.annotation.RequestMapping;\n");
    code.append("import com.cubic.base.action.BaseAct;\n");
    code.append("import javax.annotation.Resource;\n");
    return code.toString();
  }

  private static String classCode(String actionSimpleClassName, String accessUrl) {
    StringBuilder code = new StringBuilder();
    String managerName = actionSimpleClassName.replace("Act", "Mng");
    code.append("\n");
    code.append("@Controller\n");
    code.append("@RequestMapping(\"").append(accessUrl).append("\")\n");
    code.append("public class ").append(actionSimpleClassName).append(" extends BaseAct ").append("{\n\n");
    code.append("private final static Logger logger = LogManager.getLogger();");
    code.append("\n");
    code.append("@Resource\n");
    code.append("private ").append(managerName).append(" ").append(StringHelper.lowCastFirstChar(managerName)).append(";");
    code.append("}\n");
    return code.toString();
  }


}

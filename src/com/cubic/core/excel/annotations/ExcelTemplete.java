package com.cubic.core.excel.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface ExcelTemplete {

    //导入和导出模板的类型：list为列表型；cell为表单型
    public static String TYPE_LIST = "list";

    public static String TYPE_ROW = "cell";

    /**
     * @return 对应导出时的模板名称
     * @template_path web-resources/xls_template/
     */
    public String name() default "empty";

    /**
     * @return 模板的类型：列表型或表单型
     */
    public String type() default "list";

    /**
     * @return 返回表单页号，默认为第一页
     */
    public int sheet() default 0;

    /**
     * @return 如果是列表型的模板，需要定义此项，来描述列表从第几行开始导入
     */
    public int rowStartNum() default 0;


}
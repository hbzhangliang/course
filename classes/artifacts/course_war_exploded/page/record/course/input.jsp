<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
    <!--left start-->
    <div class="left" id="wrapper-250">
        <c:import url="../../../include/menu.jsp"/>
    </div>
    <!--left end-->
    <!--right start-->
    <div class="right clearfix">
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>
        <!--bread_crumbs end-->
        <!--bt start-->
        <!--bt end-->
        <!--tit start-->
        <!--tit start-->
        <form:form action="save.htm" method="post" modelAttribute="bean" id="form">
            <c:import url="../../../include/pageParams.jsp"/>
            <c:import url="../../../include/bizEntity.jsp"/>

            <!--list start-->
            <a href="javascript:void(0);" class="table_head">>>课程信息编辑<span onclick="movePanel('panel1')"></span></a>
            <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr>
                    <td class="td1"><b>课程名称</b></td>
                    <td class="td2"><form:input path="name" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>课程编码</b></td>
                    <td class="td2"><form:input path="code" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>课程类型</b></td>
                    <td class="td2">
                        <form:select path="type"  cssClass="input_txt w_209">
                            <form:option value="" label="--请选择--"/>
                            <c:forEach items="${lookups_KCLX}" var="item">
                                <form:option value="${item.lCode}">${item.lName}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                    <td class="td1"><b>排序号</b></td>
                    <td class="td2"><form:input path="seq" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>课程介绍</b></td>
                    <td class="td2" colspan="3">
                        <form:textarea path="introduce" cssClass="input_txt" cols="80" rows="6"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>备注</b></td>
                    <td class="td2" colspan="3">
                        <form:textarea path="remark" cssClass="input_txt" cols="80" rows="6"/>
                    </td>
                </tr>
            </table>
            <div class="an">
                <button type="button" onclick="doSubmit();" class="ico_tmpSave">
                    <fmt:message key="sys.title.save"/></button>
                <button type="button" onclick="history.back();" class="ico_return">
                    <fmt:message key="sys.title.return"/></button>
            </div>
        </form:form>
    </div>
</div>
<!--right end-->
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
    var requiredList = ["#name","#code","#type", "#seq"];
    var intFields=["#seq"];

</script>
</body>
</html>

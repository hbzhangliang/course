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
            <c:import url="../../../include/businessEntityParams.jsp"/>

            <!--list start-->
            <a href="javascript:void(0);" class="table_head">>>用户信息编辑<span onclick="movePanel('panel1')"></span></a>
            <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr>
                    <td class="td1"><b>账号</b></td>
                    <td class="td2"><form:input path="account" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>密码</b></td>
                    <td class="td2"><form:input path="pwd" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>真实名</b></td>
                    <td class="td2"><form:input path="realName" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>Email</b></td>
                    <td class="td2"><form:input path="mail" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>类型</b></td>
                    <td class="td2">
                        <form:select path="type"  cssClass="input_txt w_209">
                            <form:option value="" label="--请选择--"/>
                            <c:forEach items="${lookups_YHLX}" var="item">
                                <form:option value="${item.lCode}">${item.lName}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                    <td class="td1"><b>所属部门</b></td>
                    <td class="td2">
                        <form:select path="depart.id"  cssClass="input_txt w_209">
                            <form:option value="" label="--请选择--"/>
                            <c:forEach items="${departs}" var="item">
                                <form:option value="${item.id}">${item.name}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>糖果数</b></td>
                    <td class="td2"><form:input path="amount" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>正确率</b></td>
                    <td class="td2"><form:input path="correct" cssClass="input_txt w_209"/></td>
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
    var requiredList = ["#account","#pwd","#realName","#mail","#type","#depart\\.id","#amount", "#correct"];
    var numberFields=["#correct"];
    var intFields=["#amount"];

    $(function () {
       init_page(); 
    });
    
    function init_page() {
        $("#pwd").val("");
    }
    
</script>
</body>
</html>

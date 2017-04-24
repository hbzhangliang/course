<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
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
    <div class="right clearfix">
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>
        <div class="an">
            <gw:bizSearch fields="用户名称" path="realName"  opts="add,del" />
        </div>
        <gw:pagination mode="biz"/>
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="10%" class="orderBy">登录账号</th>
                <th width="10%" class="orderBy">用户名称</th>
                <th width="10%" class="orderBy">电子邮箱</th>
                <th width="15%" class="orderBy">管理员权限</th>
                <th width="8%"><fmt:message key="biz.title.operation"/></th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.account}</a></td>
                    <td>${bean.realName}</td>
                    <td>${bean.mail}</td>
                    <td>${bean.detailtypename}</td>
                    <td>
                        <gw:operation mode="biz" opt="e,v,d"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<script>
    // var orderByList = ["name","campus.name","classinfo","course","fee","classtime","num","teacher.realName"];
    $(function(){

    });
</script>
</body>
</html>
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
    <div class="right clearfix" >
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>
        <!--bread_crumbs end-->
        <!--bt start-->
        <div class="an">
            <gw:bizSearch fields="账号,真实名" path="account,realName" opts="add,del"/>
        </div>
        <!--bt end-->
        <gw:pagination mode="biz"/>
        <!--table start-->
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="6%" class="orderBy">账号</th>
                <th width="8%" class="orderBy">真实名</th>
                <th width="10%">密码</th>
                <th width="10%" class="orderBy">Email</th>
                <th width="8%" class="orderBy">类型</th>
                <th width="8%" class="orderBy">糖果数</th>
                <th width="8%" class="orderBy">正确率</th>
                <th width="12%"><fmt:message key="biz.title.operation"/></th>
            </tr>
            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.account}</a></td>
                    <td>${bean.realName}</td>
                    <td>${bean.pwd}</td>
                    <td>${bean.mail}</td>
                    <td><gw:lookups category="${lookups_YHLX}" lookupsCode="${bean.type}"/></td>
                    <td>${bean.amount}</td>
                    <td>${bean.correct}</td>
                    <td>
                        <div>
                            <a href="javascript:void(0)" onclick="doInput(this)">
                                <fmt:message key="sys.title.edit"/>
                            </a>
                            <a  href="javascript:void(0)" onclick="doView(this)">
                                <fmt:message key="sys.title.view"/>
                            </a>
                            <a class="req" href="javascript:void(0)" onclick="doDel(this)">
                                <fmt:message key="sys.title.delete"/>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <!--table end-->
    </div>
    <!--right end-->
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
    var orderByList = ["account","realName","mail","type","amount","correct"];
</script>
</body>
</html>

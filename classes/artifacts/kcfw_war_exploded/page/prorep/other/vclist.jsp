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
            <gw:bizSearch fields="风投机构名称" path="name"  opts="add,del" />
        </div>
        <gw:pagination mode="biz"/>
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="10%" class="orderBy">风投机构名称</th>
                <th width="10%" class="orderBy">注册资本</th>
                <th width="10%" class="orderBy">机构类别</th>
                <th width="10%" class="orderBy">企业性质</th>
                <th width="10%" class="orderBy">企业形式</th>
                <th width="10%" class="orderBy">联系人</th>
                <th width="10%" class="orderBy">联系电话</th>
                <th width="15%"><fmt:message key="biz.title.operation"/></th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.name}</a></td>
                    <td>${bean.capital}</td>
                    <td><gw:lookups category="${lookups_JGLB}" lookupsCode="${bean.orgtype}"/></td>
                    <td><gw:lookups category="${lookups_QYXZ}" lookupsCode="${bean.corpnature}"/></td>
                    <td><gw:lookups category="${lookups_QYXS}" lookupsCode="${bean.corptype}"/></td>
                    <td>${bean.contact}</td>
                    <td>${bean.tel}</td>
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
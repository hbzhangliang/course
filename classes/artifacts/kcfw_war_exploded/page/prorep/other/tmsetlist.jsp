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
            <gw:bizSearch fields="年份" path="chyear"  opts="add" />
        </div>
        <gw:pagination mode="biz"/>
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="10%" class="orderBy">年份</th>
                <th width="15%" class="orderBy">申报项目批次号</th>
                <th width="15%" class="orderBy">申报项目类型</th>
                <th width="10%" class="orderBy">是否当前默认项</th>
                <th width="10%" class="orderBy">是否包含中期评估流程</th>
                <th width="8%"><fmt:message key="biz.title.operation"/></th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.chyear}</a></td>
                    <td>${bean.chbatch}</td>
                    <td>${bean.projtypename}</td>
                    <td>
                        <c:if test="${bean.isChoose}">
                            是
                        </c:if>
                        <c:if test="${!bean.isChoose}">
                            否
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${bean.isHasMidExm}">
                            包含
                        </c:if>
                        <c:if test="${!bean.isHasMidExm}">
                            不包含
                        </c:if>
                    </td>
                    <td>
                        <gw:operation mode="biz" opt="e,v"/>
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
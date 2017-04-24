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
            <gw:bizSearch fields="名称,所属课程" path="name,course.name" opts="add,del"/>
        </div>
        <!--bt end-->
        <gw:pagination mode="biz"/>
        <!--table start-->
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="22%" class="orderBy">名称</th>
                <th width="8%" class="orderBy">所属课程</th>
                <th width="8%" class="orderBy">视频格式</th>
                <th width="8%" class="orderBy">大小(MB)</th>
                <th width="8%" class="orderBy">时长</th>
                <th width="10%" class="orderBy">介绍</th>
                <th width="6%" class="orderBy">排序号</th>
                <th width="12%"><fmt:message key="biz.title.operation"/></th>
            </tr>
            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.name}</a></td>
                    <td>${bean.course.name}</td>
                    <td><gw:lookups category="${lookups_SPLX}" lookupsCode="${bean.type}"/></td>
                    <td>${bean.size}</td>
                    <td>${bean.duration}</td>
                    <td>${bean.introduce}</td>
                    <td>${bean.seq}</td>
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
    var orderByList = ["name","course.name","type","size","duration","introduce","seq"];
</script>
</body>
</html>

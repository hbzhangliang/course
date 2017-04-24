<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <a style="margin-top: 15px;" href="javascript:void(0);" class="table_head">>>信息消费项目申报办理记录<span onclick="movePanel('panel1')"></span></a>
    <table class="table_01">
        <tr>
            <c:if test="${!(currentUser.type eq 'corp'|| currentUser.type eq 'professor')}">
                <th width="10%">操作时间</th>
                <th width="10%">操作人账号</th>
                <th width="10%">操作人姓名</th>
            </c:if>
            <th width="20%">操作意见</th>
            <th width="10%">操作结果</th>
        </tr>

        <c:forEach items="${acList}" var="aclist" varStatus="i">
        <tr>
            <c:if test="${!(currentUser.type eq 'corp'|| currentUser.type eq 'professor')}">
                <td><fmt:formatDate value="${aclist.updateTime}" pattern="yyyy-MM-dd" /></td>
                <td>${aclist.user.account}</td>
                <td>${aclist.operateUserName}</td>
            </c:if>
            <td>${aclist.opinion}</td>
            <td><gw:lookups category="${lookups_XMZT}" lookupsCode="${aclist.status}"/></td>
        </tr>
        </c:forEach>

</div>
<script>


</script>


</body>
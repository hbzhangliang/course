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
    <div class="an">
    	<gw:bizSearch fields="企业名称" path="corp.unitName"/>
    </div>
    <!--bt end-->
    <gw:pagination mode="biz"/>
    <!--table start-->
    <table class="table_01">
      <tr>
        <th width="15%" class="orderBy">企业名称</th>
        <th width="10%" class="orderBy">操作时间</th>
        <th width="10%" class="orderBy">操作人</th>
        <th width="10%" class="orderBy">备注</th>
        <th width="10%"><fmt:message key="biz.title.operation"/></th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="i">
        <tr id="tr_${bean.id}">
          <td>${bean.corp.unitName}</td>
           <td><fmt:formatDate value="${bean.operatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
          <td>${bean.user.realName}</td>
          <td>${bean.remark}</td>
          <td>
            <div> 
            	<c:if test="${bean.isremind}">
	            	<a href="javascript:void(0)" onclick="dotailView(this)">已阅
	            	</a>
            	</c:if>
            </div>
		  </td>  
        </tr>
      </c:forEach>
    </table>
    <!--table end-->
    <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
	function dotailView(item){
		var corptailId=$(item).closest('tr').attr('id').substring(3);
		$.post(base + '/corp/corptail/confirm.htm', {id:corptailId}, function (data) {
			window.location.href=base+'/corp/corptail/list.htm';
     	  });
	}
</script>
</body>
</html>

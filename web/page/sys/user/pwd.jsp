<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
</head>
<body onload="$('#pwd').val('');">
<!--top start-->
<c:import url="${base}/include/top.jsp"/>
<!--top start-->
<form:form modelAttribute="bean" action="${base}/sys/user/savepwd.htm" method="post" id="form">
  <input type="hidden" name="departIds" value="${bean.deptIds}"/>
  <form:hidden path="id"/>
  <form:hidden path="realName"/>
  <form:hidden path="name"/>
  <form:hidden path="updater.id" value="${currentUser.id}"/>
  <div class="main clearfix">
    <div class="tit_l_tit"><img src="${resources}/images/icon_1.png" alt=""/>修改密码</div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
      <tr>
        <th scope="row">新密码</th>
        <td><form:password cssClass="input" size="27" path="pwd"/></td>
      </tr>
      <tr>
        <th colspan="4" scope="row" style="text-align:center;">
          <button onclick="form.submit();" class="btn">确定</button>
          <button onclick="window.location.href='${base}/sys/user/list.htm'" class="btn">返回</button>
        </th>
      </tr>
    </table>
  </div>
</form:form>
</body>
</html>

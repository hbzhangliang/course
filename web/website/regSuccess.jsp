<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/18
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_kcfw.jsp" %>
</head>
<body class="boby">
<div class="header-bg">
  <div class="header auto">
    <div class="login-1"></div>
    <ul class="sec_menu"></ul>
  </div>
</div>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="reg_label"><fmt:message key="website.label.regSuccessful"/></div>
  <div class="cont">
    <div class="login">
      <div class="suc_msg">
        <span id="totalSecond">3</span><fmt:message key="sys.title.backToHome"/>
      </div>
    </div>
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<c:import url="coupon/commons/footer.jsp"/>
<script language="javascript" type="text/javascript">
  <!--
  var second = $('#totalSecond').html();
  setInterval("redirect()", 1000);  //每1秒钟调用redirect()方法一次

  function redirect() {
    if (second < 0) {
      if ('${from}' == 'portal') {
        window.location.href = "${base}/welcome.htm";
      } else
        window.location.href = "${base}/" + "${from}";
    } else {
      $('#totalSecond').html(second--);
    }
  }
  -->
</script>
</body>
</html>

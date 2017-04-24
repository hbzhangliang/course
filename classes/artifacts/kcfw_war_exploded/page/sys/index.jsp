<%--
  Created by IntelliJ IDEA.
  User: li_hongyu
  Date: 2014/12/19
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/resource.jsp" %>
<%@ include file="../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="warp_in clearfix">
    <c:import url="commons/top.jsp"/>
    <!--main start-->
    <div class="main">
      <c:import url="commons/menu.jsp"/>
      <!--right start-->
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <!--one start-->
          <div class="tit_1">
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.serverInfo"/></span>
            </b>
          </div>
          <div class="bg clearfix">
            <table width="100%" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th width="9%" scope="row"><fmt:message key="sys.title.jdk"/></th>
                <td width="91%">${java_runtime_version}</td>
              </tr>
              <tr>
                <th scope="row"><fmt:message key="sys.title.os"/></th>
                <td>${os_name}-${os_version}</td>
              </tr>
              <tr>
                <th scope="row"><fmt:message key="sys.title.appServer"/></th>
                <td>${server_version}&nbsp;${os_arch}</td>
              </tr>
              <tr>
                <th scope="row"><fmt:message key="sys.title.threadCount"/></th>
                <td>
                  ${activeThreadCount}
                </td>
              </tr>
              <tr>
                <th scope="row"><fmt:message key="sys.title.clearCache"/></th>
                <td>
                  <a href="javascript:void(0);"
                     onclick="$.post('${base}/clrCache.htm',null,function(data){msg(data)});"><fmt:message
                      key="sys.title.active"/> </a>
                </td>
              </tr>
            </table>
          </div>
          <!--one end-->
        </div>
      </div>
      <!--right end-->
    </div>
    <!--main left-->
    <c:import url="commons/footer.jsp"/>
  </div>
</div>
<script>
  sync = function () {
    $.post('${base}/sync.htm', {mode: 'manual'}, function (data) {
      msg(data);
    });
  }

  sendToFtp = function () {
    $.post('${base}/sendToFtp.htm', null, function (data) {
      msg(data);
    });
  }
</script>
</body>
</html>

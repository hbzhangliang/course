<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="warp_in clearfix">
    <!--top start-->
    <c:import url="../commons/top.jsp"/>
    <!--top start-->
    <div class="main">
      <c:import url="../commons/menu.jsp"/>
      <!--tit start-->
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <div class="tit_1">
            <gw:list_opt opt="b,n,r,s" id="lot"/>
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.attachmentMng"/></span></b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">显示文件名</th>
                <td><form:input path="params[fileNameDisplay]" cssClass="input" size="28"/></td>
                <th scope="row" width="15%">文件类型</th>
                <td><form:input path="params[filetype]" cssClass="input" size="28"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col">显示文件名</th>
                <th scope="col">文件类型</th>
                <th scope="col">文件大小</th>
                <th scope="col">是否已上传至FTP</th>
                <th scope="col">上传时间</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>${bean.fileNameDisplay}</td>
                  <td>${bean.filetype}</td>
                  <td>${bean.fixedSize}</td>
                  <td>${bean.sentToFTP}</td>
                  <td>${bean.uploadDate}</td>
                  <td>
                    <gw:operation opt="c"/>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <br/>
            <gw:pagination mode="sys"/>
          </div>
        </div>
      </div>
    </div>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
</body>
</html>

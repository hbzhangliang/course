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
              <span><fmt:message key="sys.title.lookupsMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <form:form modelAttribute="queryBean" method="post" action="list.htm" id="searchForm">
            <c:import url="../../../include/pageParams.jsp"/>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
              <tr>
                <th scope="row" width="15%">问题</th>
                <td><form:input path="params[question]" cssClass="input" size="24"/></td>
              </tr>
            </table>
          </form:form>
          <div class="bg clearfix">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
              <thead>
              <tr>
                <th scope="col" width="8%">置顶</th>
                <th scope="col">所属模块</th>
                <th scope="col">问题</th>
                <th scope="col">回答</th>
                <th scope="col" width="8%">状态</th>
                <th scope="col" width="15%"><fmt:message key="sys.title.operation"/></th>
              </tr>
              </thead>
              <tbody id="content">
              <c:forEach items="${list}" var="bean">
                <tr id="tr_${bean.id}">
                  <td>
                    <a href="javascript:void(0)" onclick="ajaxUpdate('${bean.id}','pinned',${!bean.pinned})">
                      <c:if test="${bean.pinned}">
                        取消</c:if>置顶</a></td>
                  <td>${bean.section.name}</td>
                  <td>${bean.question}</td>
                  <td>${bean.answer}</td>
                  <td><a href="javascript:void(0)" onclick="ajaxUpdate('${bean.id}','published',${!bean.published})">
                    <c:if test="${bean.published}">
                      取消</c:if>发布</a></td>
                  <td>
                    <gw:operation opt="e,d"/>
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

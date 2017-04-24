<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_coupon.jsp" %>
</head>
<body class="boby">
<c:import url="../commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <div class="nav">
      <div class="nav-l">${currentSection.name}</div>
      <div class="nav-c  w745"><a href="#"></a></div>
      <div class="nav-r"></div>
    </div>
    <!--list start-->
    <div class="hcjs-list clearfix">
      <c:forEach items="${providers}" var="provider" varStatus="i">
        <div class="list1">
          <strong>${provider.name}</strong>
          <span class="fold" onclick="showSite(this);">
            <c:if test="${i.index==0}"><fmt:message key="website.label.collapse"/> </c:if>
            <c:if test="${i.index>0}"><fmt:message key="website.label.expand"/></c:if>
            <img src="${couponImageFolder}/pickup.png" alt=""/></span>
        </div>
        <!--pickup start-->
        <div class="pickup clearfix">
          <!--pickup-cont start-->
          <div class="pickup-cont clearfix">
            <!--pickup-l start-->
            <div class="pickup-l">
              <img src="${couponImageFolder}/hcjs-img1.png" alt=""/>
            </div>
            <!--pickup-l end-->
            <!--pickup-r start-->
            <div class="pickup-r">
              <ul>
                <li class="w360"><strong><fmt:message key="website.label.address"/>：</strong>${provider.address}</li>
                <li class="w360"><strong><fmt:message key="website.label.contact"/>：</strong>${provider.contact}</li>
                <li class="w360"><strong><fmt:message key="website.label.tel"/>：</strong>${provider.tel}</li>
                <li class="w700 dotted-1 pb5"><strong><fmt:message key="website.label.services"/>：</strong>${provider.hotelInfo}</li>
                <li class="w700 pt5">${provider.description}
                </li>
              </ul>
            </div>
            <!--pickup-r end-->
          </div>
          <!--pickup-cont end-->
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab-1">
            <tr>
              <th>会议厅名称</th>
              <th>面积（m<sup>2</sup>）</th>
              <th>层高（m）</th>
              <th>最多可<br>容纳人数</th>
              <th>显示系统</th>
              <th>扩声系统</th>
              <th>数字<br>合成系统</th>
              <th>视频<br>会议系统</th>
              <th>电话<br>远程会议</th>
              <th>录播系统</th>
              <th>会议预定及<br/>信息发布系统</th>
            </tr>
            <c:forEach items="${provider.siteInfos}" var="siteInfo">
              <tr id='${siteInfo.id}'>
                <td><a onclick="showSiteInfo(this)">${siteInfo.name}</a></td>
                <td>${siteInfo.area}</td>
                <td>${siteInfo.height}</td>
                <td>${siteInfo.capacity}人</td>
                <c:forEach items="${lookups_HCSS}" var="lookups">
                  <td>
                    <c:forEach items="${siteInfo.equipments}" var="equipment">
                      <c:if test="${equipment.lName eq lookups.lName}">
                        <img src="${couponImageFolder}/duihao.png" alt=""/>
                      </c:if>
                    </c:forEach>
                  </td>
                </c:forEach>
              </tr>
            </c:forEach>
          </table>
        </div>
        <!--pickup end-->
      </c:forEach>
    </div>
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<!--main end-->
<c:import url="../commons/footer.jsp"/>
<script>
  showSite = function (obj) {
    if ($(obj).parent().next().css('display') == 'block') {
      $(obj).parent().next().slideUp();
      $(obj).empty().append('<fmt:message key="website.label.expand"/><img src=\"${couponImageFolder}/fold.png\" alt=\"\"/>')
    } else {
      $(obj).parent().next().slideDown();
      $(obj).empty().append('<fmt:message key="website.label.collapse"/><img src=\"${couponImageFolder}/pickup.png\" alt=\"\"/>')
    }
  }
  
  function showSiteInfo(item){
	  var siteId=$(item).closest('tr').attr('id');
	  //msg(siteId);
	  window.open(base+"/showSite/showSite/"+siteId);
  }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_coupon.jsp" %>
</head>
<body class="boby">
<c:import url="../commons/header.jsp"/>
<!--header end-->
<!--main start-->
<div class="main">
    <!--cont start-->
    <div class="cont">
       <div class="nav"> 
                  <div class="nav-2"><b>${site.name}</b></div>
                  <div class="nav-c  w745"><a href="#"></a></div>
                  <div class="nav-r"></div>
       </div>
        <form:form  modelAttribute="site" id="form">
       <div class="hcjs-list clearfix">
            <!--pickup start-->
            <div class="pickup clearfix">
               <!--pickup-cont start-->
               <div class="pickup-cont pb200 clearfix">
                 <div class="h275 dotted-1">
                  <!--pickup-l start-->
                  <div class="pickup-l l" style="margin-right:10px;"> 
<%--                    <img src="${couponImageFolder}/login_zc.png" width="340px" height="260px">  --%>
<%-- 					<img src="getArticlePic/${site.id}" width="340px" height="260px"> --%>
						<img src="${site.tmpParams['picFtpPath']}" width="340px" height="260px"/>
                  </div>
                   <!--pickup-l end-->
                   <!--pickup-r start-->
                  
                  <div class="pickup-r">
                     <ul class="yhhys">
                       <li><strong>会场供应商：</strong>${site.provider.name}</li>
                       <li><strong>会场名称：</strong>${site.name}</li>
                       <li><strong>类型：</strong><form:select path="type" items="${lookups_HCLX}" itemLabel="lName" itemValue="lCode"/></li>
                       <li><strong>可容纳人数：</strong>${site.capacity}人</li>
                       <li><strong>面积：</strong>${site.area}m²</li>
                       <li><strong>高度：</strong>${site.height}m</li>
                       <li style="width:500px;"> <strong>基本设施：</strong> <form:checkboxes path="lookupsIds" items="${lookups_HCSS}" itemLabel="lName" itemValue="id"/></li>
                       <li style="width:500px;"> <strong>适用于：</strong>${site.func}</li>
                       <li><strong>可预约时间：</strong>${site.availableTime }</li>
                       <li><strong>价格信息：</strong>${site.priceDetail}</li>
                     </ul>
                 </div>
                 <!--pickup-r end-->
                 </div>
                 <span class="gs"><b class="l">概述:</b><p class="r">${site.description}</p></span>
              </div>
              <!--pickup-cont end--> 
            </div>
            <!--pickup end-->
          </ul>
       </div>
       </form:form>
  </div> 
    <!--cont end-->
    <div class="main-bot"></div>  
</div>                    
<!--main end--> 
 </div>
<!--main end-->
<c:import url="../commons/footer.jsp"/>

<script>
  var requiredList = ["#name", "#type",];

  if ('${site.lookupsIds}'.length > 0) {
    $.each('${site.lookupsIds}'.split(','), function (idx, obj) {
      $.each($("input[name='lookupsIds']"), function (idxx, objj) {
        if ($(objj).val() == obj)
          $(objj).prop('checked', true);
      });
    });
  }
</script>

</body>
</html>




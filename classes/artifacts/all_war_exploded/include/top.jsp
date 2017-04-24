<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="gw" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.floatPannel{
	background-color:#0066FF;
	width:120px;
	height:auto;
	left:1px;
	top:1px;
	position:absolute;
	z-index:10
}
</style>
<div class="head">
  <div class="banner auto">
    <ul class="user">
      <li class="t1"></li>
      <li class="t2"><fmt:message key="sys.title.welcomeTitle"/>&nbsp;&nbsp;&nbsp;&nbsp;${currentUser.realName}</li>
      <li class="t3"><gw:a onclick="logout();" cssClass="db"/></li>
    </ul>
    <div class="date l"></div>
    <dl class="r">
      <c:if test="${crtMenu.module.code eq 'kcfw'}">
        <dd><a href="${base}/coupon">科技券专题首页</a></dd>
        <dt class="ico_2" onmouseenter="showAffair(this)"  onmouseleave="hideAffair(this)"><span>${affair.number}</span></dt>
        <dd style='position: relative;'><a href="#">待办</a></dd>
      </c:if>
      <c:if test="${crtMenu.module.code eq 'ProRep'}">
        <dd><a href="${base}/prorep">项目申报系统首页</a></dd>
        <dt class="ico_2" onmouseenter="showProRepAffair(this)"  onmouseleave="hideProRepAffair(this)"><span>${prorepaffair.number}</span></dt>
        <dd style='position: relative;'><a href="#">待办</a></dd>
      </c:if>
    </dl>
  </div>
</div>
<script>
  var today = new Date();
  var info = "今天是：";
  var x = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
  info += today.getFullYear() + "年" + (today.getMonth() + 1) + "月" + today.getDate() + "日   " + x[today.getDay()];
  $('.date').html(info);
  
  function showAffair(item){
	  var info="${affair.info}";
	  info="<div class='floatPannel'>"+"${affair.info}"+"</div>";
	  $(info).appendTo($(item));
  }
  function hideAffair(item){
	  $(item).find('div').remove();
  }
  function showProRepAffair(item){
    var info="${prorepaffair.info}";
    info="<div class='floatPannel'>"+"${prorepaffair.info}"+"</div>";
    $(info).appendTo($(item));
  }
  function hideProRepAffair(item){
    $(item).find('div').remove();
  }
</script>
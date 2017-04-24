<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_homepage.jsp" %>
<script src="${resources}/js/cookie.js"></script>
</head>
<body onload="initProfile()">
<div class="cont clearfix">
  <!-- login-start -->

  <form id="loginForm">
    <div class="login clearfix">
      <c:if test="${currentUser==null}">
            <span class="l"><b>用户登录</b></span>
            <input id="account" name="account" type="text" class="l" value="请输入用户名"/>
            <input id="pwd" name="pwd"  type="text" class="l" value="请输入密码"/>
            <input type="text" id="captchaInput" type="text" class="l" value="请输入验证码">
            <%--<div class="l yzm"><img src="${homepageImageFolder}/yzm.png" width="59" height="23"></div>--%>
              <div style="float: left;margin-top: 8px;margin-bottom: 8px"><gw:captcha/></div>
            <a href="#" class="dl" onclick="doSubmit();"><img src="${homepageImageFolder}/dl.png" width="64" height="25"></a>
            <a href="#" class="xyh"  onclick="location.href='register?from=portal'"><img src="${homepageImageFolder}/xyh.png" width="96" height="25"></a>
            <a href="#" onclick="fgtPW();">忘记密码？</a>
      </c:if>
      <c:if test="${currentUser!=null}">
        <div style="padding: 10px 5px 10px 5px;">
          <ul class="user">
            <li class="t1"></li>
            <li class="t2"><fmt:message key="sys.title.welcomeTitle"/>&nbsp;&nbsp;${currentUser.realName}&nbsp;&nbsp;</li>
            <c:if test="${currentUser.type eq 'corp'}">
              <li class="t2"><b id="btnModifyInfo"  style="text-decoration: underline ;cursor: pointer;">修改信息</b>&nbsp;</li>
            </c:if>
            <c:if test="${currentUser.type eq 'sys'}">
              <li class="t2"><b id="btnCorpAudit"  style="text-decoration: underline ;cursor: pointer;">企业审核</b>&nbsp;</li>
              <%--<li class="t2"><b id="btnInfo"  style="text-decoration: underline ;cursor: pointer;">信息发布</b>&nbsp;</li>--%>
              <c:forEach items="${currentUser.roles}" var="item" varStatus="i">
                <c:if test="${item.code eq 'publisher'}">
                  <li class="t4"><b id="btnInfo"  style="text-decoration: underline ;cursor: pointer;">信息发布</b>&nbsp;</li>
                </c:if>
              </c:forEach>
            </c:if>
            <li class="t3"><gw:a onclick="logout();" cssClass="db"/></li>
          </ul>
        </div>
        <%--<span><fmt:message key="sys.title.welcomeTitle"/>${currentUser.realName}</span>--%>
      </c:if>
    </div>
  </form>
  <!-- login-end -->

  <!-- main-start -->
  <div class="main clearfix cl">
    <!--滚动图片 start-->
    <div class="scroll_bg l">
      <div id="en_slider" class="en_slider">
        <ul class="en_pic">
          <li><a href="#"><img  alt="" src="${homepageImageFolder}/pic.jpg"></a><p><a href="#">标题1</a></p></li>
          <li><a href="#"><img  alt="" src="${homepageImageFolder}/pic_bg1.jpg"></a><p><a href="#">标题2</a></p></li>
          <li><a href="#"><img  alt="" src="${homepageImageFolder}/warp_bg.jpg"></a><p><a href="#">标题3</a></p></li>
          <li><a href="#"><img  alt="" src="${homepageImageFolder}/warp_bg1.jpg"></a><p><a href="#">标题4</a></p></li>

        </ul>
        <div class="en_num">
          <a href="#" class="cur">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
        </div>
      </div>
    </div>
    <!--滚动图片 end-->
    <!--通知  start-->
    <div class="notic l">
      <ul class="tabtit">
        <li class="sel">通知公告</li><li>政策法规</li><li>公示栏</li>
      </ul>
      <div class="tab-cont tabcontent">
        <!--t1 start-->
        <div>
          <ul>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>
            <li><a href="#">长宁区科技创新服务平台信息公开长宁区科技创区科技创区科技创区科技创区科技创</a><span>2016-03-07</span></li>
          </ul>
          <a href="#" class="more">查看更多></a>
        </div>
        <!--t1 end-->
        <!--t2 start-->
        <div class="tabhide">
          <ul>
              <c:forEach items="${articles}" var="item" varStatus="i">
                <li><a href="#" onclick="location.href='policy/article/${item.id}'">科技券|${item.title}</a><span>${item.publishDate}</span></li>
              </c:forEach>
            <c:forEach items="${proarticles}" var="item" varStatus="i">
              <li><a href="#" onclick="location.href='propolicy/article/${item.id}'">项目申报|${item.title}</a><span>${item.publishDate}</span></li>
            </c:forEach>
            <%--<li><a href="#">222长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>--%>
            <%--<li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>--%>
          </ul>
          <a href="#" class="more">查看更多></a>
        </div>
        <!--t2 start-->
        <!--t3 start-->
        <div class="tabhide">
          <ul>
            <c:forEach items="${notices}" var="item" varStatus="i">
              <li><a href="#" onclick="location.href='notice/article/${item.id}'">科技券|${item.title}</a><span>${item.publishDate}</span></li>
            </c:forEach>
            <c:forEach items="${pronotices}" var="item" varStatus="i">
              <li><a href="#" onclick="location.href='pronotice/article/${item.id}'">项目申报|${item.title}</a><span>${item.publishDate}</span></li>
            </c:forEach>
            <%--<li><a href="#">333长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>--%>
            <%--<li><a href="#">长宁区科技创新服务平台信息公开</a><span>2016-03-07</span></li>--%>
          </ul>
          <a href="#" class="more">查看更多></a>
        </div>
        <!--t3 start-->

      </div>
    </div>
    <!--通知  end-->
  </div>
  <!-- main-end -->

  <!-- system-start -->
  <div class="system clearfix cl">
    <h1><b>服务系统入口</b></h1>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
           <td align="center"><a href="coupon"><img src="${homepageImageFolder}/s-1.png" width="213" height="139"></a></td>
           <td align="center"><a href="prorep"><img src="${homepageImageFolder}/s-2.png" alt="" width="213" height="139"></a></td>


      </tr>
    </table>

  </div>
  <!-- system-end -->
</div>
<c:import url="../website/coupon/commons/mainfooter.jsp"/>
</body>


<script>
  $(function(){
    $("#en_slider").Xslider({
      affect: 'fade', //效果  有scrollx|scrolly|fade|none
      speed: 500, //动画速度
      space: 3000, //时间间隔
      auto: true, //自动滚动
      trigger: 'mouseover', //触发事件 注意用mouseover代替hover
      conbox: '.en_pic', //内容容器id或class
      ctag: 'li', //内容标签 默认为<a>
      switcher: '.en_num', //切换触发器id或class
      stag: 'a', //切换器标签 默认为a
      current:'cur', //当前切换器样式名称
      rand:false //是否随机指定默认幻灯图片
    });


    $("#account").focus(function(){
      $(this).val("");}).blur(function(){
      if($(this).val().length==0){
        $(this).val("请输入用户名");
      }
    });

    $("#pwd").focus(function(){
      $(this).attr("type","password");
      $(this).val("");
    }).blur(function(){
      if($(this).val().length==0){
        $(this).attr("type","text");
        $(this).val("请输入密码");
      }
    });
    $("#captchaInput").focus(function(){
      $(this).val("");}).blur(function(){
      if($(this).val().length==0){
        $(this).val("请输入验证码");
      }
    });


    $("#btnModifyInfo").click(function(){
      //进入企业信息编辑页面
      location.href="${base}/corp/input.htm";
    });

    $("#btnCorpAudit").click(function(){
      location.href="${base}/corp/list.htm";
    });


    if($("#btnCorpAudit").parent().next().hasClass('t2')){
      $("#btnCorpAudit").parent().hide();
    }

    $("#btnInfo").click(function(){
      location.href="${base}/cms.htm";
    });

  });


  function doSubmit() {
    if ($("#account").val().length == 0 || $("#pwd").val().length == 0) {
      msg('<fmt:message key="msg.login.emptyUserInfo"/>');
      return;
    }
    $.post('validCaptcha.htm', {keyInput: $('#captchaInput').val()}, function (data) {
      if (data != 'ok') {
        msg('<fmt:message key="sys.msg.inputCorrectCaptcha"/>');
      } else {
        if ($("input[type='checkbox']").attr('checked') == 'checked') {
          setCookie("account", $('#account').val(), 24 * 30, "/");
          setCookie("rmbme", 'true', 24 * 30, "/");
          setCookie("pwd", $('#pwd').val(), 24 * 30, "/");
        } else {
          setCookie("rmbme", null, 24 * 30, "/");
        }
        $.post('login.htm', $('#loginForm').serialize(), function (data) {
          if (data == 1) {
            if ('${from}' == 'portal') {
              window.location.href = "${base}/welcome.htm";
            } else
              window.location.href = "${base}/" + "${from}";
          } else if (data == 'sys') {
            window.location.href = "${base}/sys/module/sys.htm";
          } else {
            msg(data);
          }
        });
      }
    });
  }
   enterSubmit = function (event) {
     if (event.keyCode == 13) {
       doSubmit();
     }
   };

   initProfile = function () {
     if (getCookieValue('rmbme') == 'true') {
       $('#account').val(getCookieValue('account'));
       $('#pwd').val(getCookieValue('pwd'));
       $('#rmbMe').attr('checked', true);
     }
   };

  fgtPW = function () {
    msg('<fmt:message key="sys.title.forgetPwd"/>');
  }

  </script>
</html>

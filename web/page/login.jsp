<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp" %>
<%@ include file="../include/resource.jsp" %>
<%@ include file="../include/skin_kcfw.jsp" %>
<script src="${resources}/js/cookie.js"></script>
</head>
<body class="boby" onload="initProfile()">


<!--header start-->
<div class="header-bg">
  <div class="header auto">
    <div class="login-1">
    </div>
    <ul class="sec_menu"></ul>
  </div>
</div>
<!--header end-->
<!--main start-->
<div class="main">
  <form id="loginForm">
    <!--cont start-->
    <div class="cont">
      <div class="login">
        <div class="log-img">
          <img src="${kcfwImageFolder}/login-photo.jpg" alt=""/></div>
        <div class="log-text clearfix">
          <ul>
            <li><label for="account"><fmt:message key="sys.title.loginName"/>：</label>
              <input id="account" name="account" type="text" class="input"/>
            </li>
            <li><label for="pwd"><fmt:message key="sys.title.loginPwd"/>：</label>
              <input id="pwd" name="pwd" type="password" class="input"/></li>
          </ul>
          <div class="yzm">
            <div class="yzm-t l">
              <label for="captchaInput"><fmt:message key="biz.label.captcha"/>：</label>
              <input name="" type="text" id="captchaInput" title="<fmt:message key="website.label.inputCaptcha"/>"/>
            </div>
            <span class="r"><gw:captcha/></span>
          </div>
          <div class="log-bott clearfix">
            <dl>
              <dt class="dl" onclick="doSubmit();"><fmt:message key="sys.title.loginBtn"/></dt>
              <dt class="zc" onclick="location.href='register?from=${from}'">
                <fmt:message key="biz.label.register"/></dt>
            </dl>
          </div>
          <div class="log-tip"><a href="javascript:void(0)" onclick="fgtPW();" class="fortget_pw"><fmt:message
              key="biz.label.requestPwd"/> </a></div>
        </div>
      </div>
    </div>
    <!--cont end-->
    <div class="main-bot"></div>
  </form>
</div>
<!--main end-->
<c:import url="../website/coupon/commons/footer.jsp"/>
<script>
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

  fgtPW = function () {
    msg('<fmt:message key="sys.title.forgetPwd"/>');
  }
</script>
</body>
</html>

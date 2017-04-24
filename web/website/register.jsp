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
    <ul class="sec_menu">
      <li><a href="${base}/welcome.htm"><fmt:message key="website.label.portal"/></a></li>
      <c:if test="${currentHome.code eq 'coupon'}">
        <li><a href="${base}/coupon"><fmt:message key="website.label.couponHome"/></a></li>
      </c:if>
      <c:if test="${currentHome.code eq 'prorep'}">
        <li><a href="${base}/prorep"><fmt:message key="website.label.prorepHome"/></a></li>
      </c:if>

    </ul>
  </div>
</div>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <div class="reg_label">企业用户注册</div>
    <div class="enroll clearfix">
      <form:form modelAttribute="bean" action="createAccount" method="post" id="form">
        <form:hidden path="from"/>
        <div class="info_label">帐号信息</div><br/>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab-2">
          <tr>
            <th><span class="required">*</span>登录名(登录系统用)：</th>
            <td><form:input path="user.account"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>真实姓名：</th>
            <td><form:input path="user.realName"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>密&nbsp;码：</th>
            <td><form:password path="user.pwd"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>确认密码：</th>
            <td><input type="password" id="confirmPwd"/></td>
          </tr>
        </table>
        <div class="info_label">企业信息</div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab-2">
          <tr>
            <th><span class="required">*</span>企业名称：</th>
            <td><form:input path="corp.unitName"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>工商注册时间：</th>
            <td>
            	<form:input path="corp.applyDate"/>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>是否三证合一：</th>
            <td><form:radiobuttons items="${lookups_YN}" path="corp.isUnionCard"
                                   itemValue="lCode" itemLabel="lName"/></td>
          </tr>
          <tr class="dn">
            <th><span class="required">*</span>统一社会信用代码：</th>
            <td><form:input path="corp.creditCode"/></td>
          </tr>
          <tr class="dn">
            <th><span class="required">*</span>组织机构代码：</th>
            <td><form:input path="corp.orgCode"/></td>
          </tr>
          <tr class="dn">
            <th><span class="required">*</span>工商营业执照：</th>
            <td><form:input path="corp.license"/></td>
          </tr>
          <tr class="dn">
            <th><span class="required">*</span>税务登记证：</th>
            <td><form:input path="corp.taxLicense"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>法人代表：</th>
            <td><form:input path="corp.representative"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>公司网址：</th>
            <td><form:input path="corp.network"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>注册地址：</th>
            <td><form:input path="corp.registerAddress"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>办公地址：</th>
            <td><form:input path="corp.contactAddress"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>邮编：</th>
            <td><form:input path="corp.postcode"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>联系人：</th>
            <td><form:input path="corp.contact"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>联系电话：</th>
            <td><form:input path="corp.tel"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>移动电话：</th>
            <td><form:input path="corp.mobile"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>电子邮件：</th>
            <td><form:input path="corp.email"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>注册资金：</th>
            <td><form:input path="corp.capital"/>(万元)</td>
          </tr>
          <tr>
            <th><span class="required">*</span>上年度从业人数：</th>
            <td><form:input path="corp.previousPersonals"/></td>
          </tr>
          <tr>
            <th><span class="required">*</span>上年度销售额：</th>
            <td><form:input path="corp.previousSales"/>(万元)</td>
          </tr>
          <tr>
            <th><span class="required">*</span>上年度企业净资产：</th>
            <td><form:input path="corp.previousAsset"/>(万元)</td>
          </tr>
          <tr>
            <th><span class="required">*</span>上年度税收总额：</th>
            <td><form:input path="corp.previousRevenue"/>(万元)</td>
          </tr>
          <tr>
            <th><span class="required">*</span>本年度税收：</th>
            <td><form:input path="corp.revenue"/>(万元)</td>
          </tr>
          <tr>
            <th><span class="required">*</span>单位性质：</th>
            <td>
              <div class="w350">
                <form:radiobuttons items="${lookups_DWXZ}" path="corp.type"
                                   itemLabel="lName" itemValue="lCode"/>
                <form:input path="corp.typeOther" cssClass="dn"/></div>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>产业领域：</th>
            <td>
              <div class="w350">
                <form:radiobuttons items="${lookups_CYLY}" path="corp.industry"
                                   itemLabel="lName" itemValue="lCode"/>
                <form:input path="corp.industryOther" cssClass="dn"/>
              </div>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>企业认定情况：</th>
            <td>
              <div class="w350">
<%--                 <form:radiobuttons items="${lookups_RDQK}" path="corp.level" --%>
<%--                                    itemLabel="lName" itemValue="lCode"/> --%>
<%--                 <form:input path="corp.levelOther" cssClass="dn"/> --%>
					<form:checkboxes path="corp.level" items="${lookups_RDQK}" itemLabel="lName" itemValue="lCode"/>
					<form:input path="corp.levelOther" cssClass="dn"/>
              </div>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>企业上市情况：</th>
            <td>
              <div class="w350">
                <form:radiobuttons items="${lookups_SSQK}" path="corp.list_situation"
                                   itemLabel="lName" itemValue="lCode"/>
                <form:input path="corp.list_other" cssClass="dn"/>
              </div>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>企业性质认定：</th>
            <td><form:radiobuttons items="${lookups_QYLX}" path="corp.funcClassify"
                                   itemLabel="lName" itemValue="lCode"/>
            </td>
          </tr>
          <tr class="dn">
            <th><span class="required">*</span>功能性机构服务内容：</th>
            <td>
              <div class="w350">
                <form:radiobuttons items="${lookups_FWJG}" path="corp.funcInfo"
                                   itemLabel="lName" itemValue="lCode"/>
                <form:input path="corp.funcOther" cssClass="dn"/>
              </div>
            </td>
          </tr>
          <tr>
            <th>所属园区：</th>
            <td><form:input path="corp.park"/>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>公司简介：</th>
            <td><form:textarea path="corp.description" cols="40" rows="5" cssClass="floatLft"/>
            </td>
          </tr>
           <tr>
            <th><span class="required">*</span>近年来业务开展情况及主要项目：</th>
            <td><form:textarea path="corp.business_situation" cols="40" rows="5" cssClass="floatLft"/>
            </td>
          </tr>
           <tr>
            <th><span class="required">*</span>获得投融资情况：</th>
            <td><form:textarea path="corp.investment_situation" cols="40" rows="5" cssClass="floatLft"/>
            </td>
          </tr>
          <tr>
            <th><span class="required">*</span>证明材料(多附件上传)：</th>
            <td>
              <div class="w350">
                <label for="displayName" style="float: left;">名称：</label><input type="text" id="displayName"
                                                                                class="input_txt w_109"/>
                <gw:fileUpload  rename="true"/>
              </div>
              <div><a style="color: red">注：企业营业执照、税务登记证、组织机构代码证（原三证持有企业）<br/>
					&nbsp&nbsp&nbsp&nbsp统一社会信用代码证（三证合一企业）</a>
			  </div>
            </td>
          </tr>
          
          <tr>
            <th>验证码：</th>
            <td>
              <input name="" type="text" id="captchaInput"
                     title="<fmt:message key="website.label.inputCaptcha"/>"/>
              <gw:captcha/>
            </td>
          </tr>
          <tr>
          	<th><span class="required">*</span>承诺诚信条款：</th>
          	<td>
          		<div>
          			 <input style="float: left;margin-top: 8px;margin-bottom: 8px;" id="honesty" type="checkbox"/> <a style="color: green;float: left;">我承诺上面的信息全部属实,若不属实,可被取消资格和受到惩罚,并纳入诚信黑名单</a>
          		</div>
          	</td>
          </tr>
        </table>
        <div class="log-bott clearfix ml320 pb10">
          <dl>
            <dt class="dl" onclick="doSubmit();">注册</dt>
          </dl>
        </div>
      </form:form>
    </div>
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<c:import url="coupon/commons/footer.jsp"/>
<script>
  var reg;
  var errorRequired = "<span class='red'><fmt:message key="website.label.required"/></span>";
  var errorCurrency = "<span class='red'><fmt:message key="website.label.inputCurrency"/> </span>";
  var errorInteger = "<span class='red'><fmt:message key="website.label.inputInteger"/></span>";
  var errorEmail = "<span class='red'><fmt:message key="website.label.inputEmail"/> </span>";
  var errorMobile = "<span class='red'><fmt:message key="website.label.inputMobile"/> </span>";
  var errorPostcode = "<span class='red'><fmt:message key="website.label.inputPostcode"/> </span>";
  var errorPwd = "<span class='red'><fmt:message key="website.label.confirmPwd"/> </span>";
  var errorRadio = "<span class='red'><fmt:message key="website.label.requiredChoose"/> </span>";
  var errorCaptcha = "<span class='red'><fmt:message key="website.label.inputCaptcha"/></span>";
  var errorDuplicated = "<span class='red'><fmt:message key="website.label.duplicated"/></span>";
  var correct = "<span class='green'><fmt:message key="website.label.correctInput"/></span>";
  var honestyStr = "<span class='red'><fmt:message key="website.radio.honesty"/></span>";
  
  var required = ['user.account', 'user.realName', 'user.contact', 'user.pwd', 'corp.unitName', 'corp.representative', 'corp.registerAddress', 'corp.contactAddress', 'corp.tel'
                  ,'corp.description','corp.business_situation','corp.investment_situation'
                  ];
  var currency = ['corp.capital', 'corp.previousSales', 'corp.previousAsset', 'corp.previousRevenue'];
  var requiredLicense = ['corp.orgCode', 'corp.license', 'corp.taxLicense'];
  var requiredRadio = ['corp.type', 'corp.industry', 'corp.level'];
  var duplicated = ['user.account', 'corp.creditCode', 'corp.taxLicense', 'corp.license', 'corp.orgCode', 'corp.unitName'];

  $(function () {
    $("#form").find("input[name='corp.isUnionCard']").bind('click', function () {
      var radioTR = $(this).parent().parent().parent();
      if ($(this).val() == 1) {
        radioTR.next().show();
        radioTR.next().next().hide();
        radioTR.next().next().next().hide();
        radioTR.next().next().next().next().hide();
      }
      else {
        radioTR.next().hide();
        radioTR.next().next().show();
        radioTR.next().next().next().show();
        radioTR.next().next().next().next().show();
      }
    });
    $("#form").find("input[name='corp.type']").bind('click', function () {
      $(this).val() == 'otherCorp' ? $("input[id='corp.typeOther']").show() : $("input[id='corp.typeOther']").hide();
    });
    $("#form").find("input[name='corp.industry']").bind('click', function () {
      $(this).val() == 'otherRegion' ? $("input[id='corp.industryOther']").show() : $("input[id='corp.industryOther']").hide();
    });
    $("#form").find("input[name='corp.level']").bind('click', function () {
      $(this).val() == 'otherBusiness' ? $("input[id='corp.levelOther']").show() : $("input[id='corp.levelOther']").hide();
    });
    $("#form").find("input[name='corp.list_situation']").bind('click', function () {
        $(this).val() == 'otherboard' ? $("input[id='corp.list_other']").show() : $("input[id='corp.list_other']").hide();
      });
    $("#form").find("input[name='corp.funcClassify']").bind('click', function () {
      var radioTR = $(this).parent().parent().parent();
      $(this).val() == "orgUser" ? radioTR.next().show() : radioTR.next().hide();
    });
    $("#form").find("input[name='corp.funcInfo']").bind('click', function () {
      $(this).val() == 'otherServ' ? $("input[id='corp.funcOther']").show() : $("input[id='corp.funcOther']").hide();
    });
    //验证是否有重复
    $.each(duplicated, function (idx, obj) {
      $("input[id='" + obj + "']").focus(function () {
        $(this).next().remove();
      }).blur(function () {
        var thiz = $(this);
        $.post('checkDuplicated', {fieldName: obj, fieldValue: thiz.val()}, function (duplicated) {
          if (duplicated == "true") {
            thiz.after(errorDuplicated);
          }else{
            thiz.after(correct);
          }
        });
      });
    });
    //必填项
    $.each(required, function (idx, obj) {
      $("input[id='" + obj + "']").focus(function () {
        $(this).next().remove();
      }).blur(function () {
        if ($(this).val() == null || $(this).val() == '') {
          $(this).after(errorRequired);
        }
      });
      
      //textarea控制必填
      $("textarea[id='" + obj + "']").focus(function () {
    	 // $(this).css({"float":'left'});
          $(this).next().remove();
        }).blur(function () {
          if ($(this).val() == null || $(this).val() == '') {
            $(this).after(errorRequired);
          }
        });
    });
    //小数
    $.each(currency, function (idx, obj) {
      $("input[id='" + obj + "']").focus(function () {
        $(this).next().remove();
      }).blur(function () {
        var reg = /^(([1-9]\d*)|\d)(\.\d{1,2})?$/;
        if (reg.test($("input[id='" + obj + "']").val())) {
        } else {
          $("input[id='" + obj + "']").after(errorCurrency);
        }
      });
    });
    //整数
    $("input[id='corp.previousPersonals']").focus(function () {
      $("input[id='corp.previousPersonals']").next().remove();
    }).blur(function () {
      reg = /(^[1-9]\d*$)/;
      if (reg.test($(this).val())) {
      } else {
        $("input[id='corp.previousPersonals']").after(errorInteger);
      }
    });
    //验证手机号码
    $("input[id='corp.mobile']").focus(function () {
      $("input[id='corp.mobile']").next().remove();
    }).blur(function () {
      reg = /^((\d{3}-\d{8}|\d{4}-\d{7,8})|(1[3|5|7|8][0-9]{9}))$/;
      if (reg.test($("input[id='corp.mobile']").val())) {
      } else {
        $("input[id='corp.mobile']").after(errorMobile);
      }
    });
    //邮箱
    $("input[id='corp.email']").focus(function () {
      $("input[id='corp.email']").next().remove();
    }).blur(function () {
      reg = /^\w{3,}@\w+(\.\w+)+$/;
      if (reg.test($("input[id='corp.email']").val())) {
      } else {
        $("input[id='corp.email']").after(errorEmail);
      }
    });
    //验证邮编
    $("input[id='corp.postcode']").focus(function () {
      $("input[id='corp.postcode']").next().remove();
    }).blur(function () {
      reg = /^[1-9][0-9]{5}$/;
      if (reg.test($("input[id='corp.postcode']").val())) {
      } else {
        $("input[id='corp.postcode']").after(errorPostcode);
      }
    });
    //验证密码
    $("#confirmPwd").focus(function () {
      $("#confirmPwd").next().remove();
    }).blur(function () {
      if ($("input[id='user.pwd']").val() == $('#confirmPwd').val()) {
      } else {
        $("#confirmPwd").after(errorPwd);
      }
    });
    //验证三证合一
    $('input:radio[name="corp.isUnionCard"]').click(function () {
      var var1 = $('input:radio[name="corp.isUnionCard"]:checked').val();
      $("input[name='corp.isUnionCard']:last").parent().next().remove();
      if (var1 == 1) {
        //判断统一社会信用代码不能为空
        $("input[id='corp.creditCode']").focus(function () {
          $("input[id='corp.creditCode']").next().remove();
        }).blur(function () {
          if ($("input[id='corp.creditCode']").val() == "") {
            $("input[id='corp.creditCode']").after(errorRequired);
          }
        });
      } else if (var1 == 0) {
        $.each(requiredLicense, function (idx, obj) {
              $("input[id='" + obj + "']").focus(function () {
                $("input[id='" + obj + "']").next().remove();
              }).blur(function () {
                if ($("input[id='" + obj + "']").val() == null || $("input[id='" + obj + "']").val() == '') {
                  $("input[id='" + obj + "']").after(errorRequired);
                }
              });
            }
        );
      } else {
        $("input[name='corp.isUnionCard']:last").parent().after(errorRadio);
      }
    });
//验证单位性质,产业领域,企业认定情况
    $.each(requiredRadio, function (idx, obj) {
      $("input:radio[name='" + obj + "']").click(function () {
        $('input[id="' + obj + 'Other"]').next().remove();
        var var2 = $("input:radio[name='" + obj + "']:checked").val();
        if (var2 == "otherCorp" || var2 == "otherRegion" || var2 == "otherBusiness") {
          $('input[name="' + obj + 'Other"]').focus(function () {
            $('input[name="' + obj + 'Other"]').next().remove();
          }).blur(function () {
            if ($('input[name="' + obj + 'Other"]').val() == "") {
              $('input[name="' + obj + 'Other"]').next().remove();
              $('input[name="' + obj + 'Other"]').after(errorRequired);
            }
          });
        }
      });
    });
    //验证是否是功能性机构
//     $("input:radio[name='corp.isFunc']").click(function () {
//       $("input:radio[name='corp.isFunc']").parent().last().next().remove();
//       var var3 = $('input:radio[name="corp.isFunc"]:checked').val();
//       if (var3 == 1) {
//         $('input:radio[name="corp.funcInfo"]').click(function () {
//           $("input[id='corp.funcOther']").next().remove();
//           var var4 = $('input:radio[name="corp.funcInfo"]:checked').val();
//           if (var4 == "otherServ") {
//             $("input[id='corp.funcOther']").focus(function () {
//               $("input[id='corp.funcOther']").next().remove();
//             }).blur(function () {
//               if ($("input[id='corp.funcOther']").val() == "") {
//                 $("input[id='corp.funcOther']").next().remove();
//                 $("input[id='corp.funcOther']").after(errorRequired);
//               }
//             });
//           }
//         });
//       } else if (var3 == null) {
//         $("input[id='corp.isFunc2']").parent().after(errorRadio);
//       }
//     });
  });

  checkForm = function () {
    var flag = true;
    if(!$("#honesty").prop("checked")){
    	flag = false;
    	$("#honesty").parent().find('span').remove();
  	  $("#honesty").parent().append(honestyStr);
    }
    $.post('${base}/validCaptcha.htm', {keyInput: $('#captchaInput').val()}, function (data) {
      if (data != 'ok') {
        $('.kcaptcha').after(errorCaptcha);
      } else {
        $('#form').find("td span[class='red']").remove();
        //验证必填项
        if (typeof(required) != 'undefined' && required.length > 0) {
          $.each(required, function (idx, obj) {
                if ($("input[id='" + obj + "']").val() == null || $("input[id='" + obj + "']").val() == '') {
                  flag = false;
                  $("input[id='" + obj + "']").after(errorRequired);
                }
                
                if ($("textarea[id='" + obj + "']").val() == null || $("textarea[id='" + obj + "']").val() == '') {
                    flag = false;
                    $("textarea[id='" + obj + "']").after(errorRequired);
                  }
              }
          )
        }
        //验证小数
        if (typeof(currency) != 'undefined' && currency.length > 0) {
          $.each(currency, function (idx, obj) {
                var reg = /^(([1-9]\d*)|\d)(\.\d{1,2})?$/;
                if (reg.test($("input[id='" + obj + "']").val())) {
                } else {
                  flag = false;
                  $("input[id='" + obj + "']").after(errorCurrency);
                }
              }
          )
        }
        //验证整数
        reg = /(^[1-9]\d*$)/;
        if (reg.test($("input[id='corp.previousPersonals']").val())) {
        } else {
          flag = false;
          $("input[id='corp.previousPersonals']").after(errorInteger);
        }
        //验证手机号码
        reg = /^((\d{3}-\d{8}|\d{4}-\d{7,8})|(1[3|5|7|8][0-9]{9}))$/;
        if (reg.test($("input[id='corp.mobile']").val())) {
        } else {
          flag = false;
          $("input[id='corp.mobile']").after(errorMobile);
        }
        //验证邮箱
        reg = /^\w{3,}@\w+(\.\w+)+$/;
        if (reg.test($("input[id='corp.email']").val())) {
        } else {
          flag = false;
          $("input[id='corp.email']").after(errorEmail);
        }
        //验证邮编
        reg = /^[1-9][0-9]{5}$/;
        if (reg.test($("input[id='corp.postcode']").val())) {
        } else {
          flag = false;
          $("input[id='corp.postcode']").after(errorPostcode);
        }
        //验证密码
        if ($("input[id='user.pwd']").val() == $('#confirmPwd').val()) {
        } else {
          flag = false;
          $("#confirmPwd").after(errorPwd);
        }
        //验证三证合一
        var var1 = $('input:radio[name="corp.isUnionCard"]:checked').val();
        if (var1 == 1) {
          //判断统一社会信用代码不能为空
          if ($("input[id='corp.creditCode']").val() == "") {
            flag = false;
            $("input[id='corp.creditCode']").after(errorRequired);
          }
        } else if (var1 == 0) {
          if (typeof(requiredLicense) != 'undefined' && requiredLicense.length > 0) {
            $.each(requiredLicense, function (idx, obj) {
                  if ($("input[id='" + obj + "']").val() == null || $("input[id='" + obj + "']").val() == '') {
                    flag = false;
                    $("input[id='" + obj + "']").after(errorRequired);
                  }
                }
            );
          }
        } else {
          $("input[name='corp.isUnionCard']:last").parent().after(errorRadio);
        }
        //验证单位性质,产业领域,企业认定情况
        if (typeof(requiredRadio) != 'undefined' && requiredRadio.length > 0) {
          $.each(requiredRadio, function (idx, obj) {
                var var2 = $('input:radio[name="' + obj + '"]:checked').val();
                if (var2 == "otherCorp" || var2 == "otherRegion" || var2 == "otherBusiness") {
                  if ($('input[id="' + obj + 'Other"]').val() == "") {
                    flag = false;
                    $('input[id="' + obj + 'Other"]').after(errorRequired);
                  }
                } else if (var2 == null) {
                  flag = false;
                  $('input[id="' + obj + 'Other"]').after(errorRadio);
                }
              }
          );
        }
        //验证功能性机构
//         var var3 = $('input:radio[name="corp.isFunc"]:checked').val();
//         if (var3 == 1) {
//           var var4 = $('input:radio[name="corp.funcInfo"]:checked').val();
//           if (var4 == "otherServ") {
//             //判断'功能性机构服务内容-其他专业服务'不能为空
//             if ($("input[id='corp.funcOther']").val() == "") {
//               flag = false;
//               $("input[id='corp.funcOther']").after(errorRequired);
//             }
//           } else if (var4 == null) {
//             flag = false;
//             $("input[id='corp.funcOther']").after(errorRadio);
//           }
//         } else if (var3 == null) {
//           flag = false;
//           $("input[id='corp.isFunc2']").parent().after(errorRadio);
//         }
      }
    });
    return flag;
  };

  doSubmit = function () {
    if (checkForm())
      $('#form').submit();
    
  }

</script>
</body>
</html>

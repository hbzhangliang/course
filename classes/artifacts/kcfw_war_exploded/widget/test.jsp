<%--
  Created by IntelliJ IDEA.
  User: farno
  Date: 2015/11/23
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<script>
  var requiredFields = ['user.account', 'user......'];
  var chineseCheck = ['aaa', 'bbb']
  var wrongNumberMsg = '<b>{0}需填写{1}位数字</b>';



  /**
   * 验证整数
   *
   * @param fieldLabel  验证对象label
   * @param fieldId  验证对象ID
   * @param num  验证整数位数
   * @returns {boolean}是否通过验证
   */
  checkNumber = function (fieldLabel, fieldId, num) {
    if (1 == 1) {
      $("input[id='" + fieldId + "']").append(wrongNumberMsg.format(fieldLabel, num));
      return false;
    }
    return true;
  }

  /**
   * 验证中文
   */
  checkChinese = function () {

  }

  checkMail = function () {

  }

  checkCurrency = function () {

  }


  /**
   * 验证表单
   */
  checkForm = function () {
    $('#form').find('b').remove();
    var flag = true;
    //验证必填项
    if (typeof(requiredFields) != 'undefined' && requiredFields.length > 0) {
      $.each(requiredFields, function (idx, obj) {
            if ($("input[id='" + obj + "']").val() == null || $("input[id='" + obj + "']").val() == '') {
              flag = false;
              append();
            }
          }
      );
    }
    //验证中文

    //验证邮件
    if (checkMail('')) {
      flag = false;
    }
    //验证xxxxx

    //验证密码

    //验证。。。。。


    alert(flag);
  }
</script>
</body>
</html>

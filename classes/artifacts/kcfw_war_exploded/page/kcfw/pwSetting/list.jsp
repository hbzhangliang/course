<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
  <!--left start-->
  <div class="left" id="wrapper-250">
    <c:import url="../../../include/menu.jsp"/>
  </div>
  <!--left end-->
  <!--right start-->
  <div class="right clearfix">
    <!--bread_crumbs start-->
    <c:import url="../../../include/navigation.jsp"/>
    <!--bread_crumbs end-->
	<div class="an">
    </div>
    <!--bt end-->
    <!--table start-->
    <form id="pwChangeForm">
    <a href="javascript:void(0);" class="table_head">>>修改密码<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
      <tr class="hidePannel">
      	<td class="td1" width="15%">编号</td>
      	<td class="td2" width="75%">
      		<input id="id" name="id" type="text" class="input"/>
      </tr>
      <tr>
      	<td class="td1" width="15%">用户名</td>
      	<td class="td2" width="75%">
      		<label id="realName" name="realName"></label>
      </tr>
      <tr>
      	<td class="td1">账户</td>
      	<td class="td2">
      		<label id="account" name="account"></label>
      </tr>
      <tr>
      	<td class="td1">新密码</td>
      	<td class="td2"><input id="pwd" class="input_txt w_209" name="pwd" type="password" class="input"/></td>
      </tr>
      <tr>
      	<td class="td1">确认新密码</td>
      	<td class="td2"><input class="input_txt w_209" id="pwdConfim" type="password" class="input"/></td>
      </tr>
    </table>
    
     <div class="an">
        <button type="button" onclick="pwChange()" class="ico_tmpSave">
          确认修改</button>
    </div>
    </form>
    <!--table end-->
  <!--right end-->
  </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
 function init_page(){
	 $("#id").val("${currentUser.id}");
	 $("#account").text("${currentUser.account}");
	 $("#realName").text("${currentUser.realName}");
 }

 function pwChange(){
	 if($("#pwd").val().length==0){
		 msg('密码不能为空');
		 return;
	 }
	 if($("#pwd").val()!=$("#pwdConfim").val()){
		 msg('两次输入的密码不一致');
		 return;
	 }
	 if($("#pwd").val().length<6){
		 msg('请输入不少于六位的密码');
		 return;
	 }
	 $.post(base+'/sys/user/pwSetting.htm', $('#pwChangeForm').serialize(), function (data) {
         if (data == 1) {
            msg("密码修改成功!");
         } else {
           msg(data);
         }
       });
	 
 }
 
 $(function(){
	 init_page();
	 
 });
</script>

</body>
</html>

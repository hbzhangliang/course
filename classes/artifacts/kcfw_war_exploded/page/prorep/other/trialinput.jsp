<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
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
    <!--bt start-->
    <!--bt end-->
    <!--tit start-->
    <!--tit start-->
        <form:form action="save.htm" method="post" modelAttribute="bean" id="form">
            <c:import url="../../../include/pageParams.jsp"/>
            <c:import url="../../../include/businessEntityParams.jsp"/>
            <a href="javascript:void(0);" class="table_head">>>初审人员信息编辑<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td1"><b>人员登录账号</b></td>
                <td class="td2"><form:input path="account" cssClass="input_txt w_209"/></td>
                <td class="td1"><b>人员密码</b></td>
                <td class="td2"><form:input path="pwd" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td1"><b>人员名称</b></td>
                <td class="td2"><form:input path="realName" cssClass="input_txt w_209"/></td>
                <td class="td1"><b>人员邮箱</b></td>
                <td class="td2"><form:input path="mail" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td1" width="18%"><b>拥有项目初审权限(*可多选)</b></td>
                <td class="td2" colspan="3">
                    <form:checkboxes  items="${lookups_XMLB}" path="detailtype"  itemLabel="lName" itemValue="lCode"/>
                </td>
            </tr>
            <form:hidden path="flag"  value="1"/>
            <form:hidden path="type" value="trial"/>
          </table>
            <div class="an">
                <button type="button" onclick="doSubmit();" class="ico_tmpSave">
                    <fmt:message key="sys.title.save"/></button>
                <button type="button" onclick="history.back();" class="ico_return">
                    <fmt:message key="sys.title.return"/></button>
            </div>
        </form:form>


    </div>

</div>

<script>

    function init_page(){
        $("#pwd").val("");

        var detailtype="${bean.detailtype}";
        strCheck(detailtype,'detailtype');
    }
    function strCheck(str,name){
        if(str.length>0){
            var count=str.split(",").length;
            for(var i=0;i<count;i++){
                var sid=str.split(",")[i];
                $("input[type='checkbox'][name='"+name+"']").each(function(index,item){
                    if($(item).val()==sid){
                        $(item).attr("checked",'checked');
                    }

                });
            }
        }
    }
    $(function(){
        init_page();
    });

</script>


</body>



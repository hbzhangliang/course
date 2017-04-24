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
            <c:import url="../../../include/bizEntity.jsp"/>
            <a href="javascript:void(0);" class="table_head">>>创业投资机构登记<span onclick="movePanel('panel1')"></span></a>
            <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr>
                    <td class="td1" width="16%"><b>机构名称</b></td>
                    <td class="td2" width="30%"><form:input path="name" cssClass="input_txt w_209"/></td>
                    <td class="td1" width="16%"><b>注册资本</b></td>
                    <td class="td2" width="30%"><form:input path="capital" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>机构类别</b></td>
                    <td class="td2" colspan="3">
                        <form:radiobuttons items="${lookups_JGLB}" path="orgtype"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>通讯地址</b></td>
                    <td class="td2"><form:input path="address" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>联系人</b></td>
                    <td class="td2"><form:input path="contact" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>联系电话</b></td>
                    <td class="td2"><form:input path="tel" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>网址</b></td>
                    <td class="td2"><form:input path="network" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>邮箱</b></td>
                    <td class="td2" colspan="3"><form:input path="email" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>企业性质</b></td>
                    <td class="td2" colspan="3">
                        <form:radiobuttons items="${lookups_QYXZ}" path="corpnature"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>企业形式</b></td>
                    <td class="td2" colspan="3">
                        <form:radiobuttons items="${lookups_QYXS}" path="corptype"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>机构备案情况</b></td>
                    <td class="td2" colspan="3">
                        <form:radiobuttons items="${lookups_BAQK}" path="record"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>所管理资产合计(万元)</b></td>
                    <td class="td2" colspan="3">
                        <form:input path="managemoney" cssClass="input_txt w_209"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>投资主要领域</b></td>
                    <td class="td2" colspan="3">
                        <form:checkboxes  items="${lookups_TZLY}" path="field"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>职工总数</b></td>
                    <td class="td2"><form:input path="staffcount" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>高管人数</b></td>
                    <td class="td2"><form:input path="seniorcount" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>负责人</b></td>
                    <td class="td2" colspan="3">
                        <form:input path="officer" cssClass="input_txt w_209"/>
                    </td>
                </tr>

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

        var strfield="${bean.field}";
        strCheck(strfield,'field');
    }

    //前台绑定checkbox
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



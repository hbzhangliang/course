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
            <a href="javascript:void(0);" class="table_head">>>专家人员登录信息编辑<span onclick="movePanel('panel1')"></span></a>
            <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr>
                    <td class="td1"><b>人员登录账号</b></td>
                    <td class="td2"><form:input path="account" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>人员密码</b></td>
                    <td class="td2"><form:input path="pwd" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1" width="18%"><b>拥有项目初审权限(*可多选)</b></td>
                    <td class="td2" colspan="3">
                        <form:checkboxes  items="${lookups_XMLB}" path="detailtype"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <form:hidden path="flag"  value="1"/>
                <form:hidden path="type" value="professor"/>
            </table>
            <a href="javascript:void(0);" class="table_head" style="margin-top: 15px;">>>专家人员详细信息编辑<span onclick="movePanel('panel1')"></span></a>
            <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr>
                    <td class="td1" width="12%"><b>姓名</b></td>
                    <td class="td2" width="18%"><form:input path="prof.name" cssClass="input_txt w_150"/></td>
                    <td class="td1" width="12%"><b>性别</b></td>
                    <td class="td2" width="18%">
                        <form:radiobutton path="prof.gender" value="1"/>男
                        <form:radiobutton path="prof.gender" value="0"/>女
                    </td>
                    <td class="td1" width="12%"><b>出生日期</b></td>
                    <td class="td2" width="18%">
                        <form:input path="prof.birthDate" cssClass="input_txt w_150"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1"><b>家庭电话</b></td>
                    <td class="td2"><form:input path="prof.homecall" cssClass="input_txt w_150"/></td>
                    <td class="td1" rowspan="2" colspan="1"><b>Email</b></td>
                    <td class="td2" rowspan="2" colspan="3"><form:input path="prof.email" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>手机</b></td>
                    <td class="td2"><form:input path="prof.phone" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>证件类型</b></td>
                    <td class="td2"><form:input path="prof.cardtype" cssClass="input_txt w_150"/></td>
                    <td class="td1"><b>证件号码</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.cardnum" cssClass="input_txt w_209"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>邮寄地址</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.address" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>邮政编码</b></td>
                    <td class="td2"><form:input path="prof.postcode" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>工作单位</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.workunit" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>单位类别</b></td>
                    <td class="td2"><form:input path="prof.unittype" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>单位地址</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.unitaddress" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>邮政编码</b></td>
                    <td class="td2"><form:input path="prof.unitpostcode" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>所在部门</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.department" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>职称</b></td>
                    <td class="td2"><form:input path="prof.position" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>职务</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.post" cssClass="input_txt w_209"/></td>
                    <td class="td1"><b>行政职级</b></td>
                    <td class="td2"><form:input path="prof.level" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>单位电话1</b></td>
                    <td class="td2"><form:input path="prof.call1" cssClass="input_txt w_150"/></td>
                    <td class="td1"><b>单位电话2</b></td>
                    <td class="td2"><form:input path="prof.call2" cssClass="input_txt w_150"/></td>
                    <td class="td1"><b>传真</b></td>
                    <td class="td2"><form:input path="prof.fax" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>其他任职单位</b></td>
                    <td class="td2" colspan="5"><form:input path="prof.othercorp" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>文化程度</b></td>
                    <td class="td2"><form:input path="prof.education" cssClass="input_txt w_150"/></td>
                    <td class="td1"><b>学位学历</b></td>
                    <td class="td2"><form:input path="prof.degree" cssClass="input_txt w_150"/></td>
                    <td class="td1"><b>学位国别</b></td>
                    <td class="td2"><form:input path="prof.degreecounty" cssClass="input_txt w_150"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>外语</b></td>
                    <td class="td2" colspan="5"><form:input path="prof.foreignlan" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td3" colspan="6"><b>本人具有专长的学科和领域</b></td>
                </tr>
                <tr>
                    <td class="td1" colspan="2"><b>所学专业领域</b></td>
                    <td class="td2" colspan="4"><form:input path="prof.field" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1" colspan="2"><b>长期从事领域</b></td>
                    <td class="td2" colspan="4"><form:input path="prof.longfield" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1" colspan="2" rowspan="2"><b>擅长应用领域</b></td>
                    <td class="td2" colspan="4"><form:input path="prof.appfield" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1"><b>擅长应用领域</b></td>
                    <td class="td2" colspan="3"><form:input path="prof.otherfield" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1" colspan="2"><b>所属行业</b></td>
                    <td class="td2" colspan="4"><form:input path="prof.industry" cssClass="input_txt w_440"/></td>
                </tr>
                <tr>
                    <td class="td1" colspan="2"><b>专业大类</b></td>
                    <td class="td2" colspan="4">
                        <form:radiobuttons items="${lookups_ZYDL}" path="prof.major"  itemLabel="lName" itemValue="lCode"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1" colspan="2"><b>是否已纳入市科委专家库</b></td>
                    <td class="td2" colspan="4">
                        <form:radiobutton path="prof.iscityprof" value="1"/>是
                        <form:radiobutton path="prof.iscityprof" value="0"/>否
                    </td>
                    <form:hidden path="prof.id"/>

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
    var requiredList = ["#account","#pwd","#prof\\.name"];

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



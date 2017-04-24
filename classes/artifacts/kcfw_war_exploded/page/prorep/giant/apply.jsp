<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body class="body_scroll">
<div class="tpspace">

<form:form action="ApplySave.htm" method="post" modelAttribute="apply" id="form">
    <c:import url="../../../include/pageParams.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>企业科技创新活动实施目标<span onclick="movePanel('panel1')"></span></a>
    <table id="applytable" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
    <form:hidden path="corpration.id"></form:hidden>
        <tr>
            <td class="td1" width="15%">实施期内研究开发费用总额</td>
            <td class="td2" width="75%" colspan="3"><form:input onkeyup="javascript:RepNumber(this)" path="totalfee" cssClass="text-input w_150"/>万元<label id="labtime" style="margin-left: 10px;"></label></td>
        </tr>
        <tr>
            <td class="td1"  width="15%">申请专项经费</td>
            <td class="td2"  width="15%" colspan="3"><form:input onkeyup="javascript:RepNumber(this)" path="specificfee" cssClass="text-input w_150"/>万元</td>
            <%--<td class="td1" width="15%">申请区级配套经费</td>--%>
            <%--<td class="td2" width="15%"><form:input onkeyup="javascript:RepNumber(this)" path="mathfound" cssClass="text-input w_150"/>万元</td>--%>
        </tr>
        <tr>
            <td class="td1"  width="15%">企业自有货币资金</td>
            <td class="td2"  width="15%"><form:input onkeyup="javascript:RepNumber(this)" path="currency" cssClass="text-input w_150"/>万元</td>
            <td class="td1" width="15%" rowspan="3">企业自筹经费说明：（提供相关证明文件作为附件）</td>
            <td class="td2" width="15%" rowspan="3">
                <form:textarea path="description" cssClass="input_txt" cols="60" rows="3"/>
            </td>
        </tr>
        <tr>
            <td class="td1">银行贷款</td>
            <td class="td2"><form:input onkeyup="javascript:RepNumber(this)" path="loan" cssClass="text-input w_150"/>万元</td>
        </tr>
        <tr>
            <td class="td1">其他渠道获得的资金</td>
            <td class="td2"><form:input onkeyup="javascript:RepNumber(this)" path="other" cssClass="text-input w_150"/>万元</td>
        </tr>
        <tr>
            <td class="td3">研究开发费用主要用途</td>
            <td class="td3">金额（万元）</td>
            <td class="td3">用途</td>
            <td class="td3">金额（万元）</td>
        </tr>
        <tr>
            <td class="td3">（一）直接费用</td>
            <td class="td3"></td>
            <td class="td3">7.国际合作与交流费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="cooperation" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">1.设备费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="equipment" cssClass="text-input w_150"/></td>
            <td class="td3">8.出版/文献/知识产权事务费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="properityright" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">其中：购置和试制设备费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="tryequip" cssClass="text-input w_150"/></td>
            <td class="td3">其中：知识产权购买费用</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="purchase" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">设备改造与租赁费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="rent" cssClass="text-input w_150"/></td>
            <td class="td3">9.劳务费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="labor" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">2.材料费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="material" cssClass="text-input w_150"/></td>
            <td class="td3">其中：科研人员</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="researcher" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">3.测试化验加工费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="checkfee" cssClass="text-input w_150"/></td>
            <td class="td3">引进人才</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="talents" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">4.燃料动力费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="fuelfee" cssClass="text-input w_150"/></td>
            <td class="td3">10.产学研合作（以合作协议为准）</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="learnsearch" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">5.差旅费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="travelfee" cssClass="text-input w_150"/></td>
            <td class="td3">11.其他费用</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="otherfee" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3">6.会议费</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="meetingfee" cssClass="text-input w_150"/></td>
            <td class="td3">（二）间接费用</td>
            <td class="td3"><form:input onkeyup="javascript:RepNumber(this)" path="indirect" cssClass="text-input w_150"/></td>
        </tr>
        <tr>
            <td class="td3" colspan="4">  企业申请说明 本企业申报材料内容可靠，相关数据真实。本企业承诺对申报材料内容的真实性承担法律责任。
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4">
                <form:textarea path="applyaddition" cssClass="input_txt" cols="120" rows="4"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4">推荐单位意见
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4">
                <form:textarea path="corpopinion" cssClass="input_txt" cols="120" rows="4"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4">上海市科学技术委员会、上海市经济和信息化委员会联审意见
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4">
                <form:textarea path="kwopinion" cssClass="input_txt" cols="120" rows="4"/>
            </td>
        </tr>

    </table>
    <div class="an">
        <button type="button" onclick="doApplySave();" class="ico_tmpSave">
            <fmt:message key="sys.title.save"/></button>
        <button type="button" onclick="history.back();" class="ico_return">
            <fmt:message key="sys.title.return"/></button>
    </div>
</form:form>


</div>
<script>

    function  doApplySave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?jrCaterotyCode=apply&op=g";
    }
    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

        var dt=new Date()
        var year=parseInt(dt.getFullYear());
        var info="(等于"+year.toString()+"年、"+(year+1).toString()+"年研究开发费用之和)" ;
        $("#labtime").text(info);

    }


    $(function(){
        init_page();

    });


</script>

</body>
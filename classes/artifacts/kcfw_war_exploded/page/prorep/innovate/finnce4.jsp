<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Finnce4Save.htm" method="post" modelAttribute="finance" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>企业发展预测<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="3"><b>项目完成时企业发展情况</b></td>
            </tr>
            <tr>
                <td class="td3" width="30%"><b>企业资产规模</b></td>
                <td class="td3" width="30%"><b>企业年营业收入</b></td>
                <td class="td3" width="30%"><b>企业人员总数</b></td>
            </tr>
            <tr>
                <td class="td4"><form:input path="corpscale" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/></td>
                <td class="td4"><form:input path="revenue" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/></td>
                <td class="td4"><form:input path="staffcount" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/></td>
            </tr>
            <tr>
                <td class="td3" colspan="3"><b>预测依据</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="3">
                    <form:textarea path="forecastbase" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="3"><b>企业未来五年定位及发展计划</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="3">
                    <form:textarea path="nextfiveyear" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doFinnce4Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doFinnce4Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=finnce4&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    }) ;

</script>
</body>

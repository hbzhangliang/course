<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>


</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Finnce2Save.htm" method="post" modelAttribute="finance" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目投资<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td3" colspan="4"><b>项目已完成投资情况</b></td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>项目已完成投资总额</b></td>
            <td class="td2" colspan="2">
                <form:input path="investment" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>资金使用情况说明</b></td>
            <td class="td2" colspan="3">
                <form:textarea path="usesituation" cssClass="input_txt" cols="90" rows="2"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4"><b>本项目实施期间新增投资预算及依据</b></td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>项目计划投资总额</b></td>
            <td class="td2" colspan="2">
                <form:input path="planinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>其中项目新增投资总额</b></td>
            <td class="td2" colspan="2">
                <form:input path="addinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>其中固定资产投资</b></td>
            <td class="td2">
                <form:input path="fixedinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
            <td class="td1"><b>其中流动资金投资</b></td>
            <td class="td2">
                <form:input path="flowinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4"><b>资金使用方向细目(包括固定资产投入，在建工程，研发投入，管理费等)</b></td>
        </tr>
        <tr>
            <td class="td4" colspan="4">
                <form:textarea path="userules" cssClass="input_txt" cols="100" rows="10"/>

            </td>
        </tr>
    </table>
        <a href="javascript:void(0);" class="table_head">>>项目融资(计划新增投资部分)<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="6"><b>地方立项上报(适用于已设立地方创新资金)地方</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="6">
                    <form:textarea path="projectreport" cssClass="input_txt" cols="110" rows="3"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>项目新增投资额</b></td>
                <td class="td2" colspan="5">
                    <form:input path="newinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>企业自筹</b></td>
                <td class="td2" colspan="5">
                    <form:input path="ownerinvest" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>银行贷款</b></td>
                <td class="td2" colspan="5">
                    <form:input path="bankloan" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="2"><b>财政拨款</b></td>
                <td class="td2" rowspan="2">
                    <form:input path="funding" cssClass="input_txt w_109" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>其中地方创新资金</b></td>
                <td class="td2">
                    <form:input path="localfund" cssClass="input_txt w_109" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>支持方式</b></td>
                <td class="td2">
                    <form:input path="supporttype1" cssClass="input_txt w_109"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>国家创新基金</b></td>
                <td class="td2">
                    <form:input path="coutryfund" cssClass="input_txt w_109" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>支持方式</b></td>
                <td class="td2">
                    <form:input path="supporttype2" cssClass="input_txt w_109"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>其他</b></td>
                <td class="td2" colspan="5">
                    <form:input path="otherfund" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td3" colspan="6"><b>企业自筹资金来源说明</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="6">
                    <form:textarea path="funddescript" cssClass="input_txt" cols="110" rows="5"/>
                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doFinnce2Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doFinnce2Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=finnce2&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    });

</script>
</body>
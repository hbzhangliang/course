<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Corp3Save.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>现有能力<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">

            <tr>
                <td class="td1" width="16%"><b>企业现有人力资源配置</b></td>
                <td class="td2">
                    <form:textarea path="human" cssClass="input_txt" cols="100" rows="10"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>研发能力</b></td>
                <td class="td2">
                    <form:textarea path="researchablity" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

            <tr>
                <td class="td1"><b>企业现有生产设备设施条件</b></td>
                <td class="td2">
                    <form:textarea path="equipment" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

            <tr>
                <td class="td1"><b>企业营销能力</b></td>
                <td class="td2">
                    <form:textarea path="saleability" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

            <tr>
                <td class="td1"><b>企业资金管理能力</b></td>
                <td class="td2">
                    <form:textarea path="moneymanage" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

            <tr>
                <td class="td1"><b>企业其他特殊能力</b></td>
                <td class="td2">
                    <form:textarea path="otherability" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

        </table>
        <div class="an">
            <button type="button" onclick="doCorp3Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doCorp3Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=corp3&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    });


</script>

</body>
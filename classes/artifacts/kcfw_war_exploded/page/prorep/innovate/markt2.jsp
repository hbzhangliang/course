<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Market2Save.htm" method="post" modelAttribute="market" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>竞争分析<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3"><b>项目产品的主要竞争者</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="competitor" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3"><b>项目产品技术性能比较优势</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="advantage" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3"><b>项目产品其他市场竞争优势</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="otheradvantg" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doMarket2Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doMarket2Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=markt2&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    })

</script>
</body>

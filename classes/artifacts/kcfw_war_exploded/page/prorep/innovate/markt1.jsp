<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Market1Save.htm" method="post" modelAttribute="market" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>市场概述<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3"><b>项目产品市场概况及需求情况</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="market" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3"><b>项目产品的目标市场</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="aimmarket" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doMarket1Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
     function doMarket1Save(){
         doSubmit();
         parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=markt1&op=g";
     }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    })

</script>
</body>

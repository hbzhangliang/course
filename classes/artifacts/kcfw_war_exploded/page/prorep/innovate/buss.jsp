<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>


</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="BusinessSave.htm" method="post" modelAttribute="business" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>商业模式<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <form:hidden path="survey.id"></form:hidden>
        <tr>
            <td class="td3"><b>项目产品开发,生产策略</b></td>
        </tr>
        <tr>
            <td class="td4">
                <form:textarea path="producemode" cssClass="input_txt" cols="100" rows="10"/>

            </td>
        </tr>
        <tr>
            <td class="td3"><b>项目产品的市场营销策略</b></td>
        </tr>
        <tr>
            <td class="td4">
                <form:textarea path="salemode" cssClass="input_txt" cols="100" rows="10"/>

            </td>
        </tr>
        <tr>
            <td class="td3"><b>项目产品获利模式</b></td>
        </tr>
        <tr>
            <td class="td4">
                <form:textarea path="profitmode" cssClass="input_txt" cols="100" rows="10"/>

            </td>
        </tr>
        <tr>
            <td class="td3"><b>公司治理结构及人力资源规划</b></td>
        </tr>
        <tr>
            <td class="td4">
                <form:textarea path="humanmode" cssClass="input_txt" cols="100" rows="10"/>

            </td>
        </tr>
     </table>
        <div class="an">
            <button type="button" onclick="doBusinessSaveSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doBusinessSaveSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=buss&op=g";
    }
    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    }
    $(function(){
        init_page();

    });



</script>
</body>
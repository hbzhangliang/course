<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Proj3Save.htm" method="post" modelAttribute="tech" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目技术成熟性<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="3"><b>项目技术成熟性</b></td>
            </tr>
            <tr>
                <td class="td3">项目目前所处阶段</td>
                <td class="td3">现阶段本项目直接参与人数</td>
                <td class="td3">项目产品销售情况</td>
            </tr>
            <tr>
                <td class="td4"><form:input path="stage" cssClass="input_txt w_209"/></td>
                <td class="td4"><form:input path="partynum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/></td>
                <td class="td4"><form:input path="salesituation" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td3" colspan="3"><b>关键技术成熟性分析</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="3">
                    <form:textarea path="keytech" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="3"><b>项目实施风险及应对措施</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="3">
                    <form:textarea path="riskmeasure" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

        </table>
        <div class="an">
            <button type="button" onclick="doProj3Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doProj3Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=proj3&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    }) ;

</script>
</body>
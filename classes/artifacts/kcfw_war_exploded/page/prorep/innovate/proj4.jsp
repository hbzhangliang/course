<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Proj4Save.htm" method="post" modelAttribute="tech" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目产品化<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td1" colspan="2" width="40%"><b>产品形态</b></td>
            <td class="td2" colspan="2"  width="40%">
                <form:input path="producetype" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>产品主要用途</b></td>
            <td class="td2" colspan="3">
                <form:textarea path="profeatures" cssClass="input_txt" cols="90" rows="3"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4"><b>项目现阶段效益情况(万元)</b></td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>本项目产品累计销售收入</b></td>
            <td class="td2">
                <form:input path="saleincome" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
            <td class="td1" width="16%"><b>本项目产品累计销售净利润</b></td>
            <td class="td2">
                <form:input path="netprofit" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>本项目产品累计缴税总额</b></td>
            <td class="td2">
                <form:input path="totaltaxes" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
            <td class="td1" width="16%"><b>本项目产品累计创汇(万美元)</b></td>
            <td class="td2">
                <form:input path="totalexchange" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="4"><b>项目产品生产方式及产业化条件</b></td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>生产方式</b></td>
            <td class="td2" colspan="2">
                <form:input path="produceway" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>项目产品生产方式及产业化条件</b></td>
            <td class="td2" colspan="3">
                <form:textarea path="producemode" cssClass="input_txt" cols="90" rows="3"/>
            </td>
        </tr>
    </table>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="3"><b>产品化实施计划(验收指标)</b></td>
            </tr>
            <tr>
                <td class="td3">项目完成时所处阶段</td>
                <td class="td3">项目产品销售情况</td>
                <td class="td3">执行的标准</td>
            </tr>
            <tr>
                <td class="td4"><form:input path="ltstage" cssClass="input_txt w_209"/></td>
                <td class="td4"><form:input path="ltsale" cssClass="input_txt w_209"/></td>
                <td class="td4"><form:input path="ltstand" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td3" colspan="3"><b>项目产品化实施计划的具体进度安排，阶段目标及主要工作内容</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="3">
                    <form:textarea path="ltcontent" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doProj4Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>

    function doProj4Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=proj4&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    });


</script>
</body>
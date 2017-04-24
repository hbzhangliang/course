<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Proj2Save.htm" method="post" modelAttribute="tech" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目技术原理<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="2"><b>项目的技术原理</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="theory" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>项目国内外研究开发现状</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="currentsituation" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>项目技术路线描述</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="maincontent" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>项目创新内容</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="innovate" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>预计项目完成时达到的关键技术及技术指标</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="techindex" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>项目实现的质量标准类型,标准名称</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="2">
                    <form:textarea path="qualitystand" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>
            <tr>
                <td class="td3" colspan="2"><b>通过本项目实施，企业获得的相关证书情况(验收指标)</b></td>
            </tr>
            <tr>
                <td class="td1" width="25%"><b>质量认证体系证书</b></td>
                <td class="td2" width="70%">
                    <form:input path="zlcertificate" cssClass="input_txt w_440"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="25%"><b>国家相关行业许可证书</b></td>
                <td class="td2" width="70%">
                    <form:input path="hycertificate" cssClass="input_txt w_440"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>专利证书</b></td>
                <td class="td2">
                    <form:input path="ptcertificate" cssClass="input_txt w_440"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>技术产品鉴定证书</b></td>
                <td class="td2">
                    <form:input path="tccertificate" cssClass="input_txt w_440"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>其他</b></td>
                <td class="td2">
                    <form:input path="otcertificate" cssClass="input_txt w_440"/>
                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doProj2Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doProj2Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=proj2&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    });

</script>
</body>

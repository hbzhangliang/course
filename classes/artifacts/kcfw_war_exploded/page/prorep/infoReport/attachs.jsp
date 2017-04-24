<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">

    <form:form action="AttachsSave.htm" method="post" modelAttribute="bean" id="form">
    <c:import url="../../../include/pageParams.jsp"/>
    <c:import url="../../../include/bizEntity.jsp"/>

    <a href="javascript:void(0);" class="table_head">>>上传附件<span onclick="movePanel('panel1')"></span></a>
    <table  class="table_03">
        <tr>
            <td>
                <label>(pdf格式)</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>复印件：营业执照,税务登记证(旧证)或统一信用代码(三证合一)</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>2015年审计报告</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>2015年资产负债表,利润表,现金流量表,所有者权益变动表,财务报表附注2016年至6月上半年财务报表(资产负债表,利润表,现金流量表)</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>企业证明材料(可选)：各种专利证书以及许可证书，资质证书，荣誉证书，查新报告等</label>
            </td>
        </tr>
        <tr>
            <td>
                <label>真实性承诺书(要求盖章，法人签名)</label>
            </td>
        </tr>
    </table>

        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td1" width="15%"><b>附件(多附件上传,可重命名)</b></td>
                <td class="td2" width="70%">
                    名称：<input type="text" id="displayName" class="input_txt w_209"/>
                    <%--<gw:fileUpload objectId="${bean.id}" rename="true"/>--%>
                    <gw:fileUploadCate objectId="${bean.id}" category="base" rename="true"/>
                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doAttachsSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
       </form:form>
</div>
<script>

    function doAttachsSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InfoReport/input.htm?xfCaterotyCode=attachs&op=g";
    }

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"attachs",hasmidExm);
    }

    $(function(){
        init_page();

    })


</script>


</body>
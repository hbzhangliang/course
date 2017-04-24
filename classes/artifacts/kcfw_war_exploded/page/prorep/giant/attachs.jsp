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

        <a href="javascript:void(0);" class="table_head">>>附件材料<span onclick="movePanel('panel1')"></span></a>
        <table  class="table_03">
            <tr>
                <td>
                    <label>1、有效期内的高新技术企业资格证书（复印件）</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>2、涉及特殊行业的，需提供相关许可证</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>3、近三个会计年度的财务会计报告复印件（提交与高新技术企业认定或复审一致的财务会计报告，并上传原件）</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>4、财务及相关规范化管理制度</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>5、研发机构建设相关证明材料（申报科技小巨人企业必须提供）</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label>6、企业认为需要提供的其他证明材料</label>
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
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?jrCaterotyCode=attachs&op=g";
    }

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    }

    $(function(){
        init_page();

    })

</script>


</body>
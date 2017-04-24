<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Corp2Save.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>管理团队<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">

            <tr>
                <td class="td1" width="16%"><b>核心团队</b></td>
                <td class="td2" colspan="3">
                    <form:textarea path="coreteamer" cssClass="input_txt" cols="100" rows="12"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>创业企业家介绍</b></td>
                <td class="td2" colspan="3">
                    <form:textarea path="entrepreneur" cssClass="input_txt" cols="100" rows="12"/>
                </td>
            </tr>

        </table>
        <div class="an">
            <button type="button" onclick="doCorp2Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doCorp2Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=corp2&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    });


</script>

</body>
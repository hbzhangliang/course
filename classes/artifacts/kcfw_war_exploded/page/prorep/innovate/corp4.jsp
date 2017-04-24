<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
<%@ include file="../../../include/textedit.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Corp4Save.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>发展情况<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">

            <tr>
                <td class="td1"><b>企业发展情况</b></td>
                <td class="td2">
                    <form:textarea path="development" cssClass="input_txt" cols="100" rows="10"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>曾经获得(或申请过)创新基金支持情况</b></td>
                <td class="td2">
                    <form:textarea path="getsupports" cssClass="input_txt" cols="100" rows="10"/>

                </td>
            </tr>

        </table>
        <div class="an">
            <button type="button" onclick="doCorp4Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doCorp4Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=corp4&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    });


</script>

</body>
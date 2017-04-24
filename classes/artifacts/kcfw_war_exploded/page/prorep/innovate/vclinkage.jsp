<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="VCLinkSave.htm" method="post" modelAttribute="vcLink" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>创投机构联动项目<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
              <tr>
                  <td class="td1" rowspan="2" width="12%"><b>投资前保障项目拟获投资情况</b></td>
                  <td class="td1" width="12%"><b>创业投资机构名称</b></td>
                  <td class="td2" width="20%">
                      <form:select path="vc1.id"  cssClass="input_txt w_209">
                          <form:option value="" label="--请选择--"/>
                          <c:forEach items="${vcs}" var="item">
                              <form:option value="${item.id}">${item.name}</form:option>
                          </c:forEach>
                      </form:select>
                  </td>
                  <td class="td1" width="12%"><b>辅导期限</b></td>
                  <td class="td2" width="20%">
                      自<form:input path="start1Date" cssClass="input_txt w_109"/><br/>至<form:input path="end1Date" cssClass="input_txt w_109"/>
                  </td>
              </tr>
             <tr>
                 <td class="td1"><b>拟投资额</b></td>
                 <td class="td2">
                     <form:input path="vcmoney" cssClass="input_txt w_109"/>万元
                 </td>
                 <td class="td1"><b>拟投时间</b></td>
                 <td class="td2">
                     <form:input path="vcDate" cssClass="input_txt w_109"/>
                 </td>
             </tr>
            <tr>
                <td class="td1" rowspan="2" width="15%"><b>投资后保障项目已获投资情况</b></td>
                <td class="td1" width="12%"><b>创业投资机构名称</b></td>
                <td class="td2" width="20%">
                    <form:select path="vc2.id"  cssClass="input_txt w_209">
                        <form:option value="" label="--请选择--"/>
                        <c:forEach items="${vcs}" var="item">
                            <form:option value="${item.id}">${item.name}</form:option>
                        </c:forEach>
                    </form:select>
                </td>
                <td class="td1" width="12%"><b>获得投资时间</b></td>
                <td class="td2" width="20%">
                    <form:input path="vcgetDate" cssClass="input_txt w_109"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>合同约定投资额</b></td>
                <td class="td2">
                    <form:input path="vcgetmoney" cssClass="input_txt w_109"/>万元
                </td>
                <td class="td1"><b>目前实际已到位金额</b></td>
                <td class="td2">
                    <form:input path="nowgetmoney" cssClass="input_txt w_109"/>万元
                </td>
            </tr>
        </table>
        <form:hidden path="survey.id"/>
        <div class="an">
            <button type="button" onclick="doVCLinkSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doVCLinkSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=vclinkage&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    }) ;
</script>
</body>
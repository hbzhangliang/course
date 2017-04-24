<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/taglib.jsp" %>
<%@ include file="../../include/resource.jsp" %>
<%@ include file="../../include/skin_homepage.jsp" %>
</head>
<body>
<div class="cont clearfix">
    <div style="width:1050px;  padding: 5px 0px; margin: 15px auto 15px auto ;background: #b4d2f0">
    <div class="an">
           <gw:bizSearch fields="企业名称" path="unitName" />
    </div>
             <gw:pagination mode="biz"/>
        <c:import url="help/audit.jsp"/>
    <table class="table_01">
        <tr>
            <th class="orderBy">企业名称</th>
            <th width="12%" class="orderBy">单位性质</th>
            <th width="10%" class="orderBy">产业领域</th>
            <th width="10%" class="orderBy">企业认定情况</th>
            <th width="15%" class="orderBy">企业性质认定</th>
            <th width="10%" class="orderBy">系统注册时间</th>
            <th width="8%" class="orderBy">审批情况</th>
            <th width="16%"><fmt:message key="biz.title.operation"/></th>
        </tr>
        <c:forEach items="${list}" var="bean" varStatus="i">
            <tr id="tr_${bean.id}">
                <td>${bean.unitName}</td>
                <td><gw:lookups category="${lookups_DWXZ}" lookupsCode="${bean.type}"/></td>
                <td><gw:lookups category="${lookups_CYLY}" lookupsCode="${bean.industry}"/></td>
                <td><gw:lookups category="${lookups_RDQK}" lookupsCode="${bean.level}"/></td>
                <td>
                    <gw:lookups category="${lookups_QYLX}" lookupsCode="${bean.funcClassify}"/>
                </td>
                <td><fmt:formatDate value="${bean.regDate}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <gw:lookups category="${lookups_QYZT}" lookupsCode="${bean.status}"/>
                </td>
                <td>
                    <div>
                        <c:if test="${bean.status eq 'reg'}">
                            <a href="javascript:void(0)" onclick="doApprove(this)">
                                审批
                            </a>
                        </c:if>
                            <a href="javascript:void(0)" onclick="doInput(this)">
                                修改
                            </a>
                            <a href="javascript:void(0)" onclick="doDelete(this)">
                                删除
                            </a>
                            <a href="javascript:void(0)" onclick="doPrint(this)">
                                打印
                            </a>
                    </div>
                </td>

            </tr>
        </c:forEach>
    </table>

    </div>

</div>
<c:import url="../../website/coupon/commons/mainfooter.jsp"/>

<script>
    function doDelete(item){
        $.messager.defaults = { ok: "删除", cancel: "取消",width:'300px',height:'150px'};
        $.messager.confirm('提示:','确认要删除企业?',function(flag){
            if(flag) {
                var corpId = $(item).closest('tr').attr('id').substring(3);
                $.post(base + '/corp/deleteCorp.htm', {id: corpId}, function (data) {
                    msg(data);
                    setTimeout(function () {
                        location.href="${base}/corp/list.htm";
                    }, 800)
                });
            }

        });
    }

    function doApprove(item){
        var _id=  $(item).parent().parent().parent().attr('id').substr(3);
        showauditwin(_id);
        <%--$.messager.defaults = { ok: "通过", cancel: "不通过",width:'300px',height:'150px'};--%>
        <%--$.messager.confirm('提示:','请确认企业审批结果?',function(flag){--%>
            <%--var corpId=$(item).closest('tr').attr('id').substring(3);--%>
            <%--$.post(base + '/corp/approve.htm', {id:corpId,flag:flag}, function (data) {--%>
                <%--msg(data);--%>
                <%--setTimeout(function(){--%>
                    <%--location.href="${base}/corp/list.htm";--%>
                <%--},800)--%>
            <%--});--%>
        <%--});--%>
    }
    function doPrint(item){
        var corpId=$(item).closest('tr').attr('id').substr(3);
        //msg(corpId);
        window.location.href=base+'/corp/printCorp.htm?id='+corpId;
    }



</script>

</body>

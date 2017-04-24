<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
    <!--left start-->
    <div class="left" id="wrapper-250">
        <c:import url="../../../include/menu.jsp"/>
    </div>
    <div class="right clearfix">
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>
        <c:import url="help/audit.jsp"></c:import>
        <div class="an">

            <c:if test="${currentUser.type eq 'corp'}">
                <gw:bizSearch fields="单位名称" path="corpname"  opts="add" />
            </c:if>
            <c:if test="${!(currentUser.type eq 'corp')}">
                <gw:bizSearch fields="单位名称" path="corpname"  />
            </c:if>
        </div>
        <gw:pagination mode="biz"/>
        <table class="table_01">
            <tr>
                <th width="5%"><input type="checkbox" id="selectAll" title="<fmt:message key="sys.title.selectAll"/>"/></th>
                <th width="10%" class="orderBy">单位名称</th>
                <th width="10%" class="orderBy">单位代码</th>
                <th width="10%" class="orderBy">通讯地址</th>
                <th width="10%" class="orderBy">联系人</th>
                <th width="10%" class="orderBy">状态</th>
                <th width="16%"><fmt:message key="biz.title.operation"/></th>
            </tr>

            <c:forEach items="${list}" var="bean" varStatus="i">
                <tr id="tr_${bean.id}">
                    <td><input class="chk" type="checkbox" id="chk_${bean.id}"/></td>
                    <td><a onclick="doTitleView(this)">${bean.corpname}</a></td>
                    <td>${bean.corpcode}</td>
                    <td>${bean.address}</td>
                    <td>${bean.contact}</td>
                    <td><gw:lookups category="${lookups_XMZT}" lookupsCode="${bean.status}"/></td>
                    <td>
                        <div>
                            <c:if test="${fn:contains(bean.opString,'h')}">
                                <a href="javascript:void(0)" onclick="doAuditAndConfig(this)">
                                    <fmt:message key="biz.title.aduit"/>
                                </a>
                            </c:if>
                            <c:if test="${fn:contains(bean.opString,'y')}">
                                <a href="javascript:void(0)" onclick="doAccept(this)">
                                    <fmt:message key="biz.title.accept"/>
                                </a>
                                <a href="javascript:void(0)" onclick="doInput(this)">
                                    <fmt:message key="sys.title.edit"/>
                                </a>
                            </c:if>
                            <c:if test="${fn:contains(bean.opString,'z')}">
                                <a href="javascript:void(0)" onclick="doMidExam(this)">
                                    <fmt:message key="biz.title.midexam"/>
                                </a>
                                <a href="javascript:void(0)" onclick="doInput(this)">
                                    <fmt:message key="sys.title.edit"/>
                                </a>
                            </c:if>
                            <c:if test="${fn:contains(bean.opString,'s')}">
                                <a href="javascript:void(0)" onclick="doSend(this)">
                                    <fmt:message key="sys.title.submit"/>
                                </a>
                                <a href="javascript:void(0)" onclick="doInput(this)">
                                    <fmt:message key="sys.title.edit"/>
                                </a>
                            </c:if>
                            <a href="javascript:void(0)" onclick="doView(this)">
                                <fmt:message key="sys.title.view"/>
                            </a>
                            <a href="javascript:void(0)" onclick="doPrint(this)">
                                <fmt:message key="biz.title.print"/>
                            </a>
                        </div>

                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<script>
    // var orderByList = ["name","campus.name","classinfo","course","fee","classtime","num","teacher.realName"];
    function doSend(obj){
        var _id=  $(obj).parent().parent().parent().attr('id').substr(3);
        var _action="submit";
        var _opintion="";
        $.messager.defaults = { ok: "确认", cancel: "取消",width:'300px',height:'150px'};
        $.messager.confirm('提示:','您确认要提交此项目申报吗?',function(event) {
            if (event) {
                $.post("send.htm",{id:_id,action:_action,opintion:_opintion},function(d){
                    msg(d);
                    setTimeout(function(){
                        window.location.href="list.htm";
                    },1000);
                }) ;
            }
        });
    }

    function doMidExam(obj){
        applyForCheck(obj,"midevaluterep","确定此项目要提交中期评估申请?");
    }

    function doAccept(obj){
        applyForCheck(obj,"acceptrep","确定此项目要提交验收申请?");
    }

    function doAuditAndConfig(obj){
        var _id=  $(obj).parent().parent().parent().attr('id').substr(3);
        showauditwin(_id);
    }

    $(function(){

    });

    function applyForCheck(obj,action,msm){
        var _id=  $(obj).parent().parent().parent().attr('id').substr(3);
        var _opintion="";
        $.messager.defaults = { ok: "确认", cancel: "取消",width:'300px',height:'150px'};
        $.messager.confirm('提示:',msm,function(event) {
            if (event) {
                $.post("send.htm",{id:_id,action:action,opintion:_opintion},function(d){
                    msg(d);
                    setTimeout(function(){
                        window.location.href="list.htm";
                    },1000);
                }) ;
            }
        });
    }
</script>
</body>
</html>
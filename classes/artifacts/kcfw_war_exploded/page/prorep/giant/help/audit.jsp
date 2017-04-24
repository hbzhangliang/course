<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="auditwindow" style="display:none;background:#eefaff;">
    <div style="width: 98%;height: 95%;float: left">
        <div style=" margin:10px 3%;">
            <b>审核意见</b>  <br/>
            <textarea id="auditContent" cols="80" rows="5"></textarea>
        </div>

        <div style=" margin:10px 3%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="doAuditResult('pass')">审核通过</a>
            <a href="javascript:void(0)"  class="easyui-linkbutton" icon="icon-redo" onclick="doAuditResult('returnAndmodify')">退回修改</a>
            <a href="javascript:void(0)"  class="easyui-linkbutton" icon="icon-no" onclick="doAuditResult('nopass')">审核不通过</a>
            <a href="javascript:void(0)"  class="easyui-linkbutton" icon="icon-cancel" onclick="doAuditBack()">取消</a>
        </div>
    </div>
</div>

<script>
    var targetPid="";
    showauditwin=function(pid){
        var $win = $('#auditwindow').window({
            title: '选择审核结果',
            width: 600,
            height: 210,
            top: '45%',
            left: '35%',
            shadow: true,
            modal: true,
            iconCls: 'icon-blank',
            closed: true,
            minimizable: false,
            maximizable: false,
            collapsible: false
        });
        targetPid=pid;
        $win.window('open');
        $('#auditwindow').show();
    }


    function doAuditResult(action){
        var _opintion=$("#auditContent").val();
        $.post("audit.htm",{id:targetPid,action:action,opintion:_opintion},function(d){
            msg(d);
            setTimeout(function(){
                window.location.href="list.htm";
            },1000);
        }) ;
    }

    function doAuditBack(){
        $('#auditwindow').window('close');
    }


</script>
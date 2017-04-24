<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="auditwindow" style="display:none;background:#eefaff;">
    <div style="width: 98%;height: 95%;float: left">
        <div style=" margin:10px 3%;font-size: 18px;border: 1px solid lightblue">
            <div style="margin: 15px 5px;"><span>是否 科技创新券系统用户?</span>
                <input type="radio" name="kjqpd" value="y" />是
                <input type="radio" name="kjqpd" value="n" />否
            </div>
            <div style="margin: 15px 5px;"><span>是否科创项目申报系统用户?</span>
                <input type="radio" name="sbpd" value="y" />是
                <input type="radio" name="sbpd" value="n" />否
            </div>
        </div>

        <div style=" margin:10px 3%;">
            <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="doAuditResult('pass')">确认</a>
            <a href="javascript:void(0)"  class="easyui-linkbutton" icon="icon-cancel" onclick="doAuditBack()">取消</a>
        </div>
    </div>
</div>

<script>
    var targetPid="";
    showauditwin=function(pid){
        var $win = $('#auditwindow').window({
            title: '选择审批结果',
            width: 600,
            height: 210,
            top: '38%',
            left: '28%',
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
         var kjq=$("input:radio[name='kjqpd']:checked").val();
         var sb=$("input:radio[name='sbpd']:checked").val();
         if(kjq==null){
             msg("请选择是否科技券管理系统用户");
             return;
         }
         if(sb==null){
             msg("请选择是否项目管理系统用户");
             return;
         }
        $.post("approve.htm",{id:targetPid,iskjq:kjq,issb:sb},function(d){
            msg(d);
            setTimeout(function(){
                window.location.href="list.htm";
            },1000);
        });

//        var _opintion=$("#auditContent").val();
//        $.post("audit.htm",{id:targetPid,action:action,opintion:_opintion},function(d){
//            msg(d);
//            setTimeout(function(){
//                window.location.href="list.htm";
//            },1000);
//        }) ;
    }

    function doAuditBack(){
        $('#auditwindow').window('close');
    }


</script>
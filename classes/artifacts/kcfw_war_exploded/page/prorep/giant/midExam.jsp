<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
<%@ include file="../../../include/textedit.jsp" %>
</head>
<body class="body_scroll">
<div class="tpspace">

    <form:form action="midExamSave.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>

        <a href="javascript:void(0);" class="table_head">>>中期评估<span onclick="movePanel('panel1')"></span></a>


        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td1" width="15%"><b>中期评估内容</b></td>
                <td class="td2">
                    <form:hidden path="midExam"/>
                    <script id="editor1" type="text/plain" style="width:720px;height:300px;"></script>
                    <%--<form:textarea path="midExam" cssClass="input_txt" cols="100" rows="8"/>--%>
                </td>
            </tr>
            <tr>
                <td class="td1" width="15%"><b>附件(多附件上传,可重命名)</b></td>
                <td class="td2" width="70%">
                    名称：<input type="text" id="displayName" class="input_txt w_209"/>
                    <gw:fileUploadCate objectId="${bean.id}" category="midExam" rename="true"/>
                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="domidExamSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function domidExamSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?jrCaterotyCode=midExam&op=g";
    }

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"midExam",hasmidExm);
    }

    $(function(){
        init_page();


        var ue1 = UE.getEditor('editor1',{
            toolbars: [
                ['fullscreen','insertimage','source', 'undo', 'redo', 'bold', 'italic', 'underline',  'backcolor', 'fontsize', 'fontfamily', 'justifyleft', 'justifyright', 'justifyjustify', 'removeformat', 'formatmatch', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', 'emotion', 'help']
            ]
        });

        ue1.addListener("ready", function () {
            // editor准备好之后才可以使用
            ue1.setContent($('#midExam').val());
        });
        ue1.addListener('selectionchange', function (editor) {
            $('#midExam').val(ue1.getContent());
        });
    })


</script>


</body>
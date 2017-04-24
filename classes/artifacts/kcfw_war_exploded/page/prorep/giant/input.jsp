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
    <!--left end-->
    <!--right start-->
    <div class="right clearfix">
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>
        <!--bread_crumbs end-->

        <!--bt end-->
        <!--table start-->


        <div id="giantreportlist" class="easyui-tabs tabList">
            <div title="企业基本情况">
                <iframe id="ifrm_baseinfo" class="tabList"></iframe>
            </div>
            <div title="近三年财务状况">
                <iframe id="ifrm_capital" class="tabList"></iframe>
            </div>
            <div title="科创活动实施目标">
                <iframe id="ifrm_aim" class="tabList"></iframe>
            </div>
            <div title="创新建设资金申请">
                <iframe id="ifrm_apply"  class="tabList"></iframe>
            </div>
            <div title="附件上传">
                <iframe id="ifrm_attachs" class="tabList"></iframe>
            </div>
            <div title="办理流程">
                <iframe id="ifrm_flowstatus"  class="tabList"></iframe>
            </div>
            <div title="中期评估">
                <iframe id="ifrm_midExam"  class="tabList"></iframe>
            </div>
            <div title="验收资料">
                <iframe id="ifrm_acceptApply"  class="tabList"></iframe>
            </div>
        </div>
        <!--table end-->
        <!--right end-->
    </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
    function getTargetTab(){
        var tabs=$("#giantreportlist").tabs().tabs('tabs');
        for(var i=0; i<tabs.length; i++){
            tabs[i].panel('options').tab.unbind().bind('click',{index:i},function(e){
                var num=e.data.index;
                var code=$("#giantreportlist").find('iframe').eq(num).attr('id').substring(5);
                $("#giantreportlist").find('iframe').eq(num).attr("src","rep/list.htm?cCode="+code);
            });
        }

        var categorycode="${bean.jrCaterotyCode}";
        categorycode=(categorycode==""||categorycode==null)?"baseinfo":categorycode;
        switch (categorycode){
            case "baseinfo": tabs[0].panel('options').tab.click();break;
            case "capital": tabs[1].panel('options').tab.click();break;
            case "aim": tabs[2].panel('options').tab.click();break;
            case "apply": tabs[3].panel('options').tab.click();break;
            case "attachs": tabs[4].panel('options').tab.click();break;
            case "flowstatus": tabs[5].panel('options').tab.click();break;
            case "midExam": tabs[6].panel('options').tab.click();break;
            case "acceptApply": tabs[7].panel('options').tab.click();break;
            default : tabs[0].panel('options').tab.click() ;break;
        }
    }

    $(function(){
        getTargetTab();
        changeTabsStatus();
        //隐藏或显示table，中期评估和验收申请
        visualTabs();
    });

    function  visualTabs(){
        var stat="${bean.status}";
        var strop="${bean.op}";
        var hasmidExm="${bean.batch.isHasMidExm}";
      //  var hasmidExm="true";

        var tab_option1 = $('#giantreportlist').tabs('getTab',"中期评估").panel('options').tab;
        var tab_option2 = $('#giantreportlist').tabs('getTab',"验收资料").panel('options').tab;
        tab_option1.hide();
        tab_option2.hide();
        var strStatus1="pjsetup,pjmidassess,pjmodifyforcheck,pjpassmidcheck,pjaccept,pjmodifyforacp,pjpassaccept";
        var strStatus2="pjpassmidcheck,pjaccept,pjmodifyforacp,pjpassaccept";
        var strStatus3="pjsetup,pjaccept,pjmodifyforacp,pjpassaccept";
        if(hasmidExm=="true") {
            if (stat != "" && strStatus1.indexOf(stat) > -1 && strop != "a") { //存在，显示
                tab_option1.show();
            }
            if (stat != "" && strStatus2.indexOf(stat) > -1 && strop != "a") {
                tab_option2.show();
            }
        }
        else{
            if(stat!=""&&strStatus3.indexOf(stat)>-1&&strop!="a"){
                tab_option2.show();
            }
        }

    }
    //只有新增的时候才禁用tabs
    function changeTabsStatus(){
        var status="${bean.op}";
        if(status=="a"){
            var tabs=$("#giantreportlist").tabs().tabs('tabs');
            for(var i=1; i<tabs.length; i++){
                $('#giantreportlist').tabs('disableTab', i);
            }
        }
    }


</script>
</body>
</html>

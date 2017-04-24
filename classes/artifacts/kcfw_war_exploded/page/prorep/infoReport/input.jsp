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


        <div id="inforeportlist" class="easyui-tabs tabList">
            <div title="企业项目申报表">
                <iframe id="ifrm_report" class="tabList"></iframe>
            </div>
            <div title="知识产权基本情况">
                <iframe id="ifrm_ittelli" class="tabList"></iframe>
            </div>
            <div title="项目情况表">
                <iframe id="ifrm_situdation" class="tabList"></iframe>
            </div>
            <div title="附件上传">
                <iframe id="ifrm_attachs" class="tabList"></iframe>
            </div>
            <div title="承诺书">
                <iframe id="ifrm_commite"  class="tabList"></iframe>
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
        var tabs=$("#inforeportlist").tabs().tabs('tabs');
        for(var i=0; i<tabs.length; i++){
            tabs[i].panel('options').tab.unbind().bind('click',{index:i},function(e){
                var num=e.data.index;
                var code=$("#inforeportlist").find('iframe').eq(num).attr('id').substring(5);
                $("#inforeportlist").find('iframe').eq(num).attr("src","rep/list.htm?cCode="+code);
            });
        }


        var categorycode="${bean.xfCaterotyCode}";
        categorycode=(categorycode==""||categorycode==null)?"report":categorycode;
        switch (categorycode){
            case "report": tabs[0].panel('options').tab.click();break;
            case "ittelli": tabs[1].panel('options').tab.click();break;
            case "situdation": tabs[2].panel('options').tab.click();break;
            case "attachs": tabs[3].panel('options').tab.click();break;
            case "commite": tabs[4].panel('options').tab.click();break;
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
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估

        var tab_option1 = $('#inforeportlist').tabs('getTab',"中期评估").panel('options').tab;
        var tab_option2 = $('#inforeportlist').tabs('getTab',"验收资料").panel('options').tab;
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
            var tabs=$("#inforeportlist").tabs().tabs('tabs');
            for(var i=1; i<tabs.length; i++){
                $('#inforeportlist').tabs('disableTab', i);
            }
        }
    }


</script>
</body>
</html>

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
         <div>
             <div class="cx_floatleft">
                 <ul id="tree" class="easyui-tree">
                 </ul>

             </div>
             <div class="cx_floatright">
                 <iframe id="ifrm_survey" style="width: 100%;height: 100%;min-height: 560px;"></iframe>
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
//    function  init_page(){
//        $("#ifrm_survey").attr("src","rep/list.htm?cCode=baseinfo");  //初始化时的页面
//    }

    $(function(){
        //init_page();

        $('#tree').tree({
            url:base+'/innovate/easyuitree/getAlltrees.htm',
            animate:true,lines:true,
            onClick:function(node){
                //msg(node.attributes);
                var code=node.attributes;
                $("#ifrm_survey").attr("src","rep/list.htm?cCode="+code);
            },
            onLoadSuccess:function(){
                getTargetTD();

                changeTreesStatus();

                //隐藏或显示table，中期评估和验收申请
                visualTabs();

            }
        });



    });


    function getTargetTD(){
        var categorycode="${bean.cxCaterotyCode}";
        categorycode=(categorycode==""||categorycode==null)?"baseinfo":categorycode;

        switch (categorycode){
            case "baseinfo": $('#tree').find("div").eq(0).click();break;
            case "corp1": $('#tree').find("div").eq(2).click();break;
            case "corp2": $('#tree').find("div").eq(3).click();break;
            case "corp3": $('#tree').find("div").eq(4).click();break;
            case "corp4": $('#tree').find("div").eq(5).click();break;
            case "proj1": $('#tree').find("div").eq(7).click();break;
            case "proj2": $('#tree').find("div").eq(8).click();break;
            case "proj3": $('#tree').find("div").eq(9).click();break;
            case "proj4": $('#tree').find("div").eq(10).click();break;
            case "markt1": $('#tree').find("div").eq(12).click();break;
            case "markt2": $('#tree').find("div").eq(13).click();break;
            case "buss": $('#tree').find("div").eq(14).click();break;
            case "finnce1": $('#tree').find("div").eq(16).click();break;
            case "finnce2": $('#tree').find("div").eq(17).click();break;
            case "finnce3": $('#tree').find("div").eq(18).click();break;
            case "finnce4": $('#tree').find("div").eq(19).click();break;
            case "data": $('#tree').find("div").eq(20).click();break;
            case "vclinkage": $('#tree').find("div").eq(21).click();break;
            case "attach": $('#tree').find("div").eq(22).click();break;
            case "midExam": $('#tree').find("div").eq(24).click();break;
            case "acceptApply": $('#tree').find("div").eq(25).click();break;

            default : $('#tree').find("div").eq(0).click();break;
        }
    }
    //新增的时候只有第一项能填写值
    function changeTreesStatus(){
        var status="${bean.op}";
        if(status=="a"){
           $("#tree").find("li").each(function(index,item){
               if(index!=0){
                   $(this).css({"disabled":"disabled","color":"gray","pointer-events": "none" });
               }
           });
        }
    }



function  visualTabs(){
    var stat="${bean.status}";
    var strop="${bean.op}";
    var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估

    var tab_option1 = $('#tree').find("div").eq(24);
    var tab_option2 = $('#tree').find("div").eq(25);
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


</script>
</body>
</html>

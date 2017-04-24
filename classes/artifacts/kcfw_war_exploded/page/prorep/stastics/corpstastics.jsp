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
        <div class="an" id="searchpannel">
            企业名称 <input type="text" id="txt_unitname"/>
            <button type="button" onclick="doSearch()" class="ico_search">
                查询</button>
        </div>

        <!--table start-->
        <table class="table_01" style="margin-top: 12px;">
            <tr>
               <th rowspan="3" width="15%"><b>企业名称</b></th>
                <th colspan="10"><b>项目类别</b></th>
            </tr>
            <tr>
                <th colspan="8"><b>区级项目申报</b></th>
                <th colspan="2" rowspan="2"  width="15%"><b>国家级市级项目申报(个)</b></th>
             </tr>
            <tr>
                <th colspan="2" width="15%"><b>小巨人项目(个)</b></th>
                <th colspan="2" width="15%"><b>创新资金项目(个)</b></th>
                <th colspan="2" width="15%"><b>信息消费项目(个)</b></th>
                <th colspan="2" width="15%"><b>知识产权项目(个)</b></th>
            </tr>
            <c:forEach items="${resule}" var="bean" varStatus="i">
                <tr>
                <td class="enlarge">${bean.corpname}</td>
                <td class="enlarge">总计:${bean.jrcount}</td>
                <td class="enlarge">${bean.jrinfo}</td>
                <td class="enlarge">总计:${bean.cxcount}</td>
                <td class="enlarge">${bean.cxinfo}</td>
                <td class="enlarge">总计:${bean.xfcount}</td>
                <td class="enlarge">${bean.xfinfo}</td>
                <td class="enlarge">总计:${bean.zscount}</td>
                <td class="enlarge">${bean.zsinfo}</td>
                <td class="enlarge">总计:${bean.citycount}</td>
                <td class="enlarge">${bean.cityinfo}</td>
                </tr>
            </c:forEach>
        </table>
        <!--table end-->
        <!--right end-->
    </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<!--footer end-->
<script>
    $(function(){
        init_page();
    });

    function init_page(){
        $("#txt_unitname").val("${unitname}");

        var type="${currentUser.type}";
        if("corp"==type){
            $("#searchpannel").hide();
        }
    }

    function doSearch(){
        var name=$("#txt_unitname").val();
        window.location.href=base+'/proStastics/corpstastics/list.htm?unitname='+name;
    }
</script>

</body>
</html>

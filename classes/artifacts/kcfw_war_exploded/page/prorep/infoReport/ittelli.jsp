<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body class="body_scroll">
<div class="tpspace">

    <form:form action="IttelliSave.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>知识产权基本情况<span onclick="movePanel('panel1')"></span></a>
        <a style="margin-left: 2%;">项目技术来源单位应用于本项目的知识产权情况：             （单位：项）</a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr id="titleyear">
                <td class="td3" width="15%"></td>
                <td class="td3" width="12%"></td>
                <td class="td3" width="12%"><b>${bean.xfPatents[0].chyear}</b></td>
                <td class="td3" width="12%"><b>${bean.xfPatents[1].chyear}</b></td>
                <td class="td3" width="12%"><b>${bean.xfPatents[2].chyear}</b></td>
                <td class="td3" width="12%"><b>${bean.xfPatents[3].chyear}</b></td>
            </tr>
            <tr id="inputyear" class="hidePannel">
                <td colspan="3">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[0].chyear" class="input_txt w_109" value='${bean.xfPatents[0].chyear}'>
                </td>
                <td>
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[1].chyear" class="input_txt w_109" value='${bean.xfPatents[1].chyear}'>
                </td>
                <td>
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[2].chyear" class="input_txt w_109" value='${bean.xfPatents[2].chyear}'>
                </td>
                <td>
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[3].chyear" class="input_txt w_109" value='${bean.xfPatents[3].chyear}'>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="3">
                    <b>专利申请</b>
                </td>
                <td class="td1">
                    <b>外观专利</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[0].design" class="input_txt w_109" value='${bean.xfPatents[0].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[1].design" class="input_txt w_109" value='${bean.xfPatents[1].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[2].design" class="input_txt w_109" value='${bean.xfPatents[2].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[3].design" class="input_txt w_109" value='${bean.xfPatents[3].design}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>实用新型</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[0].utility" class="input_txt w_109" value='${bean.xfPatents[0].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[1].utility" class="input_txt w_109" value='${bean.xfPatents[1].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[2].utility" class="input_txt w_109" value='${bean.xfPatents[2].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[3].utility" class="input_txt w_109" value='${bean.xfPatents[3].utility}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>发明专利</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[0].invention" class="input_txt w_109" value='${bean.xfPatents[0].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[1].invention" class="input_txt w_109" value='${bean.xfPatents[1].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[2].invention" class="input_txt w_109" value='${bean.xfPatents[2].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[3].invention" class="input_txt w_109" value='${bean.xfPatents[3].invention}'>
                </td>
            </tr>

            <tr>
                <td class="td1" rowspan="3">
                    <b>专利授权</b>
                </td>
                <td class="td1">
                    <b>外观专利</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[4].design" class="input_txt w_109" value='${bean.xfPatents[4].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[5].design" class="input_txt w_109" value='${bean.xfPatents[5].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[6].design" class="input_txt w_109" value='${bean.xfPatents[6].design}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[7].design" class="input_txt w_109" value='${bean.xfPatents[7].design}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>实用新型</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[4].utility" class="input_txt w_109" value='${bean.xfPatents[4].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[5].utility" class="input_txt w_109" value='${bean.xfPatents[5].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[6].utility" class="input_txt w_109" value='${bean.xfPatents[6].utility}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[7].utility" class="input_txt w_109" value='${bean.xfPatents[7].utility}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>发明专利</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[4].invention" class="input_txt w_109" value='${bean.xfPatents[4].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[5].invention" class="input_txt w_109" value='${bean.xfPatents[5].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[6].invention" class="input_txt w_109" value='${bean.xfPatents[6].invention}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfPatents[7].invention" class="input_txt w_109" value='${bean.xfPatents[7].invention}'>
                </td>
            </tr>


            <tr>
                <td class="td1" rowspan="3">
                    <b>软件著作版权</b>
                </td>
                <td class="td1">
                    <b>版权申请</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[0].chcount" class="input_txt w_109" value='${bean.xfSoftwares[0].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[1].chcount" class="input_txt w_109" value='${bean.xfSoftwares[1].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[2].chcount" class="input_txt w_109" value='${bean.xfSoftwares[2].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[3].chcount" class="input_txt w_109" value='${bean.xfSoftwares[3].chcount}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>版权授权</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[0].sqcount" class="input_txt w_109" value='${bean.xfSoftwares[0].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[1].sqcount" class="input_txt w_109" value='${bean.xfSoftwares[1].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[2].sqcount" class="input_txt w_109" value='${bean.xfSoftwares[2].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[3].sqcount" class="input_txt w_109" value='${bean.xfSoftwares[3].sqcount}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>软件产品</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[0].software" class="input_txt w_109" value='${bean.xfSoftwares[0].software}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[1].software" class="input_txt w_109" value='${bean.xfSoftwares[1].software}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[2].software" class="input_txt w_109" value='${bean.xfSoftwares[2].software}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfSoftwares[3].software" class="input_txt w_109" value='${bean.xfSoftwares[3].software}'>
                </td>
            </tr>


            <tr>
                <td class="td1" rowspan="2">
                    <b>集成电路布图设计</b>
                </td>
                <td class="td1">
                    <b>申请登记</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[0].chcount" class="input_txt w_109" value='${bean.xfCircuits[0].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[1].chcount" class="input_txt w_109" value='${bean.xfCircuits[1].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[2].chcount" class="input_txt w_109" value='${bean.xfCircuits[2].chcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[3].chcount" class="input_txt w_109" value='${bean.xfCircuits[3].chcount}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>授权</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[0].sqcount" class="input_txt w_109" value='${bean.xfCircuits[0].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[1].sqcount" class="input_txt w_109" value='${bean.xfCircuits[1].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[2].sqcount" class="input_txt w_109" value='${bean.xfCircuits[2].sqcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfCircuits[3].sqcount" class="input_txt w_109" value='${bean.xfCircuits[3].sqcount}'>
                </td>
            </tr>



            <tr>
                <td class="td1" rowspan="4">
                    <b>商标</b>
                </td>
                <td class="td1">
                    <b>注册</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[0].reg" class="input_txt w_109" value='${bean.xfBrands[0].reg}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[1].reg" class="input_txt w_109" value='${bean.xfBrands[1].reg}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[2].reg" class="input_txt w_109" value='${bean.xfBrands[2].reg}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[3].reg" class="input_txt w_109" value='${bean.xfBrands[3].reg}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>授权使用</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[0].licese" class="input_txt w_109" value='${bean.xfBrands[0].licese}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[1].licese" class="input_txt w_109" value='${bean.xfBrands[1].licese}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[2].licese" class="input_txt w_109" value='${bean.xfBrands[2].licese}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[3].licese" class="input_txt w_109" value='${bean.xfBrands[3].licese}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>上海市著名商标</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[0].shfamous" class="input_txt w_109" value='${bean.xfBrands[0].shfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[1].shfamous" class="input_txt w_109" value='${bean.xfBrands[1].shfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[2].shfamous" class="input_txt w_109" value='${bean.xfBrands[2].shfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[3].shfamous" class="input_txt w_109" value='${bean.xfBrands[3].shfamous}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>中国驰名商标</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[0].chfamous" class="input_txt w_109" value='${bean.xfBrands[0].chfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[1].chfamous" class="input_txt w_109" value='${bean.xfBrands[1].chfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[2].chfamous" class="input_txt w_109" value='${bean.xfBrands[2].chfamous}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="xfBrands[3].chfamous" class="input_txt w_109" value='${bean.xfBrands[3].chfamous}'>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <b>企业专有技术</b>
                </td>
                <td class="td1">
                    <b>----</b>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="selfTeches[0].techcount" class="input_txt w_109" value='${bean.selfTeches[0].techcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="selfTeches[1].techcount" class="input_txt w_109" value='${bean.selfTeches[1].techcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="selfTeches[2].techcount" class="input_txt w_109" value='${bean.selfTeches[2].techcount}'>
                </td>
                <td class="td2">
                    <input onkeyup="javascript:RegInt(this)" type="text" name="selfTeches[3].techcount" class="input_txt w_109" value='${bean.selfTeches[3].techcount}'>
                </td>

            </tr>
        </table>
            <div style="margin-left: 18px;">
                备注：<br/>
            1、知识产权应有受理、授权证书复印件，并按受理通知日期、授权获得日期进行统计； <br/>
            2、若知识产权已获得授权请直接填写于对应授权栏，勿重复填写至申请栏；    <br/>
            3、企业专有技术：指企业自己建立的专业技术管理，应保留相关文件，全国性行业检测机构的测试证明等或其他佐证材料。  <br/>
            </div>
    <div class="an">
        <button type="button" onclick="doIttelliSave();" class="ico_tmpSave">
            <fmt:message key="sys.title.save"/></button>
        <button type="button" onclick="history.back();" class="ico_return">
            <fmt:message key="sys.title.return"/></button>
    </div>
</form:form>
</div>

<script>
    var params={
        year:null
    }
    function init_page(){

        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"ittelli",hasmidExm);


        var dt=new Date();
        params.year= dt.getFullYear();

        if($("input[name='xfPatents[0].chyear']").val().length==0) {
            $("#titleyear").find("td:gt(1)").each(function (index, item) {
                var stryear = (parseInt(params.year) - index).toString() + "年";
                $(item).html("<b>" + stryear + "</b>");
                $("#inputyear").find("input").eq(index).val(stryear);
                if (index == 3) {
                    $(item).html("<b>以前年度</b>");
                    $("#inputyear").find("input").eq(index).val("以前年度");
                }
            });
        }
        /*
        if($("input[name='xfPatents[0].chyear']").val().length==0) {
            $(".table_02").each(function (index, item) {
                for (var i = 0; i < 3; i++) {
                    var j = i + 1;
                    var stryear = (parseInt(params.year) - 2 + i).toString() + "年";
                    $(item).find('tr:eq(' + j + ')').find('b').html(stryear);
                    $(item).find('tr:eq(' + j + ')').find("td:eq(1)").find("input").val(stryear);
                }
            });
        }
        */
    }

    function doIttelliSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InfoReport/input.htm?xfCaterotyCode=ittelli&op=g";
    }


    $(function(){
        init_page();
    });


</script>

</body>


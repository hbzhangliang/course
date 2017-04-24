<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body class="body_scroll">
<div class="tpspace">

    <form:form action="AimSave.htm" method="post" modelAttribute="target" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>企业科技创新活动实施目标<span onclick="movePanel('panel1')"></span></a>
        <table id="targettable" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <form:hidden path="corpration.id"></form:hidden>
            <tr>
                <td class="td1" width="15%">实施周期</td>
                <td class="td2" width="75%" colspan="4"></td>
             </tr>
            <tr>
                <td class="td3" colspan="5">实施期内企业创新能力提升目标：围绕企业提高核心竞争力和可持续发展的思路，主要包括：1、企业产品（或服务）的创新成果；2、形成的实验室、研发机构，中试线等工程化平台，生产线及其规模等；3、企业创新团队及激励机制建设;4、企业经营能力和成长性；5、社会效益指标；6、企业创新国际化建设及在产业细分领域的市场地位</td>
            </tr>
            <tr>
                <td class="td2" colspan="5">
                    <form:textarea path="aim" cssClass="input_txt" cols="120" rows="4"/>
                </td>
            </tr>
            <tr>
                <td class="td1" colspan="5">
                    <label style="float: left">具体实施目标（2年）：</label>
                    <label style="float: right">万元：</label>
                </td>
            </tr>
            <tr id="aimYeartd">
                <td rowspan="9" class="td3">企业主要经营目标</td>
                <td class="td3" width="35%" colspan="2">目标内容</td>
                <td class="td3" width="20%">
                    <label>${target.yearAims[0].chyear}</label>
                </td>
                <td class="td3" width="20%">
                    <label>${target.yearAims[1].chyear}</label>
                </td>
            </tr>
            <tr>
                <td class="td1" colspan="2">主营业务收入</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].income" value="${target.yearAims[0].income}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].income" value="${target.yearAims[1].income}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">其中产品（或服务）销售收入</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].saleincome" value="${target.yearAims[0].saleincome}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].saleincome" value="${target.yearAims[1].saleincome}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">净利润</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].netincome" value="${target.yearAims[0].netincome}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].netincome" value="${target.yearAims[1].netincome}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">缴税总额</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].taxes" value="${target.yearAims[0].taxes}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].taxes" value="${target.yearAims[1].taxes}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">出口总额（万美元）</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].outboard" value="${target.yearAims[0].outboard}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].outboard" value="${target.yearAims[1].outboard}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">研究开发费用</td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[0].fee" value="${target.yearAims[0].fee}"/></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" class="input_txt w_150" name="yearAims[1].fee" value="${target.yearAims[1].fee}"/></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">2年销售收入平均增长率（自动计算）</td>
                <td class="td2" colspan="2"><input id="avesales" type="text" readonly="readonly" class="input_txt w_209 rdonly" /></td>
            </tr>
            <tr>
                <td class="td1" colspan="2">2年净利润平均增长率（自动计算）</td>
                <td class="td2" colspan="2"><input id="avenetprofit" type="text"  readonly="readonly" class="input_txt w_209 rdonly" /></td>
            </tr>

            <tr>
                <td class="td3" rowspan="5">自主知识产权实施目标（填写实施期内新增数）</td>
                <td class="td1"  width="15%">专利申请数件</td>
                <td class="td2"  width="15%"><form:input path="applynum" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
                <td class="td1" width="15%">软件版权数</td>
                <td class="td2" width="15%"><form:input path="softnum" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
            </tr>
            <tr>
                <td class="td1"  width="15%">专利授权数</td>
                <td class="td2"  width="15%"><form:input path="patentednum" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
                <td class="td1" width="15%">集成电路布图设计数</td>
                <td class="td2" width="15%"><form:input path="graph" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
            </tr>
            <tr>
                <td class="td1"  width="15%">其中：发明专利数</td>
                <td class="td2"  width="15%"><form:input path="inventnum" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
                <td class="td1" width="15%">国家标准数</td>
                <td class="td2" width="15%"><form:input path="standcount" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
            </tr>
            <tr>
                <td class="td1"  width="15%">有效注册商标量</td>
                <td class="td2"  width="15%"><form:input path="marks" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
                <td class="td1" width="15%">行业标准数</td>
                <td class="td2" width="15%"><form:input path="profstand" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
            </tr>
            <tr>
                <td class="td1"  width="15%">著名商标或驰名商标量</td>
                <td class="td2"  width="15%"><form:input path="famousmarks" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
                <td class="td1" width="15%">企业标准数</td>
                <td class="td2" width="15%"><form:input path="corpstand" cssClass="text-input w_109" onkeyup="javascript:RegInt(this)"/>件</td>
            </tr>

         </table>
        <input id="aim0year" class="hidePannel" name="yearAims[0].chyear" value="${target.yearAims[0].chyear}"/>
        <input id="aim1year" class="hidePannel" name="yearAims[1].chyear" value="${target.yearAims[1].chyear}"/>
        <div class="an">
            <button type="button" onclick="doAimSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>


</div>
<script>

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);


        if($("#aim0year").val().length==0) {
            //时间赋值
            var dt = new Date()
            var year = parseInt(dt.getFullYear());
            var info = year.toString() + "年1月---" + (year + 1).toString() + "年12月";
            $("#targettable").find("tr:eq(0)").find("td:eq(1)").html("<b>" + info + "</b>");

            $("#aimYeartd").find("td:eq(2)").html(year + "年");
            $("#aimYeartd").find("td:eq(3)").html((year + 1).toString() + "年");

            $("#aim0year").val(year + "年");
            $("#aim1year").val((year + 1).toString() + "年");
        }
        else{
            var info= $("#aim0year").val()+ "1月---" + $("#aim1year").val() + "12月";
            $("#targettable").find("tr:eq(0)").find("td:eq(1)").html("<b>" + info + "</b>");

            if($("input[name='yearAims[0].saleincome']").val().length>0&&$("input[name='yearAims[1].saleincome']").val().length>0)  {
                var x1="${target.yearAims[0].saleincome}",x2="${target.yearAims[1].saleincome}";
                x1=parseFloat(x1), x2=parseFloat(x2);
                var x=100*(x2-x1)/x1;
                $("#avesales").val(x.toFixed(2)+"%");
            }
            if($("input[name='yearAims[0].netincome']").val().length>0&&$("input[name='yearAims[1].netincome']").val().length>0)  {
                var x1="${target.yearAims[0].netincome}",x2="${target.yearAims[1].netincome}";
                x1=parseFloat(x1), x2=parseFloat(x2);
                var x=100*(x2-x1)/x1;
                $("#avenetprofit").val(x.toFixed(2)+"%");
            }
        }
    }


    function doAimSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?jrCaterotyCode=aim&op=g";
    }


    $(function(){
        init_page();

    });

</script>


</body>
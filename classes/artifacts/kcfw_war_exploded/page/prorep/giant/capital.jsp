<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body class="body_scroll">
<div class="tpspace">

<form:form action="CapitalSave.htm" method="post" modelAttribute="bean" id="form">
    <c:import url="../../../include/pageParams.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>企业近三年财务状况<span onclick="movePanel('panel1')"></span></a>
    <a style="margin-left: 2%;color: red">*注：单位是万元,保留两位小数</a>
    <table id="capitalTable" class="table_02">
        <tr>
            <th width="20%"></th>
            <th width="18%"><label>${bean.financeList[0].chyear}</label></th>
            <th width="18%"><label>${bean.financeList[1].chyear}</label></th>
            <th width="18%"><label>${bean.financeList[2].chyear}</label></th>
            <input type="text" id="financeyear0" name="financeList[0].chyear" value="${bean.financeList[0].chyear}" class="hidePannel"/>
            <input type="text" id="financeyear1"  name="financeList[1].chyear"  value="${bean.financeList[1].chyear}" class="hidePannel"/>
            <input type="text" id="financeyear2" name="financeList[2].chyear"  value="${bean.financeList[2].chyear}" class="hidePannel"/>
        </tr>
        <tr>
            <td><b>主营业务收入</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].income" value='${bean.financeList[0].income}'  class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].income" value='${bean.financeList[1].income}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].income" value='${bean.financeList[2].income}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>其中：产品销售收入</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].saleincome"  value='${bean.financeList[0].saleincome}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].saleincome"  value='${bean.financeList[1].saleincome}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].saleincome"  value='${bean.financeList[2].saleincome}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>其它技术性收入</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].techincome" value='${bean.financeList[0].techincome}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].techincome" value='${bean.financeList[1].techincome}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].techincome" value='${bean.financeList[2].techincome}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>净利润</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].profits" value='${bean.financeList[0].profits}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].profits" value='${bean.financeList[1].profits}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].profits" value='${bean.financeList[2].profits}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>缴税总额</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].taxes" value='${bean.financeList[0].taxes}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].taxes" value='${bean.financeList[1].taxes}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].taxes" value='${bean.financeList[2].taxes}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>出口总额（万美元）</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].outboard" value='${bean.financeList[0].outboard}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].outboard" value='${bean.financeList[1].outboard}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].outboard" value='${bean.financeList[2].outboard}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>3年销售收入平均增长率</b></td>
            <td colspan="3"><label id="avesales">0%</label></td>
        </tr>
        <tr>
            <td><b>3年净利润平均增长率</b></td>
            <td colspan="3"><label id="avenetprofit">0%</label></td>
        </tr>
        <tr>
            <td><b>总资产</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].capital" value='${bean.financeList[0].capital}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].capital" value='${bean.financeList[1].capital}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].capital" value='${bean.financeList[2].capital}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>总负债</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].debt" value='${bean.financeList[0].debt}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].debt" value='${bean.financeList[1].debt}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].debt" value='${bean.financeList[2].debt}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>固定资产净值</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].netcapital" value='${bean.financeList[0].netcapital}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].netcapital" value='${bean.financeList[1].netcapital}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].netcapital" value='${bean.financeList[2].netcapital}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>流动资产</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].quickasset" value='${bean.financeList[0].quickasset}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].quickasset" value='${bean.financeList[1].quickasset}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].quickasset" value='${bean.financeList[2].quickasset}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>流动负债</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].quickdebt" value='${bean.financeList[0].quickdebt}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].quickdebt" value='${bean.financeList[1].quickdebt}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].quickdebt" value='${bean.financeList[2].quickdebt}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>所有者权益</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].ownerright" value='${bean.financeList[0].ownerright}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].ownerright" value='${bean.financeList[1].ownerright}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].ownerright" value='${bean.financeList[2].ownerright}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>资产负债率</b></td>
            <td><input  type="text" name="financeList[0].rate" value='${bean.financeList[0].rate}' class="input_txt w_150"/></td>
            <td><input  type="text" name="financeList[1].rate" value='${bean.financeList[1].rate}' class="input_txt w_150"/></td>
            <td><input  type="text" name="financeList[2].rate" value='${bean.financeList[2].rate}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>研究开发费用</b></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[0].fee" value='${bean.financeList[0].fee}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[1].fee" value='${bean.financeList[1].fee}' class="input_txt w_150"/></td>
            <td><input onkeyup="javascript:RepNumber(this)" type="text" name="financeList[2].fee" value='${bean.financeList[2].fee}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>研究开发费用总额占主营业务收入总额比</b></td>
            <td><input  type="text" name="financeList[0].researchrate" value='${bean.financeList[0].researchrate}' class="input_txt w_150"/></td>
            <td><input type="text" name="financeList[1].researchrate" value='${bean.financeList[1].researchrate}' class="input_txt w_150"/></td>
            <td><input  type="text" name="financeList[2].researchrate" value='${bean.financeList[2].researchrate}' class="input_txt w_150"/></td>
        </tr>
        <tr>
            <td><b>特殊情况说明</b></td>
            <td colspan="3">
                <textarea rows="4" cols="100" name="financeList[0].description">${bean.financeList[0].description}</textarea>
            </td>
        </tr>

     </table>
    <div class="an">
        <button type="button" onclick="doCapitalSave();" class="ico_tmpSave">
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

        if($("#financeyear0").val().length==0){
            var dt=new Date()
            var year=parseInt(dt.getFullYear());
            $("#capitalTable tr:eq(0)").find("th").each(function(index,item){
                if(index!=0){
                    var str=year-4+index;
                    $(item).html("<b>"+str+"年</b>");
                    $("#financeyear"+(index-1)).val(str+"年");
                }
            });
        }

        //销售收入平均增长率计算
        if($("#financeyear0").val().length>0){
            //销售收入平均增长率计算
            var x1="${bean.financeList[0].saleincome}",x2="${bean.financeList[1].saleincome}",x3="${bean.financeList[2].saleincome}";
            if(x1.length>0&&x2.length>0&&x3.length>0){
                x1=parseFloat(x1), x2=parseFloat(x2),x3=parseFloat(x3);
                var x=100*((x2-x1)/x1+(x3-x2)/x2)/2;
                $("#avesales").html(x.toFixed(2)+"%");
            }

            //净利润平均增长率
            var x1="${bean.financeList[0].profits}",x2="${bean.financeList[1].profits}",x3="${bean.financeList[2].profits}";
            if(x1.length>0&&x2.length>0&&x3.length>0){
                x1=parseFloat(x1), x2=parseFloat(x2),x3=parseFloat(x3);
                var x=100*((x2-x1)/x1+(x3-x2)/x2)/2;
                $("#avenetprofit").html(x.toFixed(2)+"%");
            }

            //资产负债率计算


        }

    }


    function doCapitalSave(){
        $.ajaxSetup({
            async: false
        });
        doSubmit();
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?jrCaterotyCode=capital&op=g";
    }


    $(function(){
       init_page();

    });

</script>


</body>
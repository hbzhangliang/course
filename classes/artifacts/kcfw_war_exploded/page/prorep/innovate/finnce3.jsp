<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Finnce3Save.htm" method="post" modelAttribute="finance" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目产品生产的规模及经济效益<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td3">
                <table id="Benifittable"  class="table_04">
                    <tr style="background: #daebfd; border:1px solid skyblue; ">
                        <td colspan="6">
                            <div style="float: left;">
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowBenifit()">添加</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowBenifit()">删除</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th width="0%" class="hidePannel">ddd</th>
                        <th width="25%"></th>
                        <th width="15%">项目产品生产规模</th>
                        <th width="15%">销售收入</th>
                        <th width="15%">总成本费用</th>
                        <th width="15%">净利润</th>
                        <th width="10%">职工年平均人数</th>
                    </tr>
                    <c:forEach items="${finance.yearbenefitList}" var="item" varStatus="i">
                        <tr>
                            <td class="hidePannel"><input type="text"  name="yearbenefitList[${i.index}].name" value="${item.name}"/></td>
                            <td>${item.name}</td>
                            <td><input onkeyup="javascript:RepNumber(this)" type="text" class='w_109' name="yearbenefitList[${i.index}].scale" value="${item.scale}"/></td>
                            <td><input onkeyup="javascript:RepNumber(this)" type="text" class='w_109' name="yearbenefitList[${i.index}].income" value="${item.income}"/></td>
                            <td><input onkeyup="javascript:RepNumber(this)" type="text" class='w_109' name="yearbenefitList[${i.index}].cost" value="${item.cost}"/></td>
                            <td><input onkeyup="javascript:RepNumber(this)" type="text" class='w_109' name="yearbenefitList[${i.index}].netprofit" value="${item.netprofit}"/></td>
                            <td><input onkeyup="javascript:RegInt(this)" type="text" class='w_109' name="yearbenefitList[${i.index}].staffcount" value="${item.staffcount}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td3"><b>相关分析</b></td>
        </tr>
        <tr>
            <td class="td4">
                <form:textarea path="benefit" cssClass="input_txt" cols="100" rows="8"/>

            </td>
        </tr>
     </table>
        <a href="javascript:void(0);" class="table_head" style="margin-top: 12px;">>>项目产品生产的规模及经济效益<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3" colspan="4"><b>项目执行期内项目产品实现的经济效益预测</b></td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>累计销售收入(万元)</b></td>
                <td class="td2">
                    <form:input path="qnsaleincome" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1" width="16%"><b>累计净利润(万元)</b></td>
                <td class="td2">
                    <form:input path="qnnetprofit" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>累计缴税总额(万元)</b></td>
                <td class="td2">
                    <form:input path="qntaxes" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>累计创汇(万美元)</b></td>
                <td class="td2">
                    <form:input path="qnexchanges" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>新增就业人数</b></td>
                <td class="td2" colspan="3">
                    <form:input path="qnemploy" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td3" colspan="4"><b>预测分析</b></td>
            </tr>
            <tr>
                <td class="td4" colspan="4">
                    <form:textarea path="predictive" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
        </table>

        <a href="javascript:void(0);" class="table_head" style="margin-top: 12px;">>>项目产品生产成本<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3"><b>项目产品生产成本的主要构成因素分析</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="costanalysis" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
            <tr>
                <td class="td3"><b>预测产品的单位成本</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="unitcost" cssClass="input_txt" cols="100" rows="6"/>
                </td>
            </tr>
        </table>
        <a href="javascript:void(0);" class="table_head" style="margin-top: 12px;">>>项目产品定价<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3"><b>分析说明项目产品的价格</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="price" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
            <tr>
                <td class="td3"><b>定价策略</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:textarea path="strategy" cssClass="input_txt" cols="100" rows="8"/>

                </td>
            </tr>
        </table>

        <div class="an">
            <button type="button" onclick="doFinnce3Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>

    function addRowBenifit(){
        var holderrow = $("#Benifittable").find("tr:gt(1)").length;
        var title="项目申报后第"+(holderrow+1).toString()+"年";
        var strinfo="";
        strinfo+="<tr>";
        strinfo+="<td class='hidePannel'><input type='text' name='yearbenefitList["+holderrow+"].name' value='"+title+"'/></td>";
        strinfo+="<td>"+title+"</td>";
        strinfo+="<td><input onkeyup='javascript:RepNumber(this)' type='text' class='w_109'  name='yearbenefitList["+holderrow+"].scale'/></td>";
        strinfo+="<td><input onkeyup='javascript:RepNumber(this)' type='text' class='w_109' name='yearbenefitList["+holderrow+"].income'/></td>";
        strinfo+="<td><input onkeyup='javascript:RepNumber(this)' type='text' class='w_109' name='yearbenefitList["+holderrow+"].cost'/></td>";
        strinfo+="<td><input onkeyup='javascript:RepNumber(this)' type='text' class='w_109' name='yearbenefitList["+holderrow+"].netprofit'/></td>";
        strinfo+="<td><input onkeyup='javascript:RegInt(this)' type='text' class='w_109' name='yearbenefitList["+holderrow+"].staffcount'/></td>";
        strinfo+="</tr>";

        holderrow++;
        $("#Benifittable").append(strinfo);
    }

    function delRowBenifit(){
        var flag=false;
        $("#Benifittable").find("tr:gt(1)").each(function(index,item){
            if($(item).hasClass("backChoose")) {
                $(item).remove();
                flag=true;
            }
        });
        if(!flag){
            msg("请选择要删除的行");
        }
    }


    function doFinnce3Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=finnce3&op=g";
    }

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    }

         $(function(){

             init_page();

             $("#Benifittable").on("click","tr:gt(1)",function(){
                 $(this).addClass("backChoose") ;
                 $(this).siblings().removeClass("backChoose");
             });

         });

</script>
</body>
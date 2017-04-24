<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
    <div class="tpspace">
    <form:form action="SituationSave.htm" method="post" modelAttribute="situation" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <a href="javascript:void(0);" class="table_head">一：项目主要概况<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr><td class="td2" colspan="2"><b>项目背景</b></td></tr>
            <tr>
                <td class="td1" width="16%"><b>市场背景情况</b></td>
                <td class="td2">
                    <form:textarea path="marketground" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>企业立项背景情况</b></td>
                <td class="td2">
                    <form:textarea path="probkground" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>项目负债及组成人员</b></td>
                <td class="td2">
                    <form:textarea path="teamer" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr><td class="td2" colspan="2"><b>项目方案</b></td></tr>
            <tr>
                <td class="td1" width="16%"><b>总体思路</b></td>
                <td class="td2">
                    <form:textarea path="idea" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>技术方案</b></td>
                <td class="td2">
                    <form:textarea path="techsolution" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>实施方案</b></td>
                <td class="td2">
                    <form:textarea path="impsolution" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>进度计划</b></td>
                <td class="td2">
                    <form:textarea path="plan" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr><td class="td2" colspan="2"><b>创新特点(技术,产品，模式，业态优势)</b></td></tr>
            <tr>
                <td class="td1" width="16%"><b>关键技术</b></td>
                <td class="td2">
                    <form:textarea path="coretech" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>攻克难点及解决方案</b></td>
                <td class="td2">
                    <form:textarea path="difficult" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>创新点</b></td>
                <td class="td2">
                    <form:textarea path="innovate" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>竞争优势分析</b></td>
                <td class="td2">
                    <form:textarea path="competive" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>经济效益</b></td>
                <td class="td2">
                    <form:textarea path="jjbenefit" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>社会效益</b></td>
                <td class="td2">
                    <form:textarea path="shbenefit" cssClass="input_txt" cols="90" rows="2"/>
                </td>
            </tr>
        </table>

        <a href="javascript:void(0);"  style="margin-top: 10px;" class="table_head">二：项目投资经费预算<span onclick="movePanel('panel1')"></span></a>
        <a style="margin-left: 2%;color: red">*注：单位是万元,精确到两位小数</a>
        <table style="margin-top: 10px;" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td1" width="23%" colspan="2"><b>计划投资总额</b></td>
                <td class="td2" colspan="2">
                    <form:input onkeyup="javascript:RepNumber(this)" path="planinvest" cssClass="input_txt w_109"></form:input>万元
                </td>
                <td class="td1" width="23%" colspan="2"><b>已完成投资</b></td>
                <td class="td2" colspan="2"><form:input onkeyup="javascript:RepNumber(this)" path="wcinvest" cssClass="input_txt w_109"></form:input>万元</td>
            </tr>
            <tr>
                <td  class="td1" width="23%" colspan="2"><b>计划新增投资额</b></td>
                <td  class="td2" colspan="2"><form:input onkeyup="javascript:RepNumber(this)" path="xzinvest" cssClass="input_txt w_109"></form:input>万元</td>
                <td  class="td1" width="23%" colspan="2"><b>拟申请专项支持资金</b></td>
                <td  class="td2" colspan="2"><form:input onkeyup="javascript:RepNumber(this)" path="zxinvest" cssClass="input_txt w_109"></form:input>万元</td>
             </tr>
            </table>

        <table id="capital_table" style="margin-top: 10px;" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr><td colspan="4" class="td3"><b>资金来源计划（可根据实际执行期列支）(单位：万元)</b></td></tr>
            <tr id="capital_year">
                <td class="td3" rowspan="2"></td>
                <td class="td3"><b>${situation.xfFundsources[0].chyear}</b></td>
                <td class="td3"><b>${situation.xfFundsources[1].chyear}</b></td>
                <td class="td3"><b>合计</b></td>
            </tr>
            <tr>
                <td class="td3"></td>
                <td class="td3"></td>
                <td class="td3"></td>
            </tr>
            <tr id="capital_txtyear" class="hidePannel">
                <td colspan="4">
                    <input name="xfFundsources[0].chyear" type="text" class="input_txt w_109" value='${situation.xfFundsources[0].chyear}'/>
                    <input name="xfFundsources[1].chyear" type="text" class="input_txt w_109" value='${situation.xfFundsources[1].chyear}'/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="15%"><b>企业自筹资金</b></td>
                <td class="td4" width="22%"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[0].zccapital" type="text" class="input_txt w_150" value='${situation.xfFundsources[0].zccapital}'/></td>
                <td class="td4" width="22%"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[1].zccapital" type="text" class="input_txt w_150" value='${situation.xfFundsources[1].zccapital}'/></td>
                <td class="td4" width="22%"></td>
            </tr>
            <tr>
                <td class="td1"><b>银行贷款</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[0].bankloan" type="text" class="input_txt w_150" value='${situation.xfFundsources[0].bankloan}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[1].bankloan" type="text" class="input_txt w_150" value='${situation.xfFundsources[1].bankloan}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>其他渠道资金</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[0].otherchannel" type="text" class="input_txt w_150" value='${situation.xfFundsources[0].otherchannel}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[1].otherchannel" type="text" class="input_txt w_150" value='${situation.xfFundsources[1].otherchannel}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>专项支持资金</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[0].specialsupport" type="text" class="input_txt w_150" value='${situation.xfFundsources[0].specialsupport}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfFundsources[1].specialsupport" type="text" class="input_txt w_150" value='${situation.xfFundsources[1].specialsupport}'/></td>
                <td class="td4"></td>
            </tr>
         </table>



        <table id="inverst_table" style="margin-top: 10px;" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr><td colspan="4" class="td3"><b>资金投入计划预算（可根据实际执行期列支）(单位：万元)</b></td></tr>
            <tr id="inverst_year">
                <td class="td3"><b>科目</b></td>
                <td class="td3"><b>${situation.xfBudgets[0].chyear}</b></td>
                <td class="td3"><b>${situation.xfBudgets[1].chyear}</b></td>
                <td class="td3"><b>合计</b></td>
            </tr>
            <tr id="inverst_txtyear" class="hidePannel">
                <td colspan="4">
                    <input name="xfBudgets[0].chyear" type="text" class="input_txt w_109" value='${situation.xfBudgets[0].chyear}'/>
                    <input name="xfBudgets[1].chyear" type="text" class="input_txt w_109" value='${situation.xfBudgets[1].chyear}'/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="15%"><b>固定资产购置</b></td>
                <td class="td4" width="22%"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].gdcapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].gdcapital}'/></td>
                <td class="td4" width="22%"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].gdcapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].gdcapital}'/></td>
                <td class="td4" width="22%"></td>
            </tr>
            <tr>
                <td class="td1"><b>管理研发费用</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].glcapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].glcapital}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].glcapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].glcapital}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>商业渠道拓展</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].sycapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].sycapital}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].sycapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].sycapital}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>测试化验加工费</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].cscapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].cscapital}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].cscapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].cscapital}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>知识产权事务费</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].zscapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].zscapital}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].zscapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].zscapital}'/></td>
                <td class="td4"></td>
            </tr>
            <tr>
                <td class="td1"><b>其他费用（如国际交流与合作、咨询费等。）</b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[0].othercapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[0].othercapital}'/></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfBudgets[1].othercapital" type="text" class="input_txt w_150" value='${situation.xfBudgets[1].othercapital}'/></td>
                <td class="td4"></td>
            </tr>
         </table>


        <table id="expend_table" style="margin-top: 10px;" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr><td colspan="3" class="td3"><b>专项支持资金支出预算（年度）  (单位：万元)</b></td></tr>
            <tr>
                <td class="td3" width="20%"><b>年度</b></td>
                <td class="td3" width="30%"><b>支持资金预算</b></td>
                <td class="td3" width="40%"><b>用途</b></td>
            </tr>
            <tr id="expend_year" class="hidePannel">
                 <td colspan="3">
                     <input name="xfExpenses[0].chyear" type="text" class="input_txt w_109" value='${situation.xfExpenses[0].chyear}'/>
                     <input name="xfExpenses[1].chyear" type="text" class="input_txt w_109" value='${situation.xfExpenses[1].chyear}'/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b></b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfExpenses[0].zccapital" type="text" class="input_txt w_150" value='${situation.xfExpenses[0].zccapital}'/></td>
                <td class="td4"><input name="xfExpenses[0].purpose" type="text" class="input_txt w_209" value='${situation.xfExpenses[0].purpose}'/></td>
            </tr>
            <tr>
                <td class="td1"><b></b></td>
                <td class="td4"><input onkeyup="javascript:RepNumber(this)" name="xfExpenses[1].zccapital" type="text" class="input_txt w_150" value='${situation.xfExpenses[1].zccapital}'/></td>
                <td class="td4"><input name="xfExpenses[1].purpose" type="text" class="input_txt w_209" value='${situation.xfExpenses[1].purpose}'/></td>
            </tr>
            <tr>
                <td class="td1"><b>合计</b></td>
                <td class="td4"></td>
                <td class="td4"></td>
            </tr>
         </table>


        <a href="javascript:void(0);" style="margin-top: 10px;" class="table_head">三：项目建设目标和进度计划<span onclick="movePanel('panel1')"></span></a>
        <%--<table id="expend_table"  border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">--%>
            <%--<tr>--%>
                <%--<td class="td3" width="20%"><b>项目建设期限</b></td>--%>
                <%--<td class="td3" width="70%">--%>

                <%--</td>--%>
            <%--</tr>--%>

            <table id="progresstable" border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
                <tr style="background: #daebfd; border:1px solid skyblue; ">
                    <td colspan="2">
                        <div style="float: left;">
                            <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowHolder()">添加</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowHolder()">删除</a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td3" width="20%"><b>项目建设期限</b></td>
                    <td class="td4" width="70%">
                        <form:input path="projstart_Date" cssClass="input_txt w_150"/> <b>至</b>
                        <form:input path="projend_Date" cssClass="input_txt w_150"/>
                    </td>
                </tr>
                <tr>
                    <td class="td3"><b>时间（季度）</b></td>
                    <td class="td4"><b>建设目标（包括设备、科技攻关、产业化目标等）</b></td>
                </tr>
                <c:forEach items="${situation.xfProgresses}" var="item" varStatus="i">
                      <tr>
                          <td class="td3">
                              <fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd" var="startDate"/>
                              <fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd" var="endDate"/>
                              <input type="text" class='w_109' name="xfProgresses[${i.index}].startDate" value="${startDate}"/>
                               <br/>至<br/>
                              <input type="text" class='w_109' name="xfProgresses[${i.index}].endDate" value="${endDate}"/>
                          </td>
                          <td class="td4">
                              <textarea cols="90" rows="3" name="xfProgresses[${i.index}].progress" class="input_txt">${item.progress}</textarea>
                          </td>
                      </tr>

                 </c:forEach>
              </table>





        <a href="javascript:void(0);"  style="margin-top: 10px;" class="table_head">四：项目验收指标<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr><td class="td1" width="10%"><b>技术性能指标</b></td>
                <td class="td2" colspan="5">
                    <textarea cols="90" rows="3" name="xfAcceptances[0].performindex" class="input_txt">${situation.xfAcceptances[0].performindex}</textarea>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="3"><b>其他技术指标</b></td>
                <td class="td1" width="16%"><b>专著.论文</b></td>
                <td class="td2"><input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].books" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].books}"/>篇</td>
                <td class="td1" width="16%"><b>专利</b></td>
                <td class="td2"><input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].patent" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].patent}"/>项</td>
            </tr>
            <tr>
                <td class="td1"><b>软件著作权</b></td>
                <td class="td2"> <input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].software" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].software}"/>件</td>
                <td class="td1"><b>软件产品登记</b></td>
                <td class="td2"><input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].otherproducts" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].otherproducts}"/>件</td>
            </tr>
            <tr>
                <td class="td1"><b>其他证书</b></td>
                <td class="td2" colspan="3"><input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].othercertificate" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].othercertificate}"/>件 </td>
            </tr>
            <tr>
                <td class="td1" rowspan="2"><b>经济指标</b></td>
                <td class="td1"><b>累计销售收入</b></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" name="xfAcceptances[0].salesincome" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].salesincome}"/>万元</td>
                <td class="td1"><b>累计利润</b></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" name="xfAcceptances[0].profit" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].profit}"/>万元</td>
            </tr>
            <tr>
                <td class="td1"><b>累计应缴税金</b></td>
                <td class="td2"><input onkeyup="javascript:RepNumber(this)" name="xfAcceptances[0].taxes" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].taxes}"/>万元</td>
                <td class="td1"><b>新增就业人数</b></td>
                <td class="td2"><input onkeyup="javascript:RegInt(this)" name="xfAcceptances[0].employment" type="text" class="input_txt w_109" value="${situation.xfAcceptances[0].employment}"/>人</td>
            </tr>
            <tr><td class="td1" width="10%"><b>社会效益</b></td>
                <td class="td2" colspan="5">
                    <textarea cols="90" rows="3" name="xfAcceptances[0].socialbenefit" class="input_txt">${situation.xfAcceptances[0].socialbenefit}</textarea>
                </td>
            </tr>
         </table>



        <div class="an">
            <button type="button" onclick="doSituationSave();" class="ico_tmpSave">
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
        changePageStatus(strstatus,"situdation",hasmidExm);


        var dt=new Date();
        params.year= dt.getFullYear();

        if($("input[name='xfFundsources[0].chyear']").val().length==0) {
            for (var i = 0; i < 2; i++) {  //2016年，2017年
                var stryear = (parseInt(params.year) + i).toString() + "年";
                if (i == 0) {
                    $("#capital_year").find("b").eq(0).html(stryear);
                    $("#capital_txtyear").find("input").eq(0).val(stryear);
                }
                else{
                    $("#capital_year").find("b").eq(1).html(stryear);
                    $("#capital_txtyear").find("input").eq(1).val(stryear);
                }
            }
        }
        if($("input[name='xfBudgets[0].chyear']").val().length==0) {
            for (var i = 0; i < 2; i++) {  //2016年，2017年
                var stryear = (parseInt(params.year) + i).toString() + "年";
                if (i == 0) {
                    $("#inverst_year").find("b").eq(1).html(stryear);
                    $("#inverst_txtyear").find("input").eq(0).val(stryear);
                }
                else{
                    $("#inverst_year").find("b").eq(2).html(stryear);
                    $("#inverst_txtyear").find("input").eq(1).val(stryear);
                }
            }
        }

        if($("input[name='xfExpenses[0].chyear']").val().length==0){
            for (var i = 0; i < 2; i++) {  //2016年，2017年
                var stryear = (parseInt(params.year) + i).toString() + "年";
                if (i == 0) {
                    $("#expend_table tr:gt(2)").find("b").eq(0).html(stryear);
                    $("#expend_year").find("input").eq(0).val(stryear);
                }
                else{
                    $("#expend_table tr:gt(2)").find("b").eq(1).html(stryear);
                    $("#expend_year").find("input").eq(1).val(stryear);
                }
            }
        }


    }

    function doSituationSave(){
        doSubmit();

        parent.window.location.href=base+ "/deptReport/InfoReport/input.htm?xfCaterotyCode=situdation&op=g";
    }

    $(function(){
       init_page();


        $("#capital_table").find("input").change(function(){
            //当数据修改后更改右边的值
            var num1=parseFloat( $(this).closest("tr").find("input:eq(0)").val());
            var num2=parseFloat( $(this).closest("tr").find("input:eq(1)").val());
            var num3=num1+num2;
            $(this).closest("tr").find("td:eq(3)").html("<b>"+numParse(num3)+"</b>");

            //当数据修改后更改顶上的总值
            var num4= 0,num5= 0,num6=0;
            $("#capital_table tr:gt(3)").find("input").each(function(index,item){
                if(index%2==0){
                    num4+=parseFloat($(item).val());
                }
                else{
                    num5+=parseFloat($(item).val());
                }
            });
            $("#capital_table tr:gt(3)").find("td").each(function(index,item){
                if(index%4==3){
                    num6+=parseFloat($(item).text());
                }
            });
            $("#capital_table tr:eq(2)").find("td:eq(0)").html("<b>"+numParse(num4)+"</b>");
            $("#capital_table tr:eq(2)").find("td:eq(1)").html("<b>"+numParse(num5)+"</b>");
            $("#capital_table tr:eq(2)").find("td:eq(2)").html("<b>"+numParse(num6)+"</b>");
        });




        $("#inverst_table").find("input").change(function(){
            //当数据修改后更改右边的值
            var num1=parseFloat( $(this).closest("tr").find("input:eq(0)").val());
            var num2=parseFloat( $(this).closest("tr").find("input:eq(1)").val());
            var num3=num1+num2;
            $(this).closest("tr").find("td:eq(3)").html("<b>"+numParse(num3)+"</b>");
        });


        $("#expend_table").find("input").change(function(){
            //当数据修改后更改右边的值
            var num1=parseFloat($("#expend_table tr:eq(3)").find("input:eq(0)").val() );
            var num2=parseFloat($("#expend_table tr:eq(4)").find("input:eq(0)").val() );
            var num3=num1+num2;
            $("#expend_table tr:eq(5)").find("td:eq(1)").html("<b>"+numParse(num3)+"</b>");
        });

        $("#progresstable").on("click","tr:gt(2)",function(){

            $(this).find("td").removeClass("td3").removeClass("td4");
            $(this).addClass("backChoose");
            $(this).siblings().each(function(index,item){
                if($(item).hasClass("backChoose")) {
                    $(item).find("td").eq(0).addClass("td3");
                    $(item).find("td").eq(1).addClass("td4");
                    $(item).removeClass("backChoose");
                }
            });
        });

    });


    function numParse(num){
        return isNaN(num)?"":num;
    }


    var progressParas={
        startDate:null,
        endDate:null,
        progress:null
    };
    var progressrow=0;

    function addRowHolder(){
        progressrow=$("#progresstable").find("tr:gt(2)").length;
        var strinfo="";
        strinfo+="<tr>";
        strinfo+="<td class='td3'><input type='text' onmousedown='timeSel(this)' class='w_109' name='xfProgresses["+progressrow+"].startDate'/><br/>至<br/><input onmousedown='timeSel(this)' type='text' class='w_109' name='xfProgresses["+progressrow+"].endDate'/></td>";
        strinfo+="<td class='td4'><textarea cols='90' rows='3' name='xfProgresses["+progressrow+"].progress' class='input_txt'/> </td>";
        strinfo+="</td>";

        progressrow++;
        $("#progresstable").append(strinfo);
    }
    function delRowHolder(){
        var flag=false;
        $("#progresstable").find("tr:gt(2)").each(function(index,item){
            if($(item).hasClass("backChoose")) {
                $(item).remove();
                flag=true;
            }
        });
        if(!flag){
            msg("请选择要删除的行");
        }

    }

    function timeSel(item){
        $(item).bind('click', WdatePicker);
    }


</script>
</body>
</html>
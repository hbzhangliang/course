<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
<%@ include file="../../../include/textedit.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="StasticsSave.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>企业财务基本数据<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td3"><b>科目</b></td>
                <td class="td3"><b>前两年</b></td>
                <td class="td3"><b>前一年</b></td>
                <td class="td3"><b>最近一个月</b></td>
            </tr>
            <tr class="hidePannel">
                <td class="td3"><input type="text" class='w_109' name="statisticsList[0].id" value="${bean.statisticsList[0].id}"/></td>
                <td class="td3"><input type="text" class='w_109' name="statisticsList[1].id" value="${bean.statisticsList[1].id}"/></td>
                <td class="td3"><input type="text" class='w_109' name="statisticsList[2].id" value="${bean.statisticsList[2].id}"/></td>
            </tr>
            <tr class="hidePannel">
                <td class="td3"><input type="text" class='w_109' name="statisticsList[0].name" value="前两年"/></td>
                <td class="td3"><input type="text" class='w_109' name="statisticsList[1].name" value="前一年"/></td>
                <td class="td3"><input type="text" class='w_109' name="statisticsList[2].name" value="最近一个月"/></td>
            </tr>
            <tr>
                <td class="td1"><b>货币资金</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].monetary" value="${bean.statisticsList[0].monetary}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].monetary" value="${bean.statisticsList[1].monetary}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].monetary" value="${bean.statisticsList[2].monetary}"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="15%"><b>短期投资</b></td>
                <td class="td4" width="20%">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].shortterminvest" value="${bean.statisticsList[0].shortterminvest}"/>
                </td>
                <td class="td4" width="20%">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].shortterminvest" value="${bean.statisticsList[1].shortterminvest}"/>
                </td>
                <td class="td4" width="20%">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].shortterminvest" value="${bean.statisticsList[2].shortterminvest}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>应收账款</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].receivables" value="${bean.statisticsList[0].receivables}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].receivables" value="${bean.statisticsList[1].receivables}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].receivables" value="${bean.statisticsList[2].receivables}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>其他应收账单</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].otherreceivables" value="${bean.statisticsList[0].otherreceivables}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].otherreceivables" value="${bean.statisticsList[1].otherreceivables}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].otherreceivables" value="${bean.statisticsList[2].otherreceivables}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>预付账单</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].prepay" value="${bean.statisticsList[0].prepay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].prepay" value="${bean.statisticsList[1].prepay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].prepay" value="${bean.statisticsList[2].prepay}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>存货</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].stock" value="${bean.statisticsList[0].stock}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].stock" value="${bean.statisticsList[1].stock}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].stock" value="${bean.statisticsList[2].stock}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>流动资金合计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].flowmoney" value="${bean.statisticsList[0].flowmoney}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].flowmoney" value="${bean.statisticsList[1].flowmoney}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].flowmoney" value="${bean.statisticsList[2].flowmoney}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>固定资产原值</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].fixmoney" value="${bean.statisticsList[0].fixmoney}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].fixmoney" value="${bean.statisticsList[1].fixmoney}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].fixmoney" value="${bean.statisticsList[2].fixmoney}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>固定资产净值</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].fixvalue" value="${bean.statisticsList[0].fixvalue}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].fixvalue" value="${bean.statisticsList[1].fixvalue}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].fixvalue" value="${bean.statisticsList[2].fixvalue}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>在建工程</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].construction" value="${bean.statisticsList[0].construction}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].construction" value="${bean.statisticsList[1].construction}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].construction" value="${bean.statisticsList[2].construction}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>固定资产合计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].fixtotal" value="${bean.statisticsList[0].fixtotal}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].fixtotal" value="${bean.statisticsList[1].fixtotal}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].fixtotal" value="${bean.statisticsList[2].fixtotal}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>无形资产</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].intangible" value="${bean.statisticsList[0].intangible}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].intangible" value="${bean.statisticsList[1].intangible}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].intangible" value="${bean.statisticsList[2].intangible}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>递延资产</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].deferred" value="${bean.statisticsList[0].deferred}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].deferred" value="${bean.statisticsList[1].deferred}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].deferred" value="${bean.statisticsList[2].deferred}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>总资产</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].totalassert" value="${bean.statisticsList[0].totalassert}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].totalassert" value="${bean.statisticsList[1].totalassert}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].totalassert" value="${bean.statisticsList[2].totalassert}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>短期借款</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].shortborrow" value="${bean.statisticsList[0].shortborrow}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].shortborrow" value="${bean.statisticsList[1].shortborrow}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].shortborrow" value="${bean.statisticsList[2].shortborrow}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>应付账款</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].shouldpay" value="${bean.statisticsList[0].shouldpay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].shouldpay" value="${bean.statisticsList[1].shouldpay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].shouldpay" value="${bean.statisticsList[2].shouldpay}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>预付账款</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].prepayalbe" value="${bean.statisticsList[0].prepayalbe}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].prepayalbe" value="${bean.statisticsList[1].prepayalbe}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].prepayalbe" value="${bean.statisticsList[2].prepayalbe}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>应付工资</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].salary" value="${bean.statisticsList[0].salary}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].salary" value="${bean.statisticsList[1].salary}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].salary" value="${bean.statisticsList[2].salary}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>其他应付款</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].othershouldpay" value="${bean.statisticsList[0].othershouldpay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].othershouldpay" value="${bean.statisticsList[1].othershouldpay}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].othershouldpay" value="${bean.statisticsList[2].othershouldpay}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>流动负债合计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].flowliability" value="${bean.statisticsList[0].flowliability}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].flowliability" value="${bean.statisticsList[1].flowliability}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].flowliability" value="${bean.statisticsList[2].flowliability}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>负债合计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].totalliability" value="${bean.statisticsList[0].totalliability}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].totalliability" value="${bean.statisticsList[1].totalliability}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].totalliability" value="${bean.statisticsList[2].totalliability}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>实收资本</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].getcapital" value="${bean.statisticsList[0].getcapital}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].getcapital" value="${bean.statisticsList[1].getcapital}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].getcapital" value="${bean.statisticsList[2].getcapital}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>资本公积</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].capitalgj" value="${bean.statisticsList[0].capitalgj}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].capitalgj" value="${bean.statisticsList[1].capitalgj}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].capitalgj" value="${bean.statisticsList[2].capitalgj}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>盈余公积</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].capitalyy" value="${bean.statisticsList[0].capitalyy}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].capitalyy" value="${bean.statisticsList[1].capitalyy}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].capitalyy" value="${bean.statisticsList[2].capitalyy}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>未分配利润</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].undistributed" value="${bean.statisticsList[0].undistributed}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].undistributed" value="${bean.statisticsList[1].undistributed}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].undistributed" value="${bean.statisticsList[2].undistributed}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>所有者权益合计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].ownership" value="${bean.statisticsList[0].ownership}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].ownership" value="${bean.statisticsList[1].ownership}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].ownership" value="${bean.statisticsList[2].ownership}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>主营业务收入</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].mainbusiness" value="${bean.statisticsList[0].mainbusiness}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].mainbusiness" value="${bean.statisticsList[1].mainbusiness}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].mainbusiness" value="${bean.statisticsList[2].mainbusiness}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>主营业务成本</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].maincost" value="${bean.statisticsList[0].maincost}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].maincost" value="${bean.statisticsList[1].maincost}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].maincost" value="${bean.statisticsList[2].maincost}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>经营费用</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].expense" value="${bean.statisticsList[0].expense}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].expense" value="${bean.statisticsList[1].expense}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].expense" value="${bean.statisticsList[2].expense}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>主营业务利润</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].mainprofit" value="${bean.statisticsList[0].mainprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].mainprofit" value="${bean.statisticsList[1].mainprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].mainprofit" value="${bean.statisticsList[2].mainprofit}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>营业费用</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].operatingfee" value="${bean.statisticsList[0].operatingfee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].operatingfee" value="${bean.statisticsList[1].operatingfee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].operatingfee" value="${bean.statisticsList[2].operatingfee}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>管理费用</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].managefee" value="${bean.statisticsList[0].managefee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].managefee" value="${bean.statisticsList[1].managefee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].managefee" value="${bean.statisticsList[2].managefee}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>财务费用</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].finnacefee" value="${bean.statisticsList[0].finnacefee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].finnacefee" value="${bean.statisticsList[1].finnacefee}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].finnacefee" value="${bean.statisticsList[2].finnacefee}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>营业利润</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].operateprofit" value="${bean.statisticsList[0].operateprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].operateprofit" value="${bean.statisticsList[1].operateprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].operateprofit" value="${bean.statisticsList[2].operateprofit}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>投资收益</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].investincome" value="${bean.statisticsList[0].investincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].investincome" value="${bean.statisticsList[1].investincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].investincome" value="${bean.statisticsList[2].investincome}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>营业外收入</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].nonbusinessincome" value="${bean.statisticsList[0].nonbusinessincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].nonbusinessincome" value="${bean.statisticsList[1].nonbusinessincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].nonbusinessincome" value="${bean.statisticsList[2].nonbusinessincome}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>营业外支出</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].nonbusinessexpense" value="${bean.statisticsList[0].nonbusinessexpense}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].nonbusinessexpense" value="${bean.statisticsList[1].nonbusinessexpense}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].nonbusinessexpense" value="${bean.statisticsList[2].nonbusinessexpense}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>其他业务利润</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].otherprofit" value="${bean.statisticsList[0].otherprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].otherprofit" value="${bean.statisticsList[1].otherprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].otherprofit" value="${bean.statisticsList[2].otherprofit}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>利润总额</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].totalprofit" value="${bean.statisticsList[0].totalprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].totalprofit" value="${bean.statisticsList[1].totalprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].totalprofit" value="${bean.statisticsList[2].totalprofit}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>净利润</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].netprofit" value="${bean.statisticsList[0].netprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].netprofit" value="${bean.statisticsList[1].netprofit}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].netprofit" value="${bean.statisticsList[2].netprofit}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>销售商品,提供劳务收到的现金</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].labour" value="${bean.statisticsList[0].labour}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].labour" value="${bean.statisticsList[1].labour}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].labour" value="${bean.statisticsList[2].labour}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>购买商品,接受劳务支付的现金</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].paycash" value="${bean.statisticsList[0].paycash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].paycash" value="${bean.statisticsList[1].paycash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].paycash" value="${bean.statisticsList[2].paycash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>支付给职工以及为职工支付的现金</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].staffcash" value="${bean.statisticsList[0].staffcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].staffcash" value="${bean.statisticsList[1].staffcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].staffcash" value="${bean.statisticsList[2].staffcash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>经营活动产生的现金流量净额</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].netcash" value="${bean.statisticsList[0].netcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].netcash" value="${bean.statisticsList[1].netcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].netcash" value="${bean.statisticsList[2].netcash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>投资活动产生的现金流量小计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].totalcash" value="${bean.statisticsList[0].totalcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].totalcash" value="${bean.statisticsList[1].totalcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].totalcash" value="${bean.statisticsList[2].totalcash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>构建固定资产,无形资产和其他长期投资所支付的现金</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].inverstcash" value="${bean.statisticsList[0].inverstcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].inverstcash" value="${bean.statisticsList[1].inverstcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].inverstcash" value="${bean.statisticsList[2].inverstcash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>投资活动产生的现金流量小计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].flowcash" value="${bean.statisticsList[0].flowcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].flowcash" value="${bean.statisticsList[1].flowcash}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].flowcash" value="${bean.statisticsList[2].flowcash}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>筹资活动产生的现金流量净额</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].netfinance" value="${bean.statisticsList[0].netfinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].netfinance" value="${bean.statisticsList[1].netfinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].netfinance" value="${bean.statisticsList[2].netfinance}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>筹资活动产生的现金流入小计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].infinance" value="${bean.statisticsList[0].infinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].infinance" value="${bean.statisticsList[1].infinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].infinance" value="${bean.statisticsList[2].infinance}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>筹资活动产生的现金流出小计</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].outfinance" value="${bean.statisticsList[0].outfinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].outfinance" value="${bean.statisticsList[1].outfinance}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].outfinance" value="${bean.statisticsList[2].outfinance}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>筹资活动产生的现金流量净额</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].netinverst" value="${bean.statisticsList[0].netinverst}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].netinverst" value="${bean.statisticsList[1].netinverst}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].netinverst" value="${bean.statisticsList[2].netinverst}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>现金及现金等价物净增加额</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].cashincrease" value="${bean.statisticsList[0].cashincrease}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].cashincrease" value="${bean.statisticsList[1].cashincrease}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].cashincrease" value="${bean.statisticsList[2].cashincrease}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>销售收入</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].saleincome" value="${bean.statisticsList[0].saleincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].saleincome" value="${bean.statisticsList[1].saleincome}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].saleincome" value="${bean.statisticsList[2].saleincome}"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>净资产</b></td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[0].netcapital" value="${bean.statisticsList[0].netcapital}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[1].netcapital" value="${bean.statisticsList[1].netcapital}"/>
                </td>
                <td class="td4">
                    <input type="text" onkeyup="javascript:RepNumber(this)" class='w_109' name="statisticsList[2].netcapital" value="${bean.statisticsList[2].netcapital}"/>
                </td>
            </tr>


        </table>
        <div class="an">
            <button type="button" onclick="doStasticsSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>

    function doStasticsSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=data&op=g";
    }

    $(function(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);
    })

</script>
</body>
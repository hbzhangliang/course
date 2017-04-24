<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_default.jsp" %>
<html>
<head>
<style type="text/css">
	.cannel{
		border: 1px solid black;
		margin:0;padding:0;border-collapse:collapse;
	}
	.cannel tr{
	    display:block;
		margin: 0px;
		padding: 0px;
		
	}
	.cannel td{
		margin: 0px;
		padding: 0px;
		border:1px solid black;
	}
</style>
</head>
<body>
<div style="margin-left: 200px;">
    <span style="font-family:方正小标宋_GBK;font-size:29px">长宁区科技创新券兑现申请表</span>
</div>
<table width="840" class="cannel">
        <tr style="height:30px">
            <td width="650" valign="center" colspan="11">
                <p style="text-align:center">
                    <span style="font-family:黑体;font-size:16px">一、申请单位基本情况</span>
                </p>
            </td>
        </tr>
        <tr style="height:37px">
            <td width="104" valign="center" colspan="2" >
                <p style="text-align:center;line-height:27px">
                    <span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">申请单位名称</span>
                </p>
            </td>
            <td width="547" valign="top" colspan="9" >
                <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">${corp.unitName }</span>
            </td>
        </tr>
        <tr style="height:36px">
            <td width="104" valign="center" colspan="2" rowspan="3" >
                <p style="text-align:center;line-height:27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">银行账户信息</span>
                </p>
            </td>
            <td width="547" valign="top" colspan="9" >
                <p style="line-height: 27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">开户银行：${bankAccount.bankname}</span>
                </p>
            </td>
        </tr>
        <tr style="height:30px">
            <td width="547" valign="top" colspan="9" >
                <p style="line-height: 27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">账号名：${bankAccount.username}</span>
                </p>
            </td>
        </tr>
        <tr style="height:30px">
            <td width="547" valign="top" colspan="9" >
                <p style="line-height: 27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">银行账号：${bankAccount.account}</span>
                </p>
            </td>
        </tr>
        <tr style="height:27px">
            <td width="104" valign="center" colspan="2" >
                <p style="text-align:center;line-height:27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">联系人</span>
                </p>
            </td>
            <td width="214" valign="top" colspan="4" >
               <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px"> ${corp.contact}</span>
            </td>
            <td width="166" valign="top" colspan="3" >
                <p style="line-height: 27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">联系电话</span>
                </p>
            </td>
            <td width="167" valign="top" colspan="2" >
                ${corp.tel}
            </td>
        </tr>
        <tr style="height:30px">
            <td width="104" valign="center" colspan="2" >
                <p style="text-align:center;line-height:27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">手机</span>
                </p>
            </td>
            <td width="214" valign="top" colspan="4" >
                ${corp.mobile}
            </td>
            <td width="166" valign="top" colspan="3" >
                <p style="line-height: 27px">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:16px;position:relative;top:4px">E-MAIL</span>
                </p>
            </td>
            <td width="167" valign="top" colspan="2" >
                ${corp.email}
            </td>
        </tr>
        <tr style="height:33px">
            <td width="650" valign="center" colspan="11">
                <p style="text-align:center">
                    <span style=";font-family:黑体;font-size:16px">二、兑现科技创新券的项目明细</span>
                </p>
            </td>
        </tr>
        <tr style="height:33px">
            <td width="54" valign="center" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">序号</span>
                </p>
            </td>
            <td width="73" valign="center" colspan="2">
                <p style="text-align:center">
                    <span style="font-family:仿宋_GB2312;font-size:14px">服务单位</span>
                </p>
            </td>
            <td width="85" valign="center" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">发票代码</span>
                </p>
            </td>
            <td width="83" valign="center" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">发票号码</span>
                </p>
            </td>
            <td width="88" valign="center" colspan="2" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">发票日期</span>
                </p>
            </td>
            <td width="91" valign="center" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">发票金额</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">(</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">元</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">)</span>
                </p>
            </td>
            <td width="88" valign="center" colspan="2" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">服务项目</span>
                </p>
            </td>
            <td width="89" valign="center" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">服务金额</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">(</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">元</span><span style="font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">)</span>
                </p>
            </td>
        </tr>
       <c:forEach items="${bean.serviceItems}" var="item" varStatus="i">
        <tr style="height:26px">
            <td width="54" valign="center">${item.number}</td>
            <td width="73" valign="center" colspan="2" >${item.company}</td>
            <td width="85" valign="center" >${item.invoiceCode}</td>
            <td width="83" valign="center" >${item.invoiceNumber}</td>
            <td width="88" valign="center" colspan="2" ><fmt:formatDate value="${item.invoiceDate}" pattern="yyyy-MM-dd" /></td>
            <td width="91" valign="center" ><fmt:formatNumber pattern="0" value="${item.invoiceMoney}"></fmt:formatNumber></td>
            <td width="88" valign="center" colspan="2" ><gw:lookups category="${lookups_ZCLX}" lookupsCode="${item.content}"/></td>
            <td width="89" valign="center" ><fmt:formatNumber pattern="0" value="${item.money}"></fmt:formatNumber></td>
        </tr>
      </c:forEach>
        
        <tr style="height:35px">
            <td width="295" valign="center" colspan="5" >
                <p style="text-align:center">
                    <span style=";font-family:仿宋_GB2312;letter-spacing:-1px;font-size:14px;position:relative;top:4px">合计</span>
                </p>
            </td>
            <td width="356" valign="center" colspan="6" >
            	    科技券总金额：<fmt:formatNumber pattern="0" value="${bean.cost}"></fmt:formatNumber>元
            </td>
        </tr>
        <tr style="height:41px">
            <td width="650" valign="center" colspan="11" >
                <p style="text-align:center">
                    <span style=";font-family:黑体;font-size:16px">三、科技创新券使用成效</span>
                </p>
            </td>
        </tr>
        <tr style="height:362px">
            <td width="650" valign="top" colspan="11" >
                <p style="margin-left:7px">
                    <span style=";font-family:仿宋;font-size:16px">使用科技创新券解决的关键问题和取得社会经济效益，以案例说明。</span>
                </p>
                <p style="margin-left:7px">
                    <span style="font-family:仿宋_GB2312;font-size:16px">&nbsp;${bean.effect}</span>
                </p>
            </td>
        </tr>
        <tr style="height:37px">
            <td width="650" valign="center" colspan="11" >
                <p style="text-align:center">
                    <span style=";font-family:黑体;font-size:16px">四、审核意见</span>
                </p>
            </td>
        </tr>
        <tr style="height:427px">
            <td width="650" valign="top" colspan="11" >
                <p>
                    <span style=";font-family:仿宋;font-size:16px">申请单位意见（申报信息是否属实）：</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;<span style="font-family: 仿宋_GB2312;">${bean.suggestion}</span></span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p>
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p style="text-indent:313px">
                    <span style=";font-family:仿宋;font-size:16px">法人代表签章：</span>
                </p>
                <p style="text-indent:304px">
                    <span style=";font-family:仿宋;font-size:16px">（单位盖章）</span>
                </p>
                <p style="text-indent:384px">
                    <span style="font-family:仿宋;font-size:16px">&nbsp;</span>
                </p>
                <p style="text-indent:332px">
                    <span style="font-family:仿宋;font-size:16px">年</span><span style=";font-family:仿宋;font-size:16px">&nbsp;&nbsp;</span><span style="font-family:仿宋;font-size:16px">月</span><span style=";font-family:仿宋;font-size:16px">&nbsp;&nbsp;</span><span style="font-family:仿宋;font-size:16px">日</span>
                </p>
            </td>
        </tr>
</table>
<p>
    <span style=";font-family:Calibri;font-size:14px">&nbsp;</span>
</p>
<p>
    <span style=";font-family:Calibri;font-size:14px">&nbsp;</span>
</p>
<p>
    <br/>
</p>
</body>
</html>

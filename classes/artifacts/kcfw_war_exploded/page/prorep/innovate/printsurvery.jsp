<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ include file="../../../include/taglib.jsp" %>--%>
<%--<%@ include file="../../../include/resource.jsp" %>--%>

</head>
<style type="text/css">
    .div_main{
        width: 620px;
        position: relative;
        background: yellow;

    }

    .div_charpter{
        width: 610px;position: relative;
    }

     .title_main{
         font-size: 30px;font-weight: bolder;color: red;
     }
    .title_sub{
        font-size: 20px;font-weight: bolder;color: green;
    }
    .title_content{
        font-size:15px;font-weight: bolder ;color: blue;
    }
    .txt_content{
        font-size:15px;
    }

    .table_content{
        width:468.0pt;margin-left:-12.6pt;border-collapse:collapse;border:none;
        mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
        mso-border-insideh:.5pt solid windowtext;mso-border-insidev:.5pt solid windowtext
    }
    .table_content tr{
        mso-yfti-irow:0;mso-yfti-firstrow:yes;height:22.5pt;
    }
    .table_content tr td{
        width:88.25pt;border:solid windowtext 1.0pt;
        mso-border-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:22.5pt
    }

    img{
        width: 100px;
        height: 80px;
        border:1px solid #ccc;
    }

</style>
<body>
    <div class="div_main">
        <div class="div_charpter">
            <h2 align="center" class="title_main">第一部分 申报项目基本信息</h2>
            <%--<span  class="txt_content">${bean.baseinfo}</span>--%>
        </div>
        <div class="div_charpter">
            <h2 align="center" class="title_main">第二部分 企业概况</h2>
            <h3 class="title_sub">第一章 企业基本信息</h3>
            <table  align='center'  class="table_content">
                <tr>
                    <td width="16%" align="center"><b>企业名称</b></td>
                    <td colspan="3" align="center">
                        ${bean.corpname}
                    </td>
                </tr>
                <tr>
                    <td width="16%" align="center"><b>成立时间</b></td>
                    <td width="25%" align="center">
                        <fmt:formatDate value="${bean.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
                            ${regDate}
                    </td>
                    <td width="16%" align="center"><b>注册资本(万元)</b></td>
                    <td width="25%" align="center">
                        ${bean.regCapital}
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center"><b>法定代表人</b></td>
                    <td align="center"><b>企业代表人</b></td>
                    <td align="center"><b>联系人</b></td>
                </tr>
                <tr>
                    <td align="center"><b>姓名</b></td>
                    <td align="center"> ${bean.dbname}</td>
                    <td align="center"> ${bean.fzname}</td>
                    <td align="center"> ${bean.lxname}</td>
                </tr>
                <tr>
                    <td align="center"><b>最高学历</b></td>
                    <td align="center"> ${bean.dblevel}</td>
                    <td align="center"> ${bean.fzlevel}</td>
                    <td align="center"> ${bean.lxlevel}</td>
                </tr>
                <tr>
                    <td align="center"><b>专业</b></td>
                    <td align="center"> ${bean.dbmajor}</td>
                    <td align="center"> ${bean.fzmajor}</td>
                    <td align="center"> ${bean.lxmajor}</td>
                </tr>
                <tr>
                    <td align="center"><b>身份证号码</b></td>
                    <td align="center"> ${bean.dbcard}</td>
                    <td align="center"> ${bean.fzcard}</td>
                    <td align="center"> ${bean.lxcard}</td>
                </tr>
                <tr>
                    <td align="center"><b>职称</b></td>
                    <td align="center"> ${bean.dbposition}</td>
                    <td align="center"> ${bean.fzposition}</td>
                    <td align="center"> ${bean.lxposition}</td>
                </tr>
                <tr>
                    <td align="center"><b>办公电话</b></td>
                    <td align="center"> ${bean.dbcall}</td>
                    <td align="center"> ${bean.fzcall}</td>
                    <td align="center"> ${bean.lxcall}</td>
                </tr>
                <tr>
                    <td align="center"><b>移动电话</b></td>
                    <td align="center"> ${bean.dbphone}</td>
                    <td align="center"> ${bean.fzphone}</td>
                    <td align="center"> ${bean.lxphone}</td>
                </tr>
                <tr>
                    <td align="center"><b>E_mail</b></td>
                    <td align="center"> ${bean.dbemail}</td>
                    <td align="center"> ${bean.fzemail}</td>
                    <td align="center"> ${bean.lxemail}</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table style="width: 500px;">
                            <tr>
                                <th>股东名称(或姓名)</th>
                                <th>投资者经济形态</th>
                                <th>法人代码<br/>(或身份证号)</th>
                                <th>是否上市公司</th>
                                <th>境外公司或外籍</th>
                                <th>所占股份(%)</th>
                                <th>投资方式</th>
                            </tr>

                        </table>
                    </td>
                </tr>

                <tr>
                    <td align="center"><b>开户银行</b></td>
                    <td align="center">
                        ${bean.bankname}
                    </td>
                    <td align="center"><b>信用等级</b></td>
                    <td align="center">
                        ${bean.credit}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>账号</b></td>
                    <td align="center">
                        ${bean.bankcode}
                    </td>
                    <td align="center" width="16%"><b>上年研究开发经费投入</b></td>
                    <td align="center" width="25%">
                        ${bean.funding}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>上年度营业收入(万元)</b></td>
                    <td align="center">
                        ${bean.lastincome}
                    </td>
                    <td align="center"><b>上年度缴税总额(万元)</b></td>
                    <td align="center">
                        ${bean.lasttexes}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>上年度创汇(万美元)</b></td>
                    <td align="center">
                        ${bean.lastexchange}
                    </td>
                    <td align="center"><b>员工总数</b></td>
                    <td align="center">
                        ${bean.staffcount}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>企业类型</b></td>
                    <td align="center">
                        ${bean.corptype}
                    </td>
                    <td align="center"><b>已有成果数</b></td>
                    <td align="center">
                        ${bean.resultcount}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>已转让成果数</b></td>
                    <td align="center">
                        ${bean.passresult}
                    </td>
                    <td align="center"><b>企业登记类型</b></td>
                    <td align="center">
                        ${bean.regtype}
                    </td>
                </tr>
                <tr>
                    <td align="center"><b>企业性质</b></td>
                    <td align="center">
                        ${bean.corpcharacter}
                    </td>
                    <td align="center"><b>企业特性</b></td>
                    <td align="center">
                        ${bean.corpnature}
                    </td>
                </tr>
             </table>

            <br/>
            <h3 class="title_sub">第二章 管理团队</h3>
            <table align="center" style="width: 600px;" class="table_content">
                <tr>
                    <td><b>核心团队</b></td>
                </tr>
                <tr>
                    <td>${bean.coreteamer}</td>
                </tr>
                <tr>
                    <td><b>创业企业家介绍</b></td>
                </tr>
                <tr>
                    <td>${bean.entrepreneur}</td>
                </tr>
            </table>
        </div>

    </div>
<script>



</script>
</body>
</html>
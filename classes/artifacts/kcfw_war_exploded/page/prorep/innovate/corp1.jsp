<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="Corp1Save.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>企业基本信息<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <form:hidden path="baseinfo"/>
            <form:hidden path="corp.id"/>
            <form:hidden path="status"/>
            <form:hidden path="coreteamer"/>
            <form:hidden path="entrepreneur"/>
            <form:hidden path="human"/>
            <form:hidden path="researchablity"/>
            <form:hidden path="equipment"/>
            <form:hidden path="saleability"/>
            <form:hidden path="moneymanage"/>
            <form:hidden path="otherability"/>
            <form:hidden path="development"/>
            <form:hidden path="getsupports"/>
            <form:hidden path="batch.id"/>
            <tr>
                <td class="td1" width="16%"><b>企业名称</b></td>
                <td class="td2" colspan="3">
                    <form:input path="corpname" cssClass="input_txt w_209"/>
                </td>
            </tr>
            <tr>
                <td class="td1" width="16%"><b>成立时间</b></td>
                <td class="td2">
                    <form:input path="regDate" cssClass="input_txt w_209"/>
                </td>
                <td class="td1" width="16%"><b>注册资本(万元)</b></td>
                <td class="td2">
                    <form:input path="regCapital" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"></td>
                <td class="td3"><b>法定代表人</b></td>
                <td class="td3"><b>企业代表人</b></td>
                <td class="td3"><b>联系人</b></td>
            </tr>
            <tr>
                <td class="td1"><b>姓名</b></td>
                <td class="td4"><form:input path="dbname" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzname" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxname" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>最高学历</b></td>
                <td class="td4"><form:input path="dblevel" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzlevel" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxlevel" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>专业</b></td>
                <td class="td4"><form:input path="dbmajor" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzmajor" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxmajor" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>身份证号码</b></td>
                <td class="td4"><form:input path="dbcard" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzcard" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxcard" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>职称</b></td>
                <td class="td4"><form:input path="dbposition" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzposition" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxposition" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>办公电话</b></td>
                <td class="td4"><form:input path="dbcall" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzcall" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxcall" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>移动电话</b></td>
                <td class="td4"><form:input path="dbphone" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzphone" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxphone" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td1"><b>E_mail</b></td>
                <td class="td4"><form:input path="dbemail" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="fzemail" cssClass="input_txt w_150"/></td>
                <td class="td4"><form:input path="lxemail" cssClass="input_txt w_150"/></td>
            </tr>

            <tr>
                <td colspan="4">
                    <table id="holdertable"  class="table_04">
                        <tr style="background: #daebfd; border:1px solid skyblue; ">
                            <td colspan="7">
                                <div style="float: left;">
                                    <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowHolder()">添加</a>
                                    <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowHolder()">删除</a>
                                        <%--<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-save" onclick="saveRowHolder()">保存</a>--%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th width="10%">股东名称(或姓名)</th>
                            <th width="10%">投资者经济形态</th>
                            <th width="15%">法人代码<br/>(或身份证号)</th>
                            <th width="8%">是否上市公司</th>
                            <th width="8%">境外公司或外籍</th>
                            <th width="10%">所占股份(%)</th>
                            <th width="10%">投资方式</th>
                        </tr>
                        <c:forEach items="${bean.cxshareholdersList}" var="item" varStatus="i">
                            <tr>
                                <td><input type="text" class='w_90' name="cxshareholdersList[${i.index}].name" value="${item.name}"/></td>
                                <td><input type="text" class='w_90' name="cxshareholdersList[${i.index}].investstion" value="${item.investstion}"/></td>
                                <td><input type="text" class='w_90' name="cxshareholdersList[${i.index}].cardno" value="${item.cardno}"/></td>
                                <td> <input class="hidePannel" name="cxshareholdersList[${i.index}].isMarket" value="${item.isMarket}"/>
                                    <c:if test="${item.isMarket}">
                                        <input name="market${i.index}" type="radio" value="1" checked="checked">是</input>
                                        <input name="market${i.index}" type="radio" value="0">否</input>
                                    </c:if>
                                    <c:if test="${!item.isMarket}">
                                        <input name="market${i.index}" type="radio" value="1">是</input>
                                        <input name="market${i.index}" type="radio" value="0" checked="checked">否</input>
                                    </c:if>
                                </td>
                                <td>   <input class="hidePannel" name="cxshareholdersList[${i.index}].isOutboard" value="${item.isOutboard}"/>
                                    <c:if test="${item.isOutboard}">
                                        <input name="outboard${i.index}" type="radio" value="1" checked="checked">是</input>
                                        <input name="outboard${i.index}" type="radio" value="0">否</input>
                                    </c:if>
                                    <c:if test="${!item.isOutboard}">
                                        <input name="outboard${i.index}" type="radio" value="1">是</input>
                                        <input name="outboard${i.index}" type="radio" value="0" checked="checked">否</input>
                                    </c:if>
                                </td>

                                <td><input type="text" class='w_90' onkeyup="javascript:RepNumber(this)" name="cxshareholdersList[${i.index}].occupies" value="${item.occupies}"/></td>
                                <td><input type="text" class='w_90' name="cxshareholdersList[${i.index}].investtype" value="${item.investtype}"/></td>
                             </tr>
                        </c:forEach>
                        </table>
                </td>
            </tr>


            <tr>
                <td class="td1"><b>开户银行</b></td>
                <td class="td2">
                    <form:input path="bankname" cssClass="input_txt w_209"/>
                </td>
                <td class="td1"><b>信用等级</b></td>
                <td class="td2">
                    <form:input path="credit" cssClass="input_txt w_209"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>账号</b></td>
                <td class="td2">
                    <form:input path="bankcode" cssClass="input_txt w_209"/>
                </td>
                <td class="td1"><b>上年研究开发经费投入</b></td>
                <td class="td2">
                    <form:input path="funding" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>上年度营业收入(万元)</b></td>
                <td class="td2">
                    <form:input path="lastincome" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>上年度缴税总额(万元)</b></td>
                <td class="td2">
                    <form:input path="lasttexes" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>上年度创汇(万美元)</b></td>
                <td class="td2">
                    <form:input path="lastexchange" cssClass="input_txt w_209" onkeyup="javascript:RepNumber(this)"/>
                </td>
                <td class="td1"><b>员工总数</b></td>
                <td class="td2">
                    <form:input path="staffcount" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>企业类型</b></td>
                <td class="td2">
                    <form:input path="corptype" cssClass="input_txt w_209"/>
                </td>
                <td class="td1"><b>已有成果数</b></td>
                <td class="td2">
                    <form:input path="resultcount" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>已转让成果数</b></td>
                <td class="td2">
                    <form:input path="passresult" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
                </td>
                <td class="td1"><b>企业登记类型</b></td>
                <td class="td2">
                    <form:input path="regtype" cssClass="input_txt w_209"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>企业性质</b></td>
                <td class="td2">
                    <form:input path="corpcharacter" cssClass="input_txt w_209"/>
                </td>
                <td class="td1"><b>企业特性</b></td>
                <td class="td2">
                    <form:input path="corpnature" cssClass="input_txt w_209"/>
                </td>
            </tr>
        </table>
        <div class="an">
            <button type="button" onclick="doCorp1Save();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    function doCorp1Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=corp1&op=g";
    }

    function addRowHolder() {
        holderrow = $("#holdertable").find("tr:gt(1)").length;
        var rowq = "market" + holderrow;
        var rowe = "outboard" + holderrow;
        var strinfo="";
        strinfo+="<tr>";
        strinfo+="<td><input type='text'  class='w_90' name='cxshareholdersList["+holderrow+"].name'/></td>";
        strinfo+="<td><input type='text' class='w_90'  name='cxshareholdersList["+holderrow+"].investstion'/></td>";
        strinfo+="<td><input type='text' class='w_90'  name='cxshareholdersList["+holderrow+"].cardno'/></td>";
        strinfo+="<td><input type='text' class='hidePannel' name='cxshareholdersList["+holderrow+"].isMarket'/><input type='radio' name='"+rowq+"' value='1'>是</input><input type='radio' name='"+rowq+"' value='0'>否</input></td>";
        strinfo+="<td><input type='text' class='hidePannel' name='cxshareholdersList["+holderrow+"].isOutboard'/><input type='radio' name='"+rowe+"' value='1'>是</input><input type='radio' name='"+rowe+"' value='0'>否</input></td>";
        strinfo+="<td><input type='text' onkeyup='javascript:RepNumber(this)' class='w_90' name='cxshareholdersList["+holderrow+"].occupies'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxshareholdersList["+holderrow+"].investtype'/></td>";
        strinfo+="</td>";

        holderrow++;
        $("#holdertable").append(strinfo);
    }
    function delRowHolder(){
        var flag=false;
        $("#holdertable").find("tr:gt(1)").each(function(index,item){
            if($(item).hasClass("backChoose")) {
                $(item).remove();
                flag=true;
            }
        });
        if(!flag){
            msg("请选择要删除的行");
        }
    }


    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);


        //部分数据的绑定    修改的时候如果没数据就绑定，有数据的不绑定
        var corp="${corp}";
        if(!(corp==null|| corp.length==0)){
            if($("#corpname").val().length==0)
                $("#corpname").val("${corp.unitName}");
            if($("#regDate").val().length==0)
                $("#regDate").val(formatDate("${corp.regDate}"));
            if($("#regCapital").val().length==0)
                $("#regCapital").val(formatDecimal("${corp.capital}",2));
            if($("#dbname").val().length==0)
                $("#dbname").val("${corp.representative}");
            if($("#lxname").val().length==0)
                 $("#lxname").val("${corp.contact}");
        }
    }

    function formatDecimal(cap,num){
        return cap.substr(0,cap.indexOf(".")+parseInt(num)+1);
    }

    function formatDate(date){
        var t="";
        if(date!=""||date!=null){
            t=date.split(" ")[0];
        }
        return t;
    }


    $(function(){
        init_page();

        $("#holdertable").on("click","tr:gt(1)",function(){
            $(this).addClass("backChoose") ;
            $(this).siblings().removeClass("backChoose");
        });

        $("#holdertable").on("click","input[type='radio']",function(){
            var v=$(this).val();
            $(this).parent().find("input").each(function(index,item){
                if($(item).hasClass("hidePannel")) {
                    $(item).val(v);
                }
            });
        });
    });


</script>

</body>
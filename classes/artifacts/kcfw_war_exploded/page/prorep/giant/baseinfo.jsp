<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="BaseInfoSave.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>企业基本情况<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <form:hidden path="corp.id"/>
        <form:hidden path="status"/>
        <form:hidden path="batch.id"/>
        <tr>
            <td class="td1" width="12%"><b>企业名称</b></td>
            <td class="td2" colspan="3" width="30%">
                <form:input path="corpname" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="12%"><b>注册地行政区划</b></td>
            <td class="td2" colspan="3" width="30%">
                <form:input path="region" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>企业代码</b></td>
            <td class="td2" colspan="3">
                <form:input path="corpcode" cssClass="input_txt w_209"/>
            </td>
            <td class="td1"><b>电子邮箱</b></td>
            <td class="td2" colspan="3">
                <form:input path="email" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>通讯地址</b></td>
            <td class="td2" colspan="3">
                <form:input path="address" cssClass="input_txt w_209"/>
            </td>
            <td class="td1"><b>邮编</b></td>
            <td class="td2" colspan="3">
                <form:input path="postcode" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" rowspan="2"><b>企业法人代表情况</b></td>
            <td class="td3" width="8%">
                <b>姓名</b>
            </td>
            <td class="td3" width="8%"><b>性别</b></td>
            <td class="td3" width="16%"><b><form:radiobuttons items="${lookups_ZJLX}" path="certifyType"  itemLabel="lName" itemValue="lCode"/></b></td>
            <td class="td3" width="10%"><b>最高学历</b></td>
            <td class="td3" width="10%"><b>任现职时间</b></td>
            <td class="td3" width="10%"><b>手机</b></td>
        </tr>
        <tr>
            <td class="td2"><form:input path="legpersonname" cssClass="input_txt w_109"/></td>
            <td class="td2">
                <form:radiobutton path="legpersongender" value="1"/>男
                <form:radiobutton path="legpersongender" value="0"/>女
            </td>
            <td class="td2"><form:input path="certifyCode" cssClass="input_txt w_150"/></td>
            <td class="td2"><form:input path="eduLevel" cssClass="input_txt w_109"/></td>
            <td class="td2"><form:input path="positiontime" cssClass="input_txt w_109"/></td>
            <td class="td2"><form:input path="phone" cssClass="input_txt w_109"/></td>
        </tr>
        <tr>
            <td class="td1"><b>联系人</b></td>
            <td class="td2">
                <form:input path="contact" cssClass="input_txt w_109"/>
            </td>
            <td class="td1"><b>电话</b></td>
            <td class="td2">
                <form:input path="contactnum" cssClass="input_txt w_150"/>
            </td>
            <td class="td1"><b>传真</b></td>
            <td class="td2" colspan="2">
                <form:input path="fax" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>科研部门电子邮件</b></td>
            <td class="td2" colspan="3">
                <form:input path="kyEmail" cssClass="input_txt w_209"/>
            </td>
            <td class="td1"><b>财务部门电子邮件</b></td>
            <td class="td2" colspan="2">
                <form:input path="cwEmail" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>开户银行</b></td>
            <td class="td2" colspan="3">
                <form:input path="bankname" cssClass="input_txt w_209"/>
            </td>
            <td class="td1"><b>开户名</b></td>
            <td class="td2" colspan="2">
                <form:input path="bankusername" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>账号</b></td>
            <td class="td2" colspan="6">
                <form:input path="bankusercode" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>单位隶属</b></td>
            <td class="td2" colspan="6">
                <form:radiobuttons items="${lookups_DWLS}" path="belong"  itemLabel="lName" itemValue="lCode"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>注册登记类型</b></td>
            <td class="td2" colspan="6">
                <%--<form:checkboxes  items="${lookups_DJLX}" path="regType"  itemLabel="lName" itemValue="lCode"/>--%>
                <form:radiobuttons items="${lookups_DJLX}" path="regType"  itemLabel="lName" itemValue="lCode"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>单位职工总数</b></td>
            <td class="td2">
                <form:input path="staffs" cssClass="input_txt w_109" onkeyup="javascript:RegInt(this)"/>人
            </td>
            <td class="td1"><b>大专以上</b></td>
            <td class="td2">
                <form:input path="juniors" cssClass="input_txt w_109" onkeyup="javascript:RegInt(this)"/>人
            </td>
            <td class="td1"><b>研究开发</b></td>
            <td class="td2" colspan="2">
                <form:input path="researchs" cssClass="input_txt w_109" onkeyup="javascript:RegInt(this)"/>人
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>中层以上管理人数</b></td>
            <td class="td2" colspan="3">
                <form:input path="midmanagers" cssClass="input_txt w_109" onkeyup="javascript:RegInt(this)"/>人
            </td>
            <td class="td1" colspan="1"><b>其中大学本科以上人员数</b></td>
            <td class="td2" colspan="2">
                <form:input path="degrees" cssClass="input_txt w_109" onkeyup="javascript:RegInt(this)"/>人
            </td>
        </tr>
        <tr>
            <td colspan="7" class="td3"><b>企业上年末财务情况，新企业填写申报前一月的财务情况</b></td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>企业注册资金</b></td>
            <td class="td2" colspan="3">
                <form:input path="regCapital" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
            <td class="td1" colspan="1"><b>其中外资（含港澳台）比例</b></td>
            <td class="td2" colspan="2">
                <form:input path="foreignperct" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>%
            </td>
        </tr>
        <tr>
            <td class="td1"><b>企业注册时间</b></td>
            <td class="td2" colspan="6">
                <form:input path="regDate" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>企业总收入</b></td>
            <td class="td2" colspan="3">
                <form:input path="income" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
            <td class="td1" colspan="1"><b>企业净利润</b></td>
            <td class="td2" colspan="2">
                <form:input path="profits" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>企业销售收入</b></td>
            <td class="td2" colspan="3">
                <form:input path="saleprofits" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
            <td class="td1" colspan="1"><b>企业创汇总额</b></td>
            <td class="td2" colspan="2">
                <form:input path="exchangeprofits" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万美元
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>总资产</b></td>
            <td class="td2" colspan="3">
                <form:input path="totalcapital" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
            <td class="td1" colspan="1"><b>总负债</b></td>
            <td class="td2" colspan="2">
                <form:input path="totalliability" cssClass="input_txt w_150" onkeyup="javascript:RepNumber(this)"/>万元
            </td>
        </tr>
        <tr>
            <td class="td1"><b>企业特性(多选,最多填5项)</b></td>
            <td class="td2" colspan="6">
                <form:checkboxes  items="${lookups_QYTX}" path="corptype"  itemLabel="lName" itemValue="lCode"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>单位需要说明的问题</b></td>
            <td class="td2" colspan="6">
                <form:textarea path="additions" cssClass="input_txt" cols="90" rows="4"/>
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>是否是科技小巨人培育已验收合格企业</b></td>
            <td class="td2" colspan="2">
                <form:radiobutton path="isgiant" value="1"/>是
                <form:radiobutton path="isgiant" value="0"/>否
            </td>
            <td class="td1" colspan="1"><b>项目标号</b></td>
            <td class="td2" colspan="2">
                <form:input path="giantcode" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="2"><b>是否是科技型中小企业技术创新资金支持过的企业</b></td>
            <td class="td2" colspan="2">
                <form:radiobutton path="istech" value="1"/>是
                <form:radiobutton path="istech" value="0"/>否
            </td>
            <td class="td1" colspan="1"><b>项目标号</b></td>
            <td class="td2" colspan="2">
                <form:input path="techcode" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>所属行业</b></td>
            <td class="td2" colspan="6">
                <form:input path="subordinate" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" rowspan="6"><b>企业知识产权情况（所列情况需提供相关附件证明）</b></td>
            <td class="td1" colspan="1"><b>已获专利授权数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].patentednum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>其中发明专利数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].inventnum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
        </tr>
        <tr>
            <td class="td1" colspan="1"><b>正在申请专利数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].applynum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>其中发明专利数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].apinventnum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>

        </tr>
        <tr>
            <td class="td1" colspan="1"><b>已获软件版权数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].softnum" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>已获集成电路布图设计数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].graph" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>

        </tr>
        <tr>
            <td class="td1" colspan="1"><b>有效注册商标量</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].marks" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>著名商标或驰名商标量</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].famousmarks" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>

        </tr>
        <tr>
            <td class="td1" colspan="1"><b>国家标准数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].standcount" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>行业标准数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].profstand" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>

        </tr>
        <tr>
            <td class="td1" colspan="1"><b>企业标准数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].corpstand" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>
            <td class="td1" colspan="1"><b>专有技术数</b></td>
            <td class="td2" colspan="2">
                <form:input path="patentList[0].proprietary" cssClass="input_txt w_209" onkeyup="javascript:RegInt(this)"/>
            </td>

        </tr>
        <tr>
            <td class="td1"><b>企业知识产权情况描述（所列情况需提供相关附件证明）</b></td>
            <td class="td2" colspan="6">
                <form:textarea path="ittelli" cssClass="input_txt" cols="90" rows="4"/>
            </td>
        </tr>
        <tr>
            <td colspan="7" class="td3"><b>主要股东及所占股权比例（注：企业的股权比例必须100％填满。对于自然人股东过多的企业，填写股份较大的股东，其余小股东请合并起来填写。）</b></td>
        </tr>

        <tr>
            <td colspan="7">
                <table id="holdertable"  class="table_04">
                    <tr style="background: #daebfd; border:1px solid skyblue; ">
                        <td colspan="6">
                            <div style="float: left;">
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowHolder()">添加</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowHolder()">删除</a>
                                <%--<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-save" onclick="saveRowHolder()">保存</a>--%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th width="10%">序号</th>
                        <th width="15%">股东名称（全称）</th>
                        <th  width="15%">是否上市公司</th>
                        <th width="20%">是否境外公司或外籍</th>
                        <th width="15%">所占股份（%）</th>
                        <th width="15%">投资方式</th>
                     </tr>
                    <c:forEach items="${bean.shareholderList}" var="item" varStatus="i">
                        <tr>
                           <td><input type="text" onkeyup="javascript:RegInt(this)" class='w_109' name="shareholderList[${i.index}].seq" value="${item.seq}"/></td>
                            <td><input type="text" class='w_150' name="shareholderList[${i.index}].name" value="${item.name}"/></td>
                            <td>
                                <input class="hidePannel" name="shareholderList[${i.index}].isMarket" value="${item.isMarket}"/>
                                <c:if test="${item.isMarket}">
                                    <input name="market${i.index}" type="radio" value="1" checked="checked">是</input>
                                    <input name="market${i.index}" type="radio" value="0">否</input>
                                </c:if>
                                <c:if test="${!item.isMarket}">
                                    <input name="market${i.index}" type="radio" value="1">是</input>
                                    <input name="market${i.index}" type="radio" value="0" checked="checked">否</input>
                                </c:if>
                            </td>
                            <td>
                                <input class="hidePannel" name="shareholderList[${i.index}].isOutboard" value="${item.isOutboard}"/>
                                <c:choose>
                                    <c:when test="${item.isOutboard eq 'overseas'}">
                                        <input name="outboard${i.index}" type="radio" value="overseas" checked="checked">境外</input>
                                        <input name="outboard${i.index}" type="radio" value="foreignnation">外籍</input>
                                        <input name="outboard${i.index}" type="radio" value="notoverseas">否</input>
                                    </c:when>
                                    <c:when test="${item.isOutboard eq 'foreignnation'}">
                                        <input name="outboard${i.index}" type="radio" value="overseas" >境外</input>
                                        <input name="outboard${i.index}" type="radio" value="foreignnation" checked="checked">外籍</input>
                                        <input name="outboard${i.index}" type="radio" value="notoverseas">否</input>
                                    </c:when>
                                    <c:otherwise>
                                        <input name="outboard${i.index}" type="radio" value="overseas" >境外</input>
                                        <input name="outboard${i.index}" type="radio" value="foreignnation">外籍</input>
                                        <input name="outboard${i.index}" type="radio" value="notoverseas"  checked="checked">否</input>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><input type="text" onkeyup="javascript:RepNumber(this)" class='w_150' name="shareholderList[${i.index}].occupies" value="${item.occupies}"/></td>
                            <td><input type="text" class='w_150' name="shareholderList[${i.index}].investtype" value="${item.investtype}"/></td>

                         </tr>

                    </c:forEach>


                 </table>

            </td>
        </tr>

        <tr>
            <td class="td1"><b>中文关键词</b></td>
            <td class="td2" colspan="6">
                <form:textarea path="chkeyword" cssClass="input_txt" cols="90" rows="3"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>英文关键词</b></td>
            <td class="td2" colspan="6">
                <form:textarea path="enkeyword" cssClass="input_txt" cols="90" rows="3"/>
            </td>
        </tr>
        <tr>
            <td class="td1"><b>中文摘要(限400字)</b></td>
            <td class="td2" colspan="6">
                <form:textarea path="strabstract" cssClass="input_txt" cols="90" rows="4"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述主要产品、经营业绩、行业中的地位与竞争优势</b></td>
        </tr>
        <tr>
            <td class="td2" colspan="7">
                <form:textarea path="advantage" cssClass="input_txt" cols="140" rows="5"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述组织结构、领军人物、管理团队（主要负责人经历与业绩等）</b></td>
        </tr>
        <tr>
            <td class="td2" colspan="7">
                <form:textarea path="leader" cssClass="input_txt" cols="140" rows="5"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述企业创新能力建设情况（已掌握的关键技术创新或商业模式创新，创新机制和创新硬件建设，研发团队，近三年重点创新项目开发及其新产品上市情况，承担国家或地方科研项目等）</b></td>
        </tr>
        <tr>
            <td class="td2" colspan="7">
                <form:textarea path="innovation" cssClass="input_txt" cols="140" rows="6"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述企业现有生产经营管理及相关制度化情况</b></td>
        </tr>
        <tr>
            <td class="td2" colspan="7">
                <form:textarea path="relevantsys" cssClass="input_txt" cols="140" rows="5"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述企业发展的重要阶段</b></td>
        </tr>
        <tr>
            <td class="td2" colspan="7">
                <form:textarea path="stage" cssClass="input_txt" cols="140" rows="5"/>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="7"><b>简述今后发展思路（主要描述企业提高核心竞争力和可持续发展能力的思路，包括：创新模式：以产品研发创新为主，或运用新技术、新业态、新模式实现企业或产品转型；创新途径：企业创新国际化、产学研长期战略合作、产学研项目合作、技术转移、引进消化吸收、留学生自主技术、企业自主开发等；创新激励机制；企业发展规划和技术路线图制定情况；吸纳融投资情况，有无上市计划等）</b></td>
        </tr>
        <tr>
             <td class="td2" colspan="7">
                <form:textarea path="develop" cssClass="input_txt"  cols="140" rows="6"/>
            </td>
        </tr>
     </table>
        <div class="an">
            <button type="button" onclick="doBaseInfoSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>

    </form:form>

</div>
<script>
    var holderParas={
        seq:null,
        name:null,
        isMarket:null,
        isOutboard:null,
        occupies:null,
        investtype:null
    };
    var holderrow=0;

     function addRowHolder(){
         holderrow=$("#holdertable").find("tr:gt(1)").length;
         var rowq="market"+holderrow;
         var rowe="outboard"+holderrow;
        var strinfo="";
         strinfo+="<tr>";
         strinfo+="<td><input type='text' onkeyup='javascript:RegInt(this)' class='w_109' name='shareholderList["+holderrow+"].seq'/></td>";
         strinfo+="<td><input type='text' class='w_150'  name='shareholderList["+holderrow+"].name'/></td>";
         strinfo+="<td><input type='text' class='hidePannel' name='shareholderList["+holderrow+"].isMarket'/><input type='radio' name='"+rowq+"' value='1'>是</input><input type='radio' name='"+rowq+"' value='0'>否</input></td>";
         strinfo+="<td><input type='text' class='hidePannel' name='shareholderList["+holderrow+"].isOutboard'/><input type='radio' name='"+rowe+"' value='overseas'>境外</input><input type='radio'  name='"+rowe+"' value='foreignnation'>外籍</input><input type='radio'  name='"+rowe+"' value='notoverseas'>否</input></td>";
         strinfo+="<td><input type='text' onkeyup='javascript:RepNumber(this)' class='w_150' name='shareholderList["+holderrow+"].occupies'/></td>";
         strinfo+="<td><input type='text' class='w_150' name='shareholderList["+holderrow+"].investtype'/></td>";
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


    function doBaseInfoSave(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/GiantReport/input.htm?op=g";

    }

    function init_page(){

        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);


        //字符串绑定
        var strtype="${bean.corptype}";
        if(strtype.length>0){
            var count=strtype.split(",").length;
            for(var i=0;i<count;i++){
                var sid=strtype.split(",")[i];
                $("input[type='checkbox'][name='corptype']").each(function(index,item){
                    if($(item).val()==sid){
                        $(item).attr("checked",'checked');
                    }
                });
            }
        }



        //部分数据的绑定
       var corp="${corp}";
        if(!(corp==null|| corp.length==0)){
             $("#corpname").val("${corp.unitName}");
            $("#corpcode").val("${corp.orgCode}");
            $("#email").val("${corp.email}");
            $("#address").val("${corp.registerAddress}");
            $("#postcode").val("${corp.postcode}");
            $("#legpersonname").val("${corp.representative}");
            $("#contact").val("${corp.contact}");
            $("#contactnum").val("${corp.tel}");
            $("#regCapital").val(formatDecimal("${corp.capital}",2));
            $("#regDate").val(formatDate("${corp.regDate}"));
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

    }) ;

</script>

</body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
<form:form action="Proj1Save.htm" method="post" modelAttribute="tech" id="form">
    <c:import url="../../../include/pageParams.jsp"/>
    <c:import url="../../../include/bizEntity.jsp"/>
    <a href="javascript:void(0);" class="table_head">>>项目基本信息<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td1" width="16%"><b>项目名称</b></td>
            <td class="td2" colspan="3">
                <form:input path="name" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>申请基金路线</b></td>
            <td class="td2" colspan="3">
                <form:input path="applyway" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>申报基金类型</b></td>
            <td class="td2">
                <form:input path="applytype" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="16%"><b>基金支持方式</b></td>
            <td class="td2">
                <form:input path="supporttype" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>是否留学人员创办企业</b></td>
            <td class="td2">
                <form:radiobutton path="isTurtlefound" value="1"/>是
                <form:radiobutton path="isTurtlefound" value="0"/>否
            </td>
            <td class="td1" width="16%"><b>是否软件类项目</b></td>
            <td class="td2">
                <form:radiobutton path="isSoftwpro" value="1"/>是
                <form:radiobutton path="isSoftwpro" value="0"/>否
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>是否高新技术服务业</b></td>
            <td class="td2">
                <form:radiobutton path="isHightech" value="1"/>是
                <form:radiobutton path="isHightech" value="0"/>否
            </td>
            <td class="td1" width="16%"><b>是否大学生创业</b></td>
            <td class="td2">
                <form:radiobutton path="isCollegefound" value="1"/>是
                <form:radiobutton path="isCollegefound" value="0"/>否
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>是否科技企业孵化器内企业</b></td>
            <td class="td2">
                <form:radiobutton path="isIncubate" value="1"/>是
                <form:radiobutton path="isIncubate" value="0"/>否
            </td>
            <td class="td1" width="16%"><b>所在孵化器名称</b></td>
            <td class="td2">
                <form:input path="incubatename" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>起始时间</b></td>
            <td class="td2">
                <form:input path="startDate" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="16%"><b>计划完成时间</b></td>
            <td class="td2">
                <form:input path="endDate" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>所属领域</b></td>
            <td class="td2" colspan="3">
                <form:input path="domain" cssClass="input_txt w_440"/>
            </td>
        </tr>
    </table>

    <a href="javascript:void(0);" class="table_head" style="margin-top: 12px;">>>项目技术传承<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td1" width="40%"><b>项目技术来源</b></td>
            <td class="td2">
                <form:select path="tectobtain"  cssClass="input_txt w_209">
                    <form:option value="" label="--请选择--"/>
                    <c:forEach items="${lookups_JSLY}" var="item">
                        <form:option value="${item.lCode}">${item.lName}</form:option>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="2">与项目相关的知识产权情况</td>
        </tr>
        <tr>
            <td class="td4" colspan="2">
                <table id="holdertable"  class="table_04">
                    <tr style="background: #daebfd; border:1px solid skyblue; ">
                        <td colspan="8">
                            <div style="float: left;">
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowHolder()">添加</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowHolder()">删除</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th width="12%">专利号码</th>
                        <th width="12%">专利名称</th>
                        <th width="12%">专利类型</th>
                        <th width="12%">专利进展情况</th>
                        <th width="12%">专利范围</th>
                        <th width="12%">专利权人名称</th>
                        <th width="12%">专利权人性质</th>
                        <th width="12%">专利权人与项目单位关系</th>
                    </tr>
                    <c:forEach items="${tech.cxpatentList}" var="item" varStatus="i">
                            <tr>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].patentnum" value="${item.patentnum}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].patentname" value="${item.patentname}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].patenttype" value="${item.patenttype}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].patentprogress" value="${item.patentprogress}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].scope" value="${item.scope}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].ownername" value="${item.ownername}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].ownernature" value="${item.ownernature}"/></td>
                                <td><input type="text" class='w_90' name="cxpatentList[${i.index}].relationship" value="${item.relationship}"/></td>
                            </tr>
                    </c:forEach>


                 </table>
            </td>
        </tr>
        <tr>
            <td class="td3" colspan="2">其他知识产权情况</td>
        </tr>
        <tr>
            <td class="td4" colspan="2">
                <form:textarea path="intellrights" cssClass="input_txt" cols="110" rows="7"/>
            </td>
        </tr>
    </table>


    <a href="javascript:void(0);" class="table_head" style="margin-top: 12px;">>>项目负责人及技术骨干<span onclick="movePanel('panel1')"></span></a>
    <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
        <tr>
            <td class="td3" colspan="4"><b>项目负责人基本情况</b></td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>姓名</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].name" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="16%"><b>身份证件号码</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].card" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>学历</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].level" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="16%"><b>所学专业</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].major" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>目前与企业之间的关系</b></td>
            <td class="td2">
                <form:select path="cxprincipalList[0].relationship"  cssClass="input_txt w_209">
                    <form:option value="" label="--请选择--"/>
                    <c:forEach items="${lookups_QYGX}" var="item">
                        <form:option value="${item.lCode}">${item.lName}</form:option>
                    </c:forEach>
                </form:select>


            </td>
            <td class="td1" width="16%"><b>毕业学校</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].college" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>手机</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].phone" cssClass="input_txt w_209"/>
            </td>
            <td class="td1" width="16%"><b>Email</b></td>
            <td class="td2">
                <form:input path="cxprincipalList[0].email" cssClass="input_txt w_209"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>通讯地址</b></td>
            <td class="td2" colspan="3">
                <form:input path="cxprincipalList[0].address" cssClass="input_txt w_440"/>
            </td>
        </tr>
        <tr>
            <td class="td1" width="16%"><b>自我陈诉(经历)</b></td>
            <td class="td2" colspan="3">
                <form:textarea path="cxprincipalList[0].introduction" cssClass="input_txt" cols="100" rows="3"/>
                <form:hidden path="cxprincipalList[0].type" value="负责人"></form:hidden>
            </td>
        </tr>

        <tr>
            <td class="td3" colspan="4"><b>项目技术骨干基本情况</b></td>
        </tr>
        <tr>
            <td class="td4" colspan="4">
                <table id="TechUsertable"  class="table_list">
                    <tr style="background: #daebfd; border:1px solid skyblue; ">
                        <td colspan="4">
                            <div style="float: left;">
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-add" onclick="addRowTechUser()">添加</a>
                                <a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-remove" onclick="delRowTechUser()">删除</a>
                            </div>
                        </td>
                    </tr>
                    <c:forEach items="${tech.cxprincipalList}" var="item" varStatus="i">
                        <c:if test="${i.index!=0}">
                        <tr>
                            <td colspan="4">
                                <table class="table_list">
                                    <tr>
                                        <td class="td1" width="20%"><b>姓名</b></td>
                                        <td class="td2"  width="30%">
                                            <form:input path="cxprincipalList[${i.index}].name" cssClass="input_txt w_209"/>
                                        </td>
                                        <td class="td1" width="15%"><b>身份证件号码</b></td>
                                        <td class="td2" width="30%">
                                            <form:input path="cxprincipalList[${i.index}].card" cssClass="input_txt w_209"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td1"><b>学历</b></td>
                                        <td class="td2">
                                            <form:input path="cxprincipalList[${i.index}].level" cssClass="input_txt w_209"/>
                                        </td>
                                        <td class="td1"><b>所学专业</b></td>
                                        <td class="td2">
                                            <form:input path="cxprincipalList[${i.index}].major" cssClass="input_txt w_209"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td1"><b>目前与企业之间的关系</b></td>
                                        <td class="td2">
                                            <form:select path="cxprincipalList[${i.index}].relationship"  cssClass="input_txt w_209">
                                                <form:option value="" label="--请选择--"/>
                                                <c:forEach items="${lookups_QYGX}" var="item">
                                                    <form:option value="${item.lCode}">${item.lName}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </td>
                                        <td class="td1"><b>毕业学校</b></td>
                                        <td class="td2">
                                            <form:input path="cxprincipalList[${i.index}].college" cssClass="input_txt w_209"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td1"><b>手机</b></td>
                                        <td class="td2">
                                            <form:input path="cxprincipalList[${i.index}].phone" cssClass="input_txt w_209"/>
                                        </td>
                                        <td class="td1"><b>Email</b></td>
                                        <td class="td2">
                                            <form:input path="cxprincipalList[${i.index}].email" cssClass="input_txt w_209"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td1"><b>通讯地址</b></td>
                                        <td class="td2" colspan="3">
                                            <form:input path="cxprincipalList[${i.index}].address" cssClass="input_txt w_440"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td1"><b>自我陈诉(经历)</b></td>
                                        <td class="td2" colspan="3">
                                            <form:textarea path="cxprincipalList[${i.index}].introduction" cssClass="input_txt" cols="70" rows="3"/>
                                            <form:hidden path="cxprincipalList[${i.index}].type" value="技术人"></form:hidden>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </c:if>
                    </c:forEach>
                </table>
            </td>
        </tr>

    </table>

    <div class="an">
        <button type="button" onclick="doProj1Save();" class="ico_tmpSave">
            <fmt:message key="sys.title.save"/></button>
        <button type="button" onclick="history.back();" class="ico_return">
            <fmt:message key="sys.title.return"/></button>
    </div>
</form:form>
</div>
<script>
    function doProj1Save(){
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InnovReport/input.htm?cxCaterotyCode=proj1&op=g";
    }


    function addRowHolder() {
        var holderrow = $("#holdertable").find("tr:gt(1)").length;
        var strinfo="";
        strinfo+="<tr>";
        strinfo+="<td><input type='text'  class='w_90' name='cxpatentList["+holderrow+"].patentnum'/></td>";
        strinfo+="<td><input type='text' class='w_90'  name='cxpatentList["+holderrow+"].patentname'/></td>";
        strinfo+="<td><input type='text' class='w_90'  name='cxpatentList["+holderrow+"].patenttype'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxpatentList["+holderrow+"].patentprogress'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxpatentList["+holderrow+"].scope'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxpatentList["+holderrow+"].ownername'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxpatentList["+holderrow+"].ownernature'/></td>";
        strinfo+="<td><input type='text' class='w_90' name='cxpatentList["+holderrow+"].relationship'/></td>";
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


    function addRowTechUser(){
        var holderrow = $("#TechUsertable").find("tr:gt(0)").length+1;
        var strinfo="<tr><td colspan='4'><table class='table_list'>";
        strinfo+="<tr><td class='td1' width='20%'><b>姓名</b></td><td class='td2' width='30%'><input type='text' name='cxprincipalList["+holderrow+"].name' class='input_txt w_209'/></td>";
        strinfo+="<td class='td1' width='15%'><b>身份证件号码</b></td><td class='td2' width='30%'><input type='text' name='cxprincipalList["+holderrow+"].card' class='input_txt w_209'/></td></tr>";
        strinfo+="<tr><td class='td1'><b>学历</b></td><td class='td2'><input type='text' name='cxprincipalList["+holderrow+"].level' class='input_txt w_209'/></td>";
        strinfo+="<td class='td1'><b>专业</b></td><td class='td2'><input type='text' name='cxprincipalList["+holderrow+"].major' class='input_txt w_209'/></td></tr>";
        strinfo+="<tr><td class='td1'><b>目前与企业之间的关系</b></td><td class='td2'><select name='cxprincipalList["+holderrow+"].relationship' class='input_txt w_209'><option value =''>--请选择--</option><option value ='fulltime'>全职</option><option value ='parttime'>兼职</option><option value ='stockholder'>股东</option><option value ='nonstockholder'>非股东</option></select></td>";
        strinfo+="<td class='td1'><b>毕业学校</b></td><td class='td2'><input type='text' name='cxprincipalList["+holderrow+"].college' class='input_txt w_209'/></td></tr>";
        strinfo+="<tr><td class='td1'><b>手机</b></td><td class='td2'><input type='text' name='cxprincipalList["+holderrow+"].phone' class='input_txt w_209'/></td>";
        strinfo+="<td class='td1'><b>Email</b></td><td class='td2'><input type='text' name='cxprincipalList["+holderrow+"].email' class='input_txt w_209'/></td></tr>";
        strinfo+="<tr><td class='td1'><b>通讯地址</b></td><td class='td2' colspan='3'><input type='text' name='cxprincipalList["+holderrow+"].address' class='input_txt w_440'/></td></tr>";
        strinfo+="<tr><td class='td1'><b>自我陈诉(经历)</b></td><td class='td2' colspan='3'><textarea name='cxprincipalList["+holderrow+"].introduction' class='input_txt' cols='70' rows='3'/><input class='hidePannel' type='text' name='cxprincipalList["+holderrow+"].type' value='技术人'/></td></tr>";
        strinfo+="</table></td></tr>";
        holderrow++;
        $("#TechUsertable").append(strinfo);
    }

    function delRowTechUser(){
        var flag=false;
        $("#TechUsertable").find("tr:gt(0)").each(function(index,item){
            if($(item).hasClass("backChoose")) {
                $(item).remove();
                flag=true;
            }
        });
        if(!flag){
            msg("请选择要删除的行");
        }
    }

    $(function(){
        $("#holdertable").on("click","tr:gt(1)",function(){
            $(this).addClass("backChoose") ;
            $(this).siblings().removeClass("backChoose");
        });

        $("#TechUsertable").on("click","tr:gt(0)",function(){
            $(this).addClass("backChoose") ;
            $(this).siblings().removeClass("backChoose");
        });


        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"",hasmidExm);

    });


</script>

</body>
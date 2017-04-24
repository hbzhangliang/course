<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>

</head>
<body class="body_scroll">
<div class="tpspace">
    <form:form action="ReportSave.htm" method="post" modelAttribute="bean" id="form">
        <c:import url="../../../include/pageParams.jsp"/>
        <c:import url="../../../include/bizEntity.jsp"/>
        <a href="javascript:void(0);" class="table_head">>>单位情况表<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <form:hidden path="corporation.id"/>
            <form:hidden path="status"/>
            <form:hidden path="batch.id"/>

            <c:if test="${!empty bean.situation}">
                <form:hidden path="situation.id"/>
            </c:if>

            <tr>
                <td class="td1" width="12%"><b>企业名称</b></td>
                <td class="td2" colspan="3" width="40%">
                    <form:input path="corpname" cssClass="input_txt w_209"/>
                </td>
                <td class="td1" width="12%"><b>注册时间</b></td>
                <td class="td2" width="15%">
                    <form:input path="regDate" cssClass="input_txt w_150"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>注册地址</b></td>
                <td class="td2" colspan="3">
                    <form:input path="regAddress" cssClass="input_txt w_209"/>
                </td>
                <td class="td1"><b>统一的社会信用代码/税务登记号</b></td>
                <td class="td2">
                    <form:input path="creditNum" cssClass="input_txt w_150"/>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="2"><b>法定代表人</b></td>
                <td class="td3" width="12"><b>姓名</b></td>
                <td class="td3" width="10%"><b>性别</b></td>
                <td class="td3" width="15%" style="font-weight: bolder">
                    <form:radiobuttons items="${lookups_ZJLX}" path="fdtype"  itemLabel="lName" itemValue="lCode"/>
                </td>
                <td class="td3"><b>现任职务</b></td>
                <td class="td3"><b>手机</b></td>

            </tr>
            <tr>
                <td class="td4">
                    <form:input path="fdname" cssClass="input_txt w_109"/>
                </td>
                <td class="td4">
                    <form:select path="fdgender"  cssClass="input_txt w_109">
                        <form:option value="" label="--请选择--"/>
                        <form:option value="1">男</form:option>
                        <form:option value="0">女</form:option>
                    </form:select>
                </td>
                <td class="td4">
                    <form:input path="fdnum" cssClass="input_txt w_150"/>
                </td>
                <td class="td4">
                    <form:input path="fdposition" cssClass="input_txt w_150"/>
                </td>
                <td class="td4">
                    <form:input path="fdphone" cssClass="input_txt w_150"/>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="2"><b>项目负责人</b></td>
                <td class="td3" width="12"><b>姓名</b></td>
                <td class="td3" width="10%"><b>性别</b></td>
                <td class="td3" width="15%" style="font-weight: bolder">
                    <form:radiobuttons items="${lookups_ZJLX}" path="fztype"  itemLabel="lName" itemValue="lCode"/>
                </td>
                <td class="td3"><b>现任职务</b></td>
                <td class="td3"><b>手机</b></td>

            </tr>
            <tr>
                <td class="td4">
                    <form:input path="fzname" cssClass="input_txt w_109"/>
                </td>
                <td class="td4">
                    <form:select path="fzgender"  cssClass="input_txt w_109">
                        <form:option value="" label="--请选择--"/>
                        <form:option value="1">男</form:option>
                        <form:option value="0">女</form:option>
                    </form:select>
                </td>
                <td class="td4">
                    <form:input path="fznum" cssClass="input_txt w_150"/>
                </td>
                <td class="td4">
                    <form:input path="fzposition" cssClass="input_txt w_150"/>
                </td>
                <td class="td4">
                    <form:input path="fzphone" cssClass="input_txt w_150"/>
                </td>
            </tr>
            <tr>
                <td class="td1" rowspan="2"><b>项目联系人</b></td>
                <td class="td4" rowspan="2"><form:input path="lxname" cssClass="input_txt w_109"/></td>
                <td class="td1"><b>电话</b></td>
                <td class="td4"><form:input path="lxcall" cssClass="input_txt w_150"/></td>
                <td class="td1"><b>手机</b></td>
                <td class="td4"><form:input path="lxphone" cssClass="input_txt w_150"/></td>

            </tr>
            <tr>
                <td class="td1"><b>传真</b></td>
                <td class="td4"><form:input path="lxfax" cssClass="input_txt w_150"/></td>
                <td class="td1"><b>邮箱</b></td>
                <td class="td4"><form:input path="lxemail" cssClass="input_txt w_150"/></td>
            </tr>
            <tr>
                <td class="td3"><b>职工总数(人)</b></td>
                <td class="td3" colspan="2"><b>企业中层以上管理人员数(人)</b></td>
                <td class="td3" colspan="2"><b>大专以上科技人员数(人)</b></td>
                <td class="td3"><b>研究开发的科技人员数(人)</b></td>
            </tr>
            <tr>
                <td class="td4">
                    <form:input path="staffcount" cssClass="input_txt w_150"/>
                </td>
                <td class="td4" colspan="2">
                    <form:input path="midmanag" cssClass="input_txt w_150"/>
                </td>
                <td class="td4" colspan="2">
                    <form:input path="collegemanag" cssClass="input_txt w_150"/>
                </td>
                <td class="td4">
                    <form:input path="searchmanag" cssClass="input_txt w_150"/>
                </td>

            </tr>
            <tr>
                <td class="td1"><b>开户银行</b></td>
                <td class="td2" colspan="5"><form:input path="banksname" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td1"><b>账号</b></td>
                <td class="td2" colspan="2"><form:input path="bankscode" cssClass="input_txt w_209"/></td>
                <td class="td1"><b>企业信用评级及有效期</b></td>
                <td class="td2" colspan="2"><form:input path="creditlevel" cssClass="input_txt w_209"/></td>
            </tr>
            <tr>
                <td class="td1"><b>经济类型</b></td>
                <td class="td2" colspan="5">
                    <form:checkboxes  items="${lookups_DJLX}" path="economtype"  itemLabel="lName" itemValue="lCode"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>注册资本</b></td>
                <td class="td2" colspan="2"><form:input path="regcaptial" cssClass="input_txt w_209"/></td>
                <td class="td1"><b>其中外资（含港、澳、台）比例</b></td>
                <td class="td2" colspan="2"><form:input path="foreignper" cssClass="input_txt w_209"/>%</td>
            </tr>
            <tr>
                <td class="td1"><b>主要股东及所占股权比例（股权结构）</b></td>
                <td class="td2" colspan="5">
                    <form:textarea path="shareholder" cssClass="input_txt" cols="90" rows="5"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>高新技术企业</b></td>
                <td class="td2" colspan="2">
                    <form:radiobutton path="ishightech" value="1"/>是
                    <form:radiobutton path="ishightech" value="0"/>否
                </td>
                <td class="td1"><b>高新技术企业证书号</b></td>
                <td class="td2" colspan="2"><form:input path="hightechcode" cssClass="input_txt w_209"/></td>
            </tr>

         </table>

        <a href="javascript:void(0);" style="margin-top: 18px;" class="table_head">>>近三年财务统计<span onclick="movePanel('panel1')"></span></a>
        <a style="margin-left: 2%;color: red">*注：单位是万元,精确到两位小数</a>
        <table id="t_reportfinace"  class="table_02">
            <tr>
                <th width="12%">年份</th>
                <th class="hidePannel">年份</th>
                <th  width="15%">总收入</th>
                <th width="15%">销售收入</th>
                <th width="15%">缴税</th>
                <th width="15%">净利润</th>
                <th width="15%">负债总额</th>
                <th width="15%">资产总额</th>
            </tr>
            <tr>
                <td><b>${bean.xfFinances[0].chyear}</b></td>
                <td class="hidePannel"><input name="xfFinances[0].chyear" type="text" class="input_txt w_109" value='${bean.xfFinances[0].chyear}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].totalincome" type="text" class="input_txt w_109" value='${bean.xfFinances[0].totalincome}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].saleincome" type="text" class="input_txt w_109" value="${bean.xfFinances[0].saleincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].taxes" type="text" class="input_txt w_109" value="${bean.xfFinances[0].taxes}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].netincome" type="text" class="input_txt w_109" value="${bean.xfFinances[0].netincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].totalliab" type="text" class="input_txt w_109" value="${bean.xfFinances[0].totalliab}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[0].totalasset" type="text" class="input_txt w_109" value="${bean.xfFinances[0].totalasset}"/></td>
            </tr>
            <tr>
                <td><b>${bean.xfFinances[1].chyear}</b></td>
                <td class="hidePannel"><input name="xfFinances[1].chyear" type="text" class="input_txt w_109" value='${bean.xfFinances[1].chyear}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].totalincome" type="text" class="input_txt w_109" value='${bean.xfFinances[1].totalincome}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].saleincome" type="text" class="input_txt w_109" value="${bean.xfFinances[1].saleincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].taxes" type="text" class="input_txt w_109" value="${bean.xfFinances[1].taxes}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].netincome" type="text" class="input_txt w_109" value="${bean.xfFinances[1].netincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].totalliab" type="text" class="input_txt w_109" value="${bean.xfFinances[1].totalliab}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[1].totalasset" type="text" class="input_txt w_109" value="${bean.xfFinances[1].totalasset}"/></td>
            </tr>
            <tr>
                <td><b>${bean.xfFinances[2].chyear}</b></td>
                <td class="hidePannel"><input name="xfFinances[2].chyear" type="text" class="input_txt w_109" value='${bean.xfFinances[2].chyear}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].totalincome" type="text" class="input_txt w_109" value='${bean.xfFinances[2].totalincome}'/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].saleincome" type="text" class="input_txt w_109" value="${bean.xfFinances[2].saleincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].taxes" type="text" class="input_txt w_109" value="${bean.xfFinances[2].taxes}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].netincome" type="text" class="input_txt w_109" value="${bean.xfFinances[2].netincome}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].totalliab" type="text" class="input_txt w_109" value="${bean.xfFinances[2].totalliab}"/></td>
                <td><input onkeyup="javascript:RepNumber(this)" name="xfFinances[2].totalasset" type="text" class="input_txt w_109" value="${bean.xfFinances[2].totalasset}"/></td>
            </tr>

        </table>


        <div id="hiddensupoort" class="hidePannel">

        </div>

        <a href="javascript:void(0);" class="table_head">>>企业情况说明<span onclick="movePanel('panel1')"></span></a>
        <table border="0" cellspacing="0" cellpadding="0" class="table_list t_hs">
            <tr>
                <td class="td1" width="16%"><b>1.基本信息</b></td>
                <td class="td2" width="70%">
                    <form:textarea path="baseinfo" cssClass="input_txt" cols="90" rows="5"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>2.管理和技术团队信息</b></td>
                <td class="td2">
                    <form:textarea path="teaminfo" cssClass="input_txt" cols="90" rows="5"/>
                </td>
            </tr>
            <tr>
                <td class="td1"><b>3.2014年以来企业获得政府资助资金情况</b></td>
                <td class="td2">
                    <div style="margin-left:2%">
                        <table id="dg" class="easyui-datagrid" title="企业获政府资助资金情况" style="width:98%;height:auto;"
                               data-options="
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#tb',
                <%--url: 'datagrid_data1.json',--%>
                method: 'get',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit
            ">
                            <thead>
                            <tr>
                                <th data-options="field:'name',width:'22%',align:'center',editor:'textbox'">部门名称</th>
                                <th data-options="field:'chyear',width:'15%',align:'center',editor:'textbox'">获得年份</th>
                                <th data-options="field:'gtmoney',width:'16%',align:'center',editor:{type:'numberbox',options:{precision:2}}">获得金额</th>
                                <th data-options="field:'depart',width:'18%',align:'center',editor:'textbox'">立项部门</th>
                                <th data-options="field:'status',width:'22%',align:'center',editor:'textbox'">目前状况</th>
                            </tr>
                            </thead>
                        </table>
                        <div id="tb" style="margin-left: 15px; height:auto">
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">新增</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存</a>
                                <%--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">撤销</a>--%>
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="an">
            <button type="button" onclick="doReportSave();" class="ico_tmpSave">
                <fmt:message key="sys.title.save"/></button>
            <button type="button" onclick="history.back();" class="ico_return">
                <fmt:message key="sys.title.return"/></button>
        </div>
    </form:form>
</div>
<script>
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                $('#dg').datagrid('selectRow', index)
                        .datagrid('beginEdit', index);
                var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    $('#dg').datagrid('selectRow', editIndex);
                },0);
            }
        }
    }
    function onEndEdit(index, row){
        var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'name'
        });
        row.productname = $(ed.target).combobox('getText');
    }
    function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:''});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                    .datagrid('beginEdit', editIndex);
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
                .datagrid('deleteRow', editIndex);
        editIndex = undefined;
    }
    function accept(){
        if (endEditing()){
            $('#dg').datagrid('acceptChanges');
        }
    }
    var params={
        year:null
    }

    function init_page(){
        //状态的修改
        var strstatus="${bean.status}";
        var hasmidExm="${bean.batch.isHasMidExm}";//是否包含中期评估
        changePageStatus(strstatus,"report",hasmidExm);


        var dt=new Date();
        params.year= dt.getFullYear();

        if($("input[name='xfFinances[0].chyear']").val().length==0){
            //时间赋值    财务状况
            $("#t_reportfinace").find('tr:gt(0)').each(function(index,item){
                for(var i=0;i<3;i++){
                    if(index==i){
                        var stryear=(parseInt(params.year)-2+i).toString()+"年";
                        $(item).find('td:eq(0)').html("<b>"+stryear+"</b>");
                        $(item).find('td:eq(1)').find("input").val(stryear);
                    }
                }
            });
        }


        //字符串绑定
        var strfield="${bean.economtype}";
        if(strfield.length>0){
            var count=strfield.split(",").length;
            for(var i=0;i<count;i++){
                var sid=strfield.split(",")[i];
                $("input[type='checkbox'][name='economtype']").each(function(index,item){
                    if($(item).val()==sid){
                        $(item).attr("checked",'checked');
                    }
                });
            }
        }

        //其他领域的显示或隐藏



        //support数据绑定
        var sid="${bean.id}";
        if(sid!=null&&sid.length>0) {
            $.post(base + "/InfoReport/xfSupport/getSupportByProjId.htm?id=" + sid, function (data) {
                $('#dg').datagrid({data: data});
            }, "json");
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

    function getSupportDate(){
        accept();
        var d=$('#dg').datagrid('getRows');
        $("#hiddensupoort").html("");
        $.each(d,function(index,item){
            var str="<input name='xfSupports["+index+"].name' value='"+item.name+"'/>";
            str+="<input name='xfSupports["+index+"].chyear' value='"+item.chyear+"'/>";
            str+="<input name='xfSupports["+index+"].gtmoney' value='"+item.gtmoney+"'/>";
            str+="<input name='xfSupports["+index+"].depart' value='"+item.depart+"'/>";
            str+="<input name='xfSupports["+index+"].status' value='"+item.status+"'/>";
            $("#hiddensupoort").append(str);
        });
    }

    function doReportSave(){
        getSupportDate();
        doSubmit();
        parent.window.location.href=base+ "/deptReport/InfoReport/input.htm?op=g";
    }



    $(function(){
        init_page();

    });



</script>
</body>
</html>
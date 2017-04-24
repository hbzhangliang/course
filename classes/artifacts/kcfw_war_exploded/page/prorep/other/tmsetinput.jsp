<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_prorep.jsp" %>
</head>
<body>
<!--top start-->
<c:import url="../../../include/top.jsp"/>
<!--top end-->
<!--main start-->
<div class="main clearfix">
    <!--left start-->
    <div class="left" id="wrapper-250">
        <c:import url="../../../include/menu.jsp"/>
    </div>
    <div class="right clearfix">
        <!--bread_crumbs start-->
        <c:import url="../../../include/navigation.jsp"/>

        <form:form action="save.htm" method="post"  modelAttribute="bean"  id="form">
            <c:import url="../../../include/pageParams.jsp"/>
            <c:import url="../../../include/bizEntity.jsp"/>
            <a href="javascript:void(0);" class="table_head">>>项目申报各阶段时间设置<span onclick="movePanel('panel1')"></span></a>
            <table style="width: 95%;margin-left: auto;margin-right: auto" class="table_02">
                <tr>
                    <th width="11%">用户类型</th>
                    <th width="11%">提交申请时间</th>
                    <th width="11%">初审</th>
                    <th width="11%">专家评审</th>
                    <th width="11%">立项</th>
                    <th width="11%">申请中期评审</th>
                    <th width="11%">中期评审</th>
                    <th width="11%">申请验收</th>
                    <th width="11%">验收</th>
                </tr>
                <tr>
                    <td><b>企业</b></td><td>√</td><td></td><td></td> <td></td><td>√</td><td></td><td>√</td><td></td>
                </tr>
                <tr>
                    <td><b>初审人员</b></td><td></td><td>√</td><td></td> <td></td><td></td><td></td><td></td><td></td>
                </tr>
                <tr>
                    <td><b>评审专家</b></td><td></td><td></td><td>√</td> <td></td><td></td><td></td><td></td><td></td>
                </tr>
                <tr>
                    <td><b>科委方</b></td><td></td><td></td><td></td> <td>√</td><td></td><td>√</td><td></td><td>√</td>
                </tr>
            </table>

            <table cellspacing="0" cellpadding="0" style="border: 1px solid lightskyblue;width: 95%;margin: 12px auto;" class="table_list t_hs">
                <tr>
                    <td class="td1" width="12%"><b>年份</b></td>
                    <td class="td2">
                        <form:input path="chyear" cssClass="input_txt w_209"/>
                    </td>
                    <td class="td1" width="12%"><b>申报项目批次号</b></td>
                    <td class="td2">
                        <form:input path="chbatch" cssClass="input_txt w_209" />
                    </td>
                </tr>
                <tr>
                    <td class="td1" width="12%"><b>是否默认项</b></td>
                    <td class="td2">
                        <form:select path="isChoose"  cssClass="input_txt w_109" cssStyle="background: lightcoral">
                            <form:option value="" label="--请选择--"/>
                            <form:option value='1'>是</form:option>
                            <form:option value='0'>否</form:option>
                        </form:select>
                    </td>
                    <td class="td1" width="12%"><b>项目类别</b></td>
                    <td class="td2">
                        <form:select path="projtypecode"  cssClass="input_txt w_209">
                            <form:option value="" label="--请选择--"/>
                            <c:forEach items="${lookups_XMLB}" var="item">
                                <form:option value="${item.lCode}">${item.lName}</form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                </tr>
                </table>
            <table style="border: 1px solid lightskyblue;width: 95%;margin: 12px auto;" class="table_list t_hs">
                <tr>
                    <td class="td1" width="20%"><b>是否包含中期评估流程</b></td>
                    <td class="td2" width="50%">
                        <form:radiobutton path="isHasMidExm" value="1"/>包含
                        <form:radiobutton path="isHasMidExm" value="0"/>不包含
                    </td>
                </tr>
            </table>

        <table id="bacthDetail" style="width: 95%;margin-left: auto;margin-right: auto;margin-top: 15px;" class="table_02">
            <tr>
                <th width="11%">项目类型</th>
                <th width="11%">提交申请时间</th>
                <th width="11%">初审</th>
                <th width="11%">专家评审</th>
                <th width="11%">立项</th>
                <th width="11%">申请中期评审</th>
                <th width="11%">中期评审</th>
                <th width="11%">申请验收</th>
                <th width="11%">验收</th>
            </tr>
            <tr>
                <td rowspan="2"><b> <form:input path="projtypename" cssClass="input_txt w_90" /></b>

                </td>
                <td>开始时间<br/>
                    <form:input path="apply1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="trial1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="proff1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="setup1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="midapply1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="mid1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="exam1Date" cssClass="input_txt w_90" />
                </td>
                <td>开始时间<br/>
                    <form:input path="accept1Date" cssClass="input_txt w_90" />
                </td>
            </tr>
            <tr>
                <td>结束时间<br/>
                    <form:input path="apply2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="trial2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="proff2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="setup2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="midapply2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="mid2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="exam2Date" cssClass="input_txt w_90" />
                </td>
                <td>结束时间<br/>
                    <form:input path="accept2Date" cssClass="input_txt w_90" />
                </td>
            </tr>
            </table>
            <div class="an">
                <button type="button" onclick="doSubmit();" class="ico_tmpSave">
                    <fmt:message key="sys.title.save"/></button>
            </div>
        </form:form>
    </div>
</div>
<!--main end-->
<!--footer start-->
<c:import url="../../../include/footer.jsp"/>
<script>
    function init_page(){
        if("${bean.id}"==""){ //如果是新增
            $("#bacthDetail").hide();
        }

    }

    $(function(){
        init_page();


        $("#projtypecode").change(function(){
            if($(this).val()!="") {
                $("#bacthDetail").show();

                $("#projtypename").val($(this).find("option:selected").text());
            }
        });

    })

</script>
</body>
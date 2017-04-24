<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body>
<div class="warp clearfix">
  <div class="warp_in clearfix">
    <!--top start-->
    <c:import url="../commons/top.jsp"/>
    <!--top start-->
    <div class="main">
      <c:import url="../commons/menu.jsp"/>
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <!--tit start-->
          <div class="tit_1">
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="cms.title.sectionMng"/> </span>
            </b>
          </div>
          <!--tit end-->
          <div class="acl_main">
            <div class="acl_left l">
              <div class="acl_block">
                <div class="oa h540">
                  <ul id="sectionTree"></ul>
                </div>
              </div>
            </div>
            <div class="p10">
              <div class="acl_right acl_block l h540">
                <div class="cms_main">
                  <span class="title"><fmt:message key="cms.title.addSection"/> </span>
                  <form:form modelAttribute="bean" id="form">
                    <form:hidden path="id"/>
                    <form:hidden path="flag"/>
                    <form:hidden path="updater.id" value="${currentUser.id}"/>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
                      <tr>
                        <th scope="row" width="15%">栏目名称</th>
                        <td><form:input path="name" cssClass="input" size="27"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">栏目代码</th>
                        <td><form:input path="code" cssClass="input" size="27"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">父栏目</th>
                        <td><form:select path="parent.id"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">访问路径</th>
                        <td><form:input path="url" cssClass="input" size="27"/></td>

                      </tr>
                      <tr>
                        <th scope="row" width="15%">排序号</th>
                        <td><form:input path="seq" cssClass="input" size="27"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">栏目类型</th>
                        <td><form:select items="${lookups_LMLX}" path="type" cssClass="input"
                                         itemValue="lCode" itemLabel="lName"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">模板</th>
                        <td><form:input path="template" cssClass="input" size="27"/></td>
                      </tr>
                      <tr>
                        <th scope="row" width="15%">是否root</th>
                        <td><form:checkbox path="root"/></td>
                      </tr>
                      <tr>
                        <td colspan="2">
                          <button type="button" onclick="submitForm();">提交</button>
                          <button type="button" onclick="delSection();" class="dn">删除</button>
                        </td>
                      </tr>
                    </table>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <c:import url="../commons/footer.jsp"/>
    </div>
  </div>
</div>
<script>
  /**
   * 加载栏目树
   */
  loadSectionTree = function () {
    $('#sectionTree').tree({
      url: 'loadSectionTree.htm',
      checkbox: false,
      onBeforeExpand: function () {
        $('#sectionTree').tree('options').url = "loadSectionTree.htm";
      },
      onClick: function (node) {
        $.post('loadSectionField.htm', {id: node.id}, function (data) {
          if (data.success) {
            $('#id').val(data.section[0].id);
            $('#flag').val(data.section[0].flag);
            $('#name').val(data.section[0].name);
            $('#code').val(data.section[0].code);
            $('#url').val(data.section[0].url);
            $('#seq').val(data.section[0].seq);
            $('#type').val(data.section[0].type);
            $('#template').val(data.section[0].template);
            if (data.section[0].parentId != null) {
              $.each($("select[id='parent.id']").find('option'), function (idx, obj) {
                if ($(obj).val() == data.section[0].parentId)
                  $(obj).prop('selected', true);
              });
            }
            if (data.section[0].isRoot)
              $('#root1').prop('checked', true);
            else
              $('#root1').prop('checked', false);
            $('table tr:last button:nth-child(2)').show();
          } else {
            msg(data.message);
          }
        }, 'json');
      }
    });
  }

  delSection = function () {
    var section = $('#sectionTree').tree('getSelected');
    $.messager.confirm('系统信息', '确认要删除\"' + section.text + '\"栏目吗？', function (r) {
      if (r) {
        $.post('ajDel.htm', {id: section.id}, function (data) {
          if (data.success) {
            loadSectionTree();
            loadSectionSelection();
          } else
            msg(data.message);
        }, 'json');
      }
    });

  }

  loadSectionSelection = function () {
    $.post('getJSONAllSection.htm', null, function (data) {
      if (data.success) {
        $.each(data.data, function (idx, obj) {
          $("select[id='parent.id']").append("<option value='" + obj.id + "'>" + obj.name + "</option>")
        });
      }
    }, 'json');
  }

  loadSectionTree();
  loadSectionSelection();

  submitForm = function () {
    $.post('ajaxSave.htm', $('#form').serialize(), function (data) {
      if (data.success) {
        loadSectionTree();
        loadSectionSelection();
        msg('<fmt:message key="cms.msg.sectionTreeUpdated"/>');
      }
      else
        msg(data.message);
    }, 'json');
  }
</script>
</body>
</html>

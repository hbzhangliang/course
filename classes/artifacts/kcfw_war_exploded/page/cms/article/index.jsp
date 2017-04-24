<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_sys.jsp" %>
</head>
<body onbeforeunload="init();">
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
              <span><fmt:message key="cms.title.articleMng"/> </span>
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
                  <div class="tit_1">
                    <div class='opt_add r'
                         onclick="doInput();"
                         title='<fmt:message key="sys.title.new"/>'></div>
                    <div class='opt_reset r' onclick="resetQuery();"
                         title='<fmt:message key="sys.title.reset"/>'></div>
                    <form:form modelAttribute="queryBean" method="post" action="index.htm" id="searchForm">
                      <c:import url="../../../include/pageParams.jsp"/>
                      <form:hidden path="params[sectionId]"/>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_1">
                        <tr>
                          <th scope="row" width="15%">标题</th>
                          <td><form:input path="params[title]" cssClass="input" size="24"
                                          onblur="loadArticleBySection();"/></td>
                          <th scope="row" width="15%">发布时间</th>
                          <td>
                            <form:input path="params[publishDate1]" cssClass="input" size="10"
                                        onblur="loadArticleBySection();"/>-
                            <form:input path="params[publishDate2]" cssClass="input" size="10"
                                        onblur="loadArticleBySection();"/>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row" width="15%">是否置顶</th>
                          <td>
                            <form:select path="params[pinned]" onchange="loadArticleBySection();">
                              <form:option label="--请选择--" value=""/>
                              <form:options items="${lookups_YN}" itemLabel="lName" itemValue="lCode"/>
                            </form:select>
                          </td>
                          <th scope="row" width="15%">是否发布</th>
                          <td>
                            <form:select path="params[published]" onchange="loadArticleBySection();">
                              <form:option label="--请选择--" value=""/>
                              <form:options items="${lookups_YN}" itemLabel="lName" itemValue="lCode"/>
                            </form:select>
                          </td>
                        </tr>
                      </table>
                    </form:form>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tablelist">
                      <thead>
                      <tr>
                        <th scope="col" width="5%">序号</th>
                        <th scope="col" width="8%">置顶</th>
                        <th scope="col">标题</th>
                        <th scope="col" width="10%">发布时间</th>
                        <th scope="col" width="8%">状态</th>
                        <th scope="col" width="10%"><fmt:message key="sys.title.operation"/></th>
                      </tr>
                      </thead>
                      <tbody id="articleList"></tbody>
                    </table>
                    <br/>
                    <div class="page">
                      <a href="javascript:void(0)" onclick="doPage('first')">首页</a>
                      <a href="javascript:void(0)" onclick="doPage('prev')">上一页</a>
                      共<label id="totalRow"></label>条记录 当前
                      <input type="text" maxlength="3" id="pageNo" onchange="doPage('current')"/>/
                      <label id="totalPage"></label>
                      <a href="javascript:void(0)" onclick="doPage('next')">下一页</a>
                      <a href="javascript:void(0)" onclick="doPage('last')">末页</a>
                    </div>
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
</div>
<script>
  /**
   * 加载栏目树
   */
  loadSectionTree = function () {
    $('#sectionTree').tree({
      url: '${base}/cms/section/loadSectionTree.htm',
      checkbox: false,
      onBeforeExpand: function () {
        $('#sectionTree').tree('options').url = "${base}/cms/section/loadSectionTree.htm";
      },
      onClick: function (node) {
        if (!node.isRoot) {
          $('#paramssectionId').val(node.id);
          loadArticleBySection(node.id);
        }
      },
      onLoadSuccess: function () {
        $('#sectionTree').tree('expandAll');
      }
    });
  }

  loadArticleBySection = function (sectionId) {
    $('#articleList').empty();
    $.post('jsonList.htm', {
      sectionId: sectionId == null ? $('#sectionTree').tree('getSelected').id : sectionId,
      title: $("#paramstitle").val(),
      publishDate1: $("#paramspublishDate1").val(),
      publishDate2: $("#paramspublishDate2").val(),
      pinned: $('#paramspinned').val(),
      published: $('#paramspublished').val(),
      page: $('#pageNo').val()
    }, function (data) {
      if (data.success) {
        $.each(data.data, function (idx, obj) {
          var row = '<tr id=\"' + obj.id + '\">' +
              '<td>' + (idx + 1) + '</td>';
          if (obj.pinned)
            row += '<td><a href=\"javascript:void(0)\" onclick=\"ajaxUpdate(\'' + obj.id + '\',\'pinned\',false)\">取消置顶</a></td>';
          else
            row += '<td><a href=\"javascript:void(0)\" onclick=\"ajaxUpdate(\'' + obj.id + '\',\'pinned\',true)\">置顶</a></td>';
          row += '<td><a href=\"javascript:void(0);\" onclick=doInput(this);>' + obj.title + '</a></td>' +
              '<td>' + (obj.publishDate == null ? '' : obj.publishDate) + '</td>';
          if (obj.published)
            row += '<td><a href=\"javascript:void(0)\" onclick=\"ajaxUpdate(\'' + obj.id + '\',\'published\',false)\">取消发布</a></td>';
          else
            row += '<td><a href=\"javascript:void(0)\" onclick=\"ajaxUpdate(\'' + obj.id + '\',\'published\',true)\">发布</a></td>';
          row += "<td><div onclick=\"doDel(this)\" class=\"opt_del l\" title=\"删除\"></div>" +
              "<div onclick=\"doPreview(this)\" class=\"opt_view l\" title=\"预览\"/></td></tr>";
          $('#articleList').append(row);
        });
        $('#totalRow').html(data.totalRow);
        $('#pageNo').val(data.page);
        $('#totalPage').html(data.totalPage);
      } else
        msg(data.message);
    }, 'json');
  }

  loadSectionTree();

  ajaxUpdate = function (id, fieldName, fieldValue) {
    $.messager.confirm('系统信息', '确认要执行吗？', function (r) {
      if (r)
        $.post('ajaxUpdate.htm', {id: id, fieldName: fieldName, fieldValue: fieldValue}, function (data) {
          if (data.success)
            loadArticleBySection($('#sectionTree').tree('getSelected').id);
          else
            msg(data.message);
        }, 'json');
    });
  }

  doPage = function (key) {
    if (key == 'first' && Number($('#pageNo').val()) != 1) {
      $('#pageNo').val(1);
      loadArticleBySection($('#sectionTree').tree('getSelected').id);
    } else if (key == 'last' && Number($('#pageNo').val()) != Number($('#totalPage').html())) {
      $('#pageNo').val($('#totalPage').html());
      loadArticleBySection($('#sectionTree').tree('getSelected').id);
    } else if (key == 'next' && ((Number($('#pageNo').val()) + 1) <= Number($('#totalPage').html()))) {
      $('#pageNo').val(Number($('#pageNo').val()) + 1);
      loadArticleBySection($('#sectionTree').tree('getSelected').id);
    } else if (key == 'prev' && ((Number($('#pageNo').val()) - 1) >= 1)) {
      $('#pageNo').val(Number($('#pageNo').val()) - 1);
      loadArticleBySection($('#sectionTree').tree('getSelected').id);
    } else if (key == 'current' && Number($('#pageNo').val()) >= 1 && Number($('#pageNo').val() <= Number($('#totalPage').html()))) {
      loadArticleBySection($('#sectionTree').tree('getSelected').id);
    }
  }

  resetQuery = function () {
    $("#searchForm").find("input").not(":button,:submit,:reset,:hidden").val("").removeAttr("checked").removeAttr("selected");
    $("#searchForm").find("option").removeAttr("selected");
    loadArticleBySection();
  }

  doInput = function (obj) {
    $('#searchForm').attr('action', 'input.htm');
    $('#searchForm').find("input[id='id']").val($(obj) == null ? null : $(obj).parent().parent().attr('id'));
    $('#searchForm').submit();
  }

  doDel = function (obj) {
    var articleId = $(obj).parent().parent().attr('id');
    var sectionId = $('#sectionTree').tree('getSelected').id;
    $.messager.confirm('系统信息', '确认要执行吗？', function (r) {
      if (r)
        $.post('ajDel.htm', {articleId: articleId, sectionId: sectionId}, function (data) {
          if (data.success)
            loadArticleBySection($('#sectionTree').tree('getSelected').id);
          else
            msg(data.message);
        }, 'json');
    });
  }

  doPreview = function (obj) {
    var articleId = $(obj).parent().parent().attr('id');
    var sectionId = $('#sectionTree').tree('getSelected').id;
    window.open('preview.htm?aId=' + articleId + '&sId=' + sectionId);
  }
</script>
</body>
</html>

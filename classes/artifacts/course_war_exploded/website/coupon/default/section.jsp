<%--
  Created by IntelliJ IDEA.
  User: liang_zhang
  Date: 2015/11/10
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../include/taglib.jsp" %>
<%@ include file="../../../include/resource.jsp" %>
<%@ include file="../../../include/skin_coupon.jsp" %>
</head>
<body class="boby">
<c:import url="../commons/header.jsp"/>
<!--main start-->
<div class="main">
  <!--cont start-->
  <div class="cont">
    <div class="nav">
      <div class="nav-l">${currentSection.name}</div>
      <div class="nav-c  w745"><a href="#"></a></div>
      <div class="nav-r"></div>
    </div>
    <!--list start-->
    <div class="list clearfix">
      <ul></ul>
    </div>
    <!--list end-->
    <!--list-bott start-->
    <div class="list-bott">
      共<label id="totalRow"></label>条记录 &nbsp; <label id="pageNum"></label>/<label id="totalPage"></label>页 &nbsp;
      &nbsp;
      <a href="javascript:void(0);" onclick="doPage('first');">首页</a> &nbsp;
      <a href="javascript:void(0);" onclick="doPage('prev');">上一页</a> &nbsp;
      <a href="javascript:void(0);" onclick="doPage('next');">下一页</a> &nbsp;
      <a href="javascript:void(0);" onclick="doPage('last');">尾页</a> &nbsp; &nbsp;
      第<input type="text" id="pageNo" style="width: 20px;margin-left: 5px;" onchange="doPage('current');"/>页
    </div>
    <!--list-bott end-->
  </div>
  <!--cont end-->
  <div class="main-bot"></div>
</div>
<!--main end-->
<c:import url="../commons/footer.jsp"/>
<script>
  loadArticleBySection = function () {
    $.post('${base}/loadArticleBySection/${currentSection.code}', {page: $('#pageNo').val()}, function (data) {
      if (data.success) {
        var content = '';
        $.each(data.data, function (idx, obj) {
          content += '<li><a href=\"article/' + obj.id + '\">' + obj.title + '</a><span>' + obj.publishDate + '</span></li>'
        });
        $('.list ul').append(content);
        $('#totalRow').html(data.totalRow);
        $('#pageNum').html(data.page);
        $('#pageNo').val(data.page);
        $('#totalPage').html(data.totalPage);
      } else {
        msg(data.message);
      }
    }, 'json');
  }

  doPage = function (key) {
    if (key == 'first' && Number($('#pageNo').val()) != 1) {
      $('#pageNo').val(1);
      loadArticleBySection();
    } else if (key == 'last' && Number($('#pageNo').val()) != Number($('#totalPage').html())) {
      $('#pageNo').val($('#totalPage').html());
      loadArticleBySection();
    } else if (key == 'next' && ((Number($('#pageNo').val()) + 1) <= Number($('#totalPage').html()))) {
      $('#pageNo').val(Number($('#pageNo').val()) + 1);
      loadArticleBySection();
    } else if (key == 'prev' && ((Number($('#pageNo').val()) - 1) >= 1)) {
      $('#pageNo').val(Number($('#pageNo').val()) - 1);
      loadArticleBySection();
    } else if (key == 'current' && Number($('#pageNo').val()) >= 1 && Number($('#pageNo').val() <= Number($('#totalPage').html()))) {
      loadArticleBySection();
    }
  }

  loadArticleBySection();
</script>
</body>
</html>
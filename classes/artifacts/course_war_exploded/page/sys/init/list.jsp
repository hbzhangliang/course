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
      <!--tit start-->
      <div class="right clearfix">
        <div class="right_ineer clearfix">
          <div class="tit_1">
            <gw:list_opt opt="b" id="lot"/>
            <b>
              <div class="sys_title"></div>
              <span><fmt:message key="sys.title.sysTools"/> </span>
            </b>
          </div>
          <!--tit end-->
          <div class="tabtit" id="tabtit">
            <ul>
              <li class="tab_on">
                数据清理
              </li>
              <li>
                工具2
              </li>
              <li>
                工具3
              </li>
            </ul>
          </div>
          <div class="tabcontent">
            <ul>
              <div>
                <br/>
                <button type="button" onclick="getTables()">获取业务表</button>
                <button type="button" onclick="sub()">清洗业务数据</button>
                <div id="tabArea"></div>
                <div id="names" style="display:none"></div>
              </div>
            </ul>
            <ul class="tabhide">
              <input type="text" id="vv"/>
              <button type="button" onclick="getV()">获取值</button>
              <div id="p" class="easyui-progressbar" data-options="value:50"
                   style="width:400px;background: #fff;"></div>
            </ul>
            <ul class="tabhide">
              <button type="button" onclick="test()">获取值</button>
              <div id="msg"></div>
              <script>
                function test() {
                  $.post('/test/1.htm', null, function (msg) {
                    $('#msg').html(msg);
                  });
                }
              </script>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <c:import url="../commons/footer.jsp"/>
  </div>
</div>
<script>
  function getV() {
    $('#p').progressbar('setValue', $('#vv').val());
  }

  $('.tabtit li').bind('click', function () {
    $(this).addClass("tab_on").siblings().removeClass("tab_on");
    $(".tabcontent > ul").eq($(".tabtit li").index(this)).show().siblings().hide();
  });

  function getTables() {
    $.post('ajGetTableNames.htm', null, function (list) {
      var content = "<br/>";
      $.each(list, function (idx, obj) {
        content += "<input type='checkbox' id='" + obj + "'/>" + obj;
        if ((idx + 1) % 4 == 0)
          content += "<br/><br/>";
      });
      $('#tabArea').html(content);
    },'json')
  }

  function sub() {
    var ids = "";
    $('#tabArea').find("input:checked").each(function () {
      ids += this.id + ",";
    });
    if (ids.length > 0)
      $.post('ajDataClear.htm', {tableNames: ids}, function (data) {
        msg(data);
      });
    else
      msg("请选择要清理的对象");
  }
</script>
</body>
</html>
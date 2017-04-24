<%@ page language="java" pageEncoding="utf-8" %>
<script src="${base}/web-resources/resources/js/ajaxfileupload.js"></script>
<script>
  function doUpload() {
    $("#loading").ajaxStart(function () {
      $(this).show();
    }).ajaxComplete(function () {
      $(this).hide();
    });

    var fileName = $("#upload").val();
    if ($("#fileDisplayName").val() == null || $("#fileDisplayName").val() == '') {
      $("#fileName").val(fileName.substring(fileName.lastIndexOf("\\") + 1));
    } else {
      $("#fileName").val($('#fileDisplayName').val() + fileName.substr(fileName.lastIndexOf(".")));
    }

    $.ajaxFileUpload({
          url: '${base}/sys/attr/ajaxUp.htm',
          secureuri: false,
          fileElementId: 'upload',
          data: {"fileDisplayName": $('#fileDisplayName').val()},
          dataType: 'content',
          success: function (data, status) {
            addFileElm(data);
          },
          error: function (data, status, e) {
            $('#result').html('添加失败');
          }
        }
    );
    return false;
  }

  function addFileElm(id) {
    var content = $("#fileList").html();
    $('#fileList').html(content + '<a href="${base}/sys/attr/download.htm?id=' + id + '">' + $("#fileName").val() + '</a><span onclick="ajDel(this,' + id + ')">[删除]</span>');
  }

  function ajDel(obj, id) {
    $.post('${base}/sys/attr/ajDel.htm', {"id": id}, function (data) {
      $(obj).prev().remove();
      $(obj).remove();
    });
  }
</script>
<div class="uploadFile">
  <input type="file" id="upload" name="upload" onchange="doUpload()"/>
  <input type="hidden" id="fileName"/>
  <input type="text" id="fileDisplayName"/>

  <div id="fileList">
  </div>
  <div class="dn" id="loading">
    <img src="${base}/page/sys/attr/loading.gif"/></div>
  <span id="result" class="dn"></span>
</div>

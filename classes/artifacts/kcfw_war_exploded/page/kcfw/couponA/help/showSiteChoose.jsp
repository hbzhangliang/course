<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class='bt_sel'><span onclick="showSitesWin()">选</span></div>
<style type="text/css">
 ul.site{
 	margin-left: 20px;
 	margin-top: 50px;
 }
 ul.site li{
 	margin: 5px 2px;
 }
</style>
<div id="sitesSelector" style="display:none;">
  <div style=" float:left; display:block;width:630px;">
  	<table id="sitePanel" class="table_01">
  	<tr>
  		<th width="10%">请选择</th>
  		<th width="12%">会场提供商</th>
        <th width="12%">会场名称</th>
        <th width="10%">容纳人数</th>
        <th width="10%">面积</th>
        <th width="10%">高度</th>
        <th width="25%">价格详情</th>
    </tr>
<%--     <c:forEach items="${siteInfo}" var="siteinfos" varStatus="i"> --%>
<%--     	<tr id="tr_${siteinfos.id}"> --%>
<%--     	  <td><input class="chk" type="checkbox" id="${siteinfos.id}"/></td> --%>
<%--   		  <td>${siteinfos.provider.name}</td> --%>
<%--           <td>${siteinfos.name}</td> --%>
<%--           <td>${siteinfos.capacity}</td> --%>
<%--           <td>${siteinfos.area}</td> --%>
<%--           <td>${siteinfos.height}</td> --%>
<!--        </tr> -->
<%--     </c:forEach> --%>
  	</table>
  </div>
  <div style=" float:left; display:block; width:80px;">
  	<ul class="site">
  	<li><a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-ok"><span></span>
    	      确定</a>
  	</li>
  	<li><a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-remove"><span></span>
       	 清除</a>
  	</li>
  	<li><a href="javascript:void(0);" class="easyui-linkbutton" icon="icon-back"><span></span>
          取消</a>
  	</li>
  	</ul>
  	</div>
  
</div>
<script>
showSitesWin = function () {
    var $win = $('#sitesSelector').window({
      title: '选择会议地点',
      width: 750,
      height: 450,
      top: '100%',
      left: '30%',
      shadow: true,
      modal: true,
      iconCls: 'icon-add',
      closed: true,
      minimizable: false,
      maximizable: false,
      collapsible: false
    });
    $win.window('open');
    $('#sitesSelector').show();
    loadSites();
  }

  function loadSites(){
	  $("#sitePanel").find("tr:not(:first)").remove();
	  $.post(base + '/siteInfo/getSiteList.htm', {providerId:""}, function (data) {
		  $.each(data,function(index,item){
			  var str="<tr id='tr_"+item.id+"'>";
			  str+="<td><input class='chk' type='checkbox' id='"+item.id+"'/></td>";
			  str+="<td>"+item.proverName+"</td>";
			  str+="<td>"+item.name+"</td>";
			  str+="<td>"+item.capacity+"</td>";
			  str+="<td>"+item.area+"</td>";
			  str+="<td>"+item.height+"</td>";
			  str+="<td>"+item.price+"</td>";
			  str+="</tr>"
			  $("#sitePanel").append(str);
		  });
		  loadCheck();
	  },'json');
  }
  
  function loadCheck(){
	  var codes=$("#" + 'siteCodes').val();
	  if(!(codes==""||codes==null||codes==undefined)){
		  var codesLine=codes.split(',');
		  for(var index in codesLine){
			  if(codesLine[index]!=""){
				  $("#"+codesLine[index]).attr("checked",'true');
			  }
		  }
	  }
  }
  
  $(function(){
	  $(".easyui-linkbutton").click(function(){
		  var btnContent=$(this).text();
		  if(btnContent.indexOf("确定")>-1){
			  var providers=[];
			  var name='',code='',provider='';
			  $.each($("#sitesSelector").find("input[type='checkbox']"),function(index,item){
				  if($(item).prop("checked")){
					  name+=$(item).parent().next().next().text()+",";
					  code+=$(item).attr('id')+",";
					  provider=$(item).parent().next().text();
					  if($.inArray(provider,providers)==-1){ //不包含
						  providers.push(provider);
					  }
				  }
			  });
			  if(providers.length>1){
				  msg("每张申请券只能选择一个提供上的会场")
				  return;
			  }
			  $("#" + 'siteName').val(name);
			  $("#" + 'siteCodes').val(code);
			  $('#sitesSelector').window('close');
		  }
		  else if(btnContent.indexOf("清除")>-1){
			  $("#sitesSelector").find("input[type='checkbox']").attr("checked",false);
		  }
		  else{
			  $('#sitesSelector').window('close');
		  }
	  });
  })

</script>
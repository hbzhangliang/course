<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="an"><button type="button" onclick="showCouponWin()" class="ico_add">
          添加</button></div>
<style type="text/css">
 ul.site{
 	margin-left: 20px;
 	margin-top: 50px;
 }
 ul.site li{
 	margin: 5px 2px;
 }
 
 .tableItem{
 	width: 100%;
 }
 .tableItem td{
 	width:25px;
 }
 .tableItem input[type="text"]{
 	width:98%;
 } 
 .tableItem span{
 	margin-right:8px;
 	border: 1px solid gray;
 } 
</style>
<div id="couponSelector" style="display:none;">
  <div style="margin-top:30px; display:block;width:920px;">
  	<div id="itemspanel" style="display:none;"></div>
  	<table style="margin-top:20px;" id="couponPanel" class="table_01">
  	<tr>
  		<th  class='hidePannel' width="5%">编号</th>
  		<th width="5%"><input type='checkbox' id='select_All'/></th>
  		<th width="5%">券种</th>
        <th width="10%">流水号</th>
        <th width="10%">会议序号</th>
        <th width="10%">会场名称</th>
        <th width="10%">会议名称</th>
        <th width="10%">会议时间</th>
        <th width="10%">科技券数量</th>
        <th width="10%">科技券金额</th>
        <th width="10%">流转状态</th>
    </tr>
  	</table>
  </div>
  <div class="an" style="position:absolute;left:20px;top:20px;">
  	<button id="btn_itemsSave" type="button"  class="ico_tmpSave">
          确定</button>
           <button id="btn_itemsBACK" type="button"  class="ico_return">
          返回</button>
  	</div>
</div>
<script>


showCouponWin = function () {
    var $win = $('#couponSelector').window({
      title: '选择需要结算的科技券',
      width: 980,
      height: 600,
      top: '16%',
      left: '18%',
      shadow: true,
      modal: true,
      iconCls: 'icon-add',
      closed: true,
      minimizable: false,
      maximizable: false,
      collapsible: false
    });
    $win.window('open');
    $('#couponSelector').show();
    loadCoupons();
  }

  function loadCoupons(){
	  $("#couponPanel").find("tr:not(:first)").remove();
	  $.get(base + '/couponMng/couponConfirm/getCoupon.htm',  function (data) {
		  $.each(data,function(index,item){
			  var flag=false;
			  if(Itemlist.length>0){
				  for(var i in Itemlist){
					  if(Itemlist[i]==item.id){
						  flag=true;
						  break;
					  }
				  }
			  }
				  var str="<tr>";
				  str+="<td class='hidePannel'>"+item.id+"</td>";
				  if(flag){
					  str+="<td><input type='checkbox' checked='true'/></td>";
				  }
				  else{
					  str+="<td><input type='checkbox'/></td>";
				  }
				  
				  str+="<td>"+partternCheck(item.type,'type')+"</td>";
				  str+="<td>"+item.seq+"</td>";
				  str+="<td>"+item.meetingNumber+"</td>";
				  str+="<td>"+item.sitenames+"</td>";
				  str+="<td>"+item.meetingname+"</td>";
				  str+="<td>"+item.starttime+"</td>";
				  str+="<td>"+item.amount+"</td>";
				  str+="<td>"+partternCheck(item.cost,'cost')+"</td>";
				  str+="<td>"+partternCheck(item.status,'status')+"</td>";
				  str+="</tr>"
				  $("#couponPanel").append(str);
		  });
		  //loadCheck();
	  },'json');
  }
	
	function partternCheck(value,type){
		if("type"==type){
			return value=="AKJQ"?"A券":"B券";
		}
		else if("cost"==type){
			if(value!=null)
				return parseInt(value);
			else{
				return "";
			}
		}
		else if("status"==type){
			return value=="paidconfirmed"?"使用已确认":"";
		}
	}
	
  $(function(){
	  $("#btn_itemsSave").click(function(){
		  var count=0;
		  $.each($("#couponPanel").find(':checkbox'),function(ind,obj){
			  if($(obj).prop('checked')){
				  count++;
			  }
		  });
		  
		  if(count==0){
			  msg("未添加任何数据，请先添加数据")
			  return;
		  }
		  else{
			  $("#cashApply_pannel").find('tr:gt(0)').remove();
			  Itemlist.length=0;
			 $("#couponPanel").find('tr:gt(0)').each(function(index,item){
				 if($(item).find(':checkbox').prop('checked')){
					 Itemlist.push($(item).find('td:eq(0)').text());
					 var info=$(item).clone();
					 info.find('td').eq(1).remove();
					 $(info).appendTo($("#cashApply_pannel"));
				 }
			 });
			 listStatistic();
			 
			 $('#couponSelector').window('close');
		  }
	  });
	  
	  $("#btn_itemsBACK").click(function(){
		  $('#couponSelector').window('close');
	  });
	  
	  
	 $("#select_All").click(function(){
		 if($(this).prop('checked')){
			 $("#couponPanel").find(':checkbox').prop("checked",'true');
		 }
		 else{
			 $("#couponPanel").find(':checkbox').prop("checked",false);
		 }
		 
		 
	 });
	  
  })

</script>
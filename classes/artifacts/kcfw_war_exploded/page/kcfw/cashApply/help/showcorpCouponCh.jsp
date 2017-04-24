<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="an"><button type="button" onclick="showCouponWin()" class="ico_add">
          选择科技券</button></div>
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
  <div style="margin-top:30px; display:block;width:800px;">
  	<table style="margin-top:20px;" id="couponPanel" class="table_01">
  	<tr>
  		<th width="5%">选择</th>
  		<th width="5%" class='hidePannel'>编号</th>
  		<th width="5%">券种</th>
        <th width="10%">流水号</th>
        <th width="10%">申请用途</th>
        <th width="10%">支持情况</th>
        <th width="10%">支持单位</th>
        <th width="10%">联系人</th>
        <th width="10%">联系电话</th>
        <th width="10%">申请时间</th>
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
      width: 830,
      height: 600,
      top: '15%',
      left: '25%',
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
	  $.get(base + '/couponMng/couponA/getCoupon.htm',  function (data) {
		  $.each(data,function(index,item){
			  
			  var str="<tr>";
			  if(couponId==item.id){
			  		str+="<td><input class='chk' type='radio' name='couponcheck' checked='true'/></td>";
			  }
			  else{
				  str+="<td><input class='chk' type='radio' name='couponcheck'/></td>";
			  }
			  str+="<td class='hidePannel'>"+item.id+"</td>";
			  str+="<td>"+partternCheck(item.type,'type')+"</td>";
			  str+="<td>"+item.seq+"</td>";
			  str+="<td>"+item.purpose+"</td>";
			  str+="<td>"+partternCheck(item.supportType,'supporttype')+"</td>";
			  str+="<td>"+item.supportBy+"</td>";
			  str+="<td>"+item.supportContactor+"</td>";
			  str+="<td>"+item.supportTel+"</td>";
			  str+="<td>"+item.startDate+"</td>";
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
		else if("supporttype"==type){
			switch(value){
			case"stateSupport": return "国家支持活动";
			case"citySupport": return "市级支持活动";
			case"districtSupport": return "区级推荐活动";
			default:return "";
			}
		}
		else if("status"==type){
			switch(value){
			case"comfirm": return "已批复待使用";
			case"paid": return "已使用";
			default:return "";
			}
		}
	}

	
  $(function(){
	  $("#btn_itemsSave").click(function(){
		  var flag=false;
		  $('#couponPanel').find("input[type='radio']").each(function(index,item){
			  if($(item).prop('checked')){
				   flag=true;
				   couponId=$(item).closest('tr').find('td').eq(1).text();
				   $("#couponInfo_pannel tr:gt(0)").remove();
				   $("#couponInfo_pannel").append($(item).closest('tr').clone());
				   $('#couponSelector').window('close');
				   
			  }
		  });
		  if(!flag){
			  msg("请选择科技券");
		  }
	  });
	  
	  $("#btn_itemsBACK").click(function(){
		  $('#couponSelector').window('close');
	  });
	  
  })

</script>
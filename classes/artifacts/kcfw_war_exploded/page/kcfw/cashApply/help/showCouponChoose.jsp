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
  		<th width="5%">券种</th>
        <th width="10%">流水号</th>
        <th width="10%">会议序号</th>
        <th width="10%">会场名称</th>
        <th width="10%">会议名称</th>
        <th width="10%">会议时间</th>
        <th width="10%">科技券数量</th>
        <th width="10%">科技券金额</th>
        <th width="10%">流转状态</th>
        <th width="10%">操作</th>
    </tr>
  	</table>
  </div>
  <div class="an" style="position:absolute;left:20px;top:20px;">
  <button id="btn_itemsView" type="button" class="ico_view">
          查看</button>
  	<button id="btn_itemsSave" type="button"  class="ico_tmpSave">
          确定</button>
          <button id="btn_itemsCancel" type="button"  class="ico_trash">
          清除</button>
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
			  var flag=true;
			  if(Itemlist.length>0){
				  for(var i in Itemlist){
					  if(Itemlist[i].applyId==item.id){
						  flag=false;
						  break;
					  }
				  }
			  }
				  var str="<tr>";
				  str+="<td class='hidePannel'>"+item.id+"</td>";
				  str+="<td>"+partternCheck(item.type,'type')+"</td>";
				  str+="<td>"+item.seq+"</td>";
				  str+="<td>"+item.meetingNumber+"</td>";
				  str+="<td>"+item.sitenames+"</td>";
				  str+="<td>"+item.meetingname+"</td>";
				  str+="<td>"+item.starttime+"</td>";
				  str+="<td>"+item.amount+"</td>";
				  str+="<td>"+partternCheck(item.cost,'cost')+"</td>";
				  str+="<td>"+partternCheck(item.status,'status')+"</td>";
				  if(flag){
				  	str+="<td><div class='bt_sel'><span onclick='addItem(this)'>添加</span></div></td>";
				  }
				  else{
					  str+="<td>已添加</td>";
				  }
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

	function addItem(item){
		var apply=$(item).closest('tr').find('td').eq(0).text();
		if($(item).closest('tr').next().hasClass('iteminfo')){
			return;
		}
		var itemInfo="";
		itemInfo="<tr width='98%' class='iteminfo'><td colspan='10'><table class='tableItem'><tr><th class='hidePannel' width='5%'>编号</th><th>序号</th><th>服务单位</th><th>发票代码</th><th>发票号码</th><th>发票日期</th><th>发票金额(元)</th><th>服务项目</th><th>服务金额(元)</th><th width='15%'>操作</th><tr>";
		itemInfo+="<tr><td class='hidePannel'>"+apply+"</td><td>"+itemNumber+"</td><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td><td><input onclick='timeSel(this)' type='text'/></td><td><input type='text'></td><td><input type='text'></td><td><input type='text'></td><td><div class='bt_sel'><span onclick='itemConfirm(this)'>确定</span><span onclick='itemCancel(this)'>取消</span></div></td></tr>";
		itemInfo+="</table</td></tr>";
		$(itemInfo).insertAfter($(item).closest('tr'));
	}
	
	function timeSel(item){
		$(item).bind('click', WdatePicker);
	}
	
	function itemConfirm(item){
		if(!checkComplete($(item).closest('table'))){
			msg("信息填写不完整或日期格式,金额格式不正确");
			return ;
		}
		var trInfo=$(item).closest('tr');
		var serveItem={
				  amount:$(trInfo).closest('table').closest('tr').prev().find('td').eq(7).html(),
				  cost:$(trInfo).closest('table').closest('tr').prev().find('td').eq(8).html(),
				  applyId:$(trInfo).find('td').eq(0).text(),
				  number:$(trInfo).find('td').eq(1).text(),
				  company:$(trInfo).find('input').eq(0).val(),
				  invoiceCode:$(trInfo).find('input').eq(1).val(),
				  invoiceNumber:$(trInfo).find('input').eq(2).val(),
				  invoiceDate:$(trInfo).find('input').eq(3).val(),
				  invoiceMoney:$(trInfo).find('input').eq(4).val(),
				  content:$(trInfo).find('input').eq(5).val(),
				  money:$(trInfo).find('input').eq(6).val()
		};
		
		Itemlist.push(serveItem);
		
		itemNumber=Itemlist.length;
		$("#btn_itemsView").text("查看("+itemNumber+")");
		$("#itemspanel").hide();
		
		$(item).closest('table').closest('tr').hide(500,function(){
			$(item).closest('table').closest('tr').remove();
		});
		$(item).closest('table').closest('tr').prev().find('td:last').html('已添加');
	}
	function itemCancel(item){
		$(item).closest('table').closest('tr').remove();
	}
	
	function itemDel(item){
		var apply=$(item).closest('tr').find('td').eq(0).text();
		$(item).closest('tr').remove();
		 for(var i in Itemlist){
			 if(apply==Itemlist[i].applyId){
				 Itemlist.splice(i,1);
			 }
		 }
		 
		 $.each($("#couponPanel").find('tr'),function(id,obj){
			 var applyItem=$(obj).find('td').eq(0).text();
			 if(apply==applyItem){
				 var pannel="<div class='bt_sel'><span onclick='addItem(this)'>添加</span></div>";
				 $(obj).find('td:last').html(pannel);
			 }
		 });
		 itemNumber=Itemlist.length;
		 $("#btn_itemsView").text("查看("+itemNumber+")");
	}
	
	function checkComplete(item){
		var datePatter = /^(\d{4})-(\d{1,2})-(\d{1,2})$/;
		var flag=true;
		$.each($(item).find("input[type='text']"),function(index,obj){
			if($(obj).val()==""){
				flag=false;
			}
			//必须填写日期
			if(3==index){
				if(!datePatter.test($(obj).val())){
					flag=false;
				}
			}
			//必须是数字
			if(6==index||4==index){
				if(isNaN($(obj).val())){
					flag=false;
				}
			}
		});
		return flag;
	}
	
  $(function(){
	  $("#btn_itemsView").click(function(){
		  var itemInfo="";
		  itemInfo="<table class='table_01'><tr><th class='hidePannel'>编号</th><th>序号</th><th>服务单位</th><th>发票代码</th><th>发票号码</th><th>发票日期</th><th>发票金额(元)</th><th>服务项目</th><th>服务金额(元)</th><th width='15%'>操作</th><tr>";
		  for(var i in Itemlist){
			  var trInfo="<tr><td class='hidePannel'>"+Itemlist[i].applyId+"</td><td>"+Itemlist[i].number+"</td><td>"+Itemlist[i].company+"</td><td>"+Itemlist[i].invoiceCode+"</td><td>"+Itemlist[i].invoiceNumber+"</td><td>"+Itemlist[i].invoiceDate+"</td><td>"+Itemlist[i].invoiceMoney+"</td><td>"+Itemlist[i].content+"</td><td>"+Itemlist[i].money+"</td><td><div class='bt_sel'><span onclick='itemDel(this)'>撤销</span></td></tr>";
			  itemInfo+=trInfo;
		  }
		  itemInfo+="</table>";
		  $("#itemspanel").html($(itemInfo));
		  $("#itemspanel").toggle(50);
	  });
	  
	  $("#btn_itemsCancel").click(function(){
		  //清空数组
		  Itemlist=[];
		  listSynTable();
		  $('#couponSelector').window('close');
	  });
	  
	  $("#btn_itemsSave").click(function(){
		  if(Itemlist.length==0){
			  msg("未添加任何数据，请先添加数据")
			  return;
		  }
		  else{
			  listSynTable();
			  
			 $('#couponSelector').window('close');
		  }
	  });
	  
	  $("#btn_itemsBACK").click(function(){
		  $('#couponSelector').window('close');
	  });
	  
	  
	 
	  
  })

</script>
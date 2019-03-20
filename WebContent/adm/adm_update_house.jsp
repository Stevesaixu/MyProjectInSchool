<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/adm"; %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="<%=basePath%>/scripts/jquery/jquery-1.7.1.js"></script>
<link href="<%=basePath%>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="<%=basePath%>/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if(validateForm()){
				checkFyFhSubmit();
			}
		});
		
		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});
		
		var result = 'null';
		if(result =='success'){
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});
	

	
	/** 检测房源房号是否存在并提交form  **/
	function checkFyFhSubmit(){
		$("#submitForm").attr("action", "<%=path%>/updateHouse.do").submit();
		
		window.parent.location.reload();

		parent.layer.closeAll('iframe');

		return true;
	}
	
	/** 表单验证  **/
	function validateForm(){
		if($("#fywz").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源位置', ok:true,});
			return false;
		}
		if($("#fyxq").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源小区', ok:true,});
			return false;
		}
		if($("#fy").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源', ok:true,});
			return false;
		}
		if($("#fylc").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源楼层', ok:true,});
			return false;
		}
		if($("#fymj").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源面积', ok:true,});
			return false;
		}
		if($("#fyhzName").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写户主姓名', ok:true,});
			return false;
		}
		if($("#fyhzPhone").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写户主手机号', ok:true,});
			return false;
		}
		if($("#fyzj").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写租金', ok:true,});
			return false;
		}
		if($("#fytitle").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写房源标题', ok:true,});
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form id="submitForm" name="submitForm" action="/xngzf/archives/initFangyuan.action" method="post">
	<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	<div id="container">
		<div id="nav_links">
			当前位置：基础数据&nbsp;>&nbsp;<span style="color: #1A5CC6;">房源编辑</span>
			<div id="page_close">
				<a href="javascript:parent.$.fancybox.close();">
					<img src="images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
		
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
			<input type="hidden" name="house_id" value="${sessionScope.house.house_id}"/>
				<tr>
					<td class="ui_text_rt" width="80">位置</td>
					<td class="ui_text_lt">
						<input type="text" id="fywz" name="house_address"  class="ui_input_txt03" placeholder="请输入房源所在位置，例：红旗街" value="${sessionScope.house.house_address}"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80">小区</td>
					<td class="ui_text_lt">
						<input type="text" id="fyxq" name="house_estate"  class="ui_input_txt03" placeholder="请输入房源所在小区" value="${sessionScope.house.house_estate}"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">房源</td>
					<td class="ui_text_lt">
						<input type="text" id="fy" name="house_storey"   class="ui_input_txt03" placeholder="例：露水湖畔xx号楼xx单元xx室" value="${sessionScope.house.house_storey}"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">楼层</td>
					<td class="ui_text_lt">
						<input type="text" id="fylc" name="house_floor"  class="ui_input_txt03" placeholder="例如：12层带电梯（请注明带不带电梯）" value="${sessionScope.house.house_floor}"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">房源面积</td>
					<td class="ui_text_lt">
						<input type="text" id="fymj" name="house_large"  class="ui_input_txt03" placeholder="请输入房源面积" value="${sessionScope.house.house_large}"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">装修</td>
					<td class="ui_text_lt">
						<select name="house_decorate" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="精装" selected="selected">精装</option>
                            <option value="普装">普装</option>
                            
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">户型</td>
					<td class="ui_text_lt">
						<select name="house_type" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="一室一厅一卫" selected="selected">一室一厅一卫</option>
                            <option value="两室一厅一卫">两室一厅一卫</option>
                            <option value="三室一厅一卫">三室一厅一卫</option>
                            <option value="三室两厅一卫">三室两厅一卫</option>
                            <option value="独栋别墅">独栋别墅</option>
                        </select>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">出租方式</td>
					<td class="ui_text_lt">
						<select name="house_rentWay" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="整租" selected="selected">整租</option>
                            <option value="合租">合租</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">押金要求</td>
					<td class="ui_text_lt">
						<select name="house_deposit" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="押一付三" selected="selected">押一付三</option>
                            <option value="押一付二">押一付二</option>
                            <option value="押一付一">押一付一</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">租金</td>
					<td class="ui_text_lt">
						<input type="text" id="fyzj" name="house_rentMoney"  class="ui_input_txt03" placeholder="请输入租金" value="${sessionScope.house.house_rentMoney}"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">户主姓名</td>
					<td class="ui_text_lt">
						<input type="text" id="fyhzName" name="house_user"  class="ui_input_txt03" placeholder="请输入户主姓名" value="${sessionScope.house.house_user}"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80">户主手机号</td>
					<td class="ui_text_lt">
						<input type="text" id="fyhzPhone" name="house_phone"  class="ui_input_txt03" placeholder="请输入户主手机号" value="${sessionScope.house.house_phone}"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">状态</td>
					<td class="ui_text_lt">
						<select name="house_state" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="在建">在建</option>
                            <option value="待租" selected="selected">待租</option>
                            <option value="已租" >已租</option>
                            <option value="欠费">欠费</option>
                            <option value="其他">其他</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">房源标签</td>
					<td class="ui_text_lt">
						<select name="house_tag" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="交通便利，近地铁" selected="selected">交通便利，近地铁</option>
                            <option value="交通便利，近火车站" >交通便利，近火车站</option>
                            <option value="交通便利，近商场" >交通便利，近商场</option>
                            <option value="交通便利，繁华街区">交通便利，繁华街区</option>
                            <option value="交通便利，近公园">交通便利，近公园</option>
                            <option value="幽静郊区，风景优美，空气清新">幽静郊区，风景优美，空气清新</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">房源标题</td>
					<td class="ui_text_lt">
						<input type="text" id="fytitle" name="house_title"  class="ui_input_txt03" placeholder="例：精装近地铁两室一厅整租好房" value="${sessionScope.house.house_title}"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
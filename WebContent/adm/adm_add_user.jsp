<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link href="style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="scripts/artDialog/artDialog.js?skin=default"></script>
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
	
	/** 检测房源房号是否存在  **/
	function checkFyFh(){
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();	
		var fyFh = $("#fyFh").val();
		if(fyXqCode!="" && fyDh!="" && fyCh!="" && fyFh!=""){
			// 给房屋坐落地址赋值
			$("#fyZldz").val($('#fyDh option:selected').text() + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"checkFyFhIsExists.action",
				data:{"fangyuanEntity.fyID":fyID,"fangyuanEntity.fyXqCode":fyXqCode, "fangyuanEntity.fyDhCode":fyDh, "fangyuanEntity.fyCh":fyCh, "fangyuanEntity.fyFh":fyFh},
				dataType : "text",
				success:function(data){
// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
						 $("#fyFh").css("background", "#EEE");
						 $("#fyFh").focus();
						 return false;
					}
				}
			});
		}
	}
	
	/** 检测房源房号是否存在并提交form  **/
	function checkFyFhSubmit(){
		// 分别获取小区编号、栋号、层号、房号
		var name = $('#name').val();
		var idCard = $('#idCard').val();

		if(name!=""&&idCard!=""){
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"../queryUser.do",
				data:{"naem":name,"idCard":idCard},
				dataType : "text",
				success:function(data){
				   // alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if(data != null&&data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该用户在系统中已经存在哦，\n请维护其他用户数据', ok:true,});
						 $("#fy").css("background", "#EEE");
						 $("#fy").focus();
						 return false;
					}else{
						
						$("#submitForm").attr("action", "../addUser.do").submit();
						window.parent.location.reload();

						parent.layer.closeAll('iframe');
						
					}
				}
			});
		}
		return true;
	}
	
	/** 表单验证  **/
	function validateForm(){
		if($("#name").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写姓名', ok:true,});
			return false;
		}
		if($("#sex").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'选择性别', ok:true,});
			return false;
		}
		if($("#age").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写年龄', ok:true,});
			return false;
		}
		
		if($("#phone").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写手机号', ok:true,});
			return false;
		}
		if($("#email").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写邮箱', ok:true,});
			return false;
		}
		if($("#idCard").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写身份证号', ok:true,});
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
			当前位置：基础数据&nbsp;>&nbsp;<span style="color: #1A5CC6;">用户编辑</span>
			<div id="page_close">
				<a href="javascript:parent.$.fancybox.close();">
					<img src="images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">姓名</td>
					<td class="ui_text_lt">
						<input type="text" id="name" name="name"  class="ui_input_txt03" placeholder="请输入姓名"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80"></td>
					<td class="ui_text_lt">
						<input type="radio" id="sex" name="sex"   value="男"/>男
						<input type="radio" id="sex" name="sex"   value="女"/>女
					</td>
					
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">年龄</td>
					<td class="ui_text_lt">
						<input type="text" id="age" name="age"   class="ui_input_txt03" placeholder="请输入年龄" />
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">居住地</td>
					<td class="ui_text_lt">
						<select name="live" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="长春" selected="selected">长春</option>
                            <option value="吉林">吉林</option>
                            <option value="四平">四平</option>
                            <option value="公主岭">公主岭</option>
                            <option value="延吉">延吉</option>
                            
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">手机号</td>
					<td class="ui_text_lt">
						<input type="text" id="phone" name="phone"  class="ui_input_txt03" placeholder="请输入手机号"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80">邮箱</td>
					<td class="ui_text_lt">
						<input type="text" id="email" name="email"  class="ui_input_txt03" placeholder="请输入邮箱"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80">身份证号</td>
					<td class="ui_text_lt">
						<input type="text" id="idCard" name="idCard"  class="ui_input_txt03" placeholder="请输入身份证号"/>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">角色</td>
					<td class="ui_text_lt">
						<select name="info" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="用户" selected="selected">用户</option>
                            <option value="管理员">管理员</option>
                        </select>
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
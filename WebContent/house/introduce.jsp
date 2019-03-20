<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/house"; %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com/" />
<title>星辰租房</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/static/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/res/layui/css/layui.css">
<script type="text/javascript" src="<%=basePath%>/res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
<link rel="shortcut icon" href="<%=basePath%>/images/favicon.ico" />
<link type="text/css" href="<%=basePath%>/css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/js.js"></script>
<script type="text/javascript" src="../adm/scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../adm/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
 
 	$(function(){
	 //导航定位
	 $(".nav li:eq(6)").addClass("navCur");
	 });
</script>	 

</head>

<body>
	<div class="site-nav-bg">
		<div class="site-nav w1200">
			<p class="sn-back-home">
				<i class="layui-icon layui-icon-home"></i> <a href="index.jsp">首页</a>
			</p>
			<div class="sn-quick-menu">
				<div class="login">
					<c:if test="${empty sessionScope.user}">
						<a href="login.jsp">登录</a>
					</c:if>
					<c:if test="${not empty sessionScope.user}">
						<a href="introduce.jsp">${sessionScope.user.name}</a>
					</c:if>
				</div>
				<div class="sp-cart">
					<a href="shopcart.html">订单</a><span>2</span>
				</div>
			</div>
		</div>
	</div>

	<div class="headerLayout w1200">
		<div class="headerCon">
			<h1 class="mallLogo">
				<a href="#"> <img src="../image/xu.jpg" height="60px"
					width="60px" /> 星辰租房
				</a>
			</h1>

		</div>
	</div>

	<div class="content content-nav-base about-content">
		<div class="main-nav">
			<div class="inner-cont0">
				<div class="inner-cont1 w1200">
					<div class="inner-cont2">
						<a href="../queryHousePre.do">所有房源</a> <a href="buytoday.html">最新房源</a>
						<a href="information.html">房源资讯</a> <a href="about.html"
							class="active">关于我们</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="width1190">
			<div class="vip-left">
				<div class="vipNav">
					<h3 class="vipTitle">个人中心</h3>
					<dl>
						<dt class="vipIcon3">账户设置</dt>
						<dd>
							<a href="user.html" class="vipNavCur">我的资料</a>
						</dd>
						<dt class="vipIcon1">房源</dt>
						<dd>
							<a href="house_list.html">房源列表</a> <a href="house_add.jsp">发布房源</a>
							<a href="house_ranking.html">问题回答</a>
						</dd>
					</dl>
				</div>
				<!--vipNav/-->
			</div>
			<!--vip-left/-->
			<div class="vip-right">
				<h3 class="vipright-title">修改资料</h3>
				
			<form id="submitForm" name="submitForm" method="post">
				<table class="grinfo">
					<tbody>
					<input type="hidden" name="id" value="${sessionScope.user.id }"/>
						<tr>
							<th>用户名：</th>
							<td><input class="inp inw" type="text" id="new_username" name="name"
								maxlength="15" value="${sessionScope.user.name }" onkeyup="return only_py_num(this)">
							</td>
						</tr>
							<th>性别：</th>
							<td>
								<input type="radio" value="男" name="sex" id="sex"/>男
								<input type="radio" value="女" name="sex" id="sex"/>女
							</td>
						</tr>
						<tr>
							<th>年龄：</th>
							<td><input class="inp inw" type="text"
								id="age" name="age" value="${sessionScope.user.age }"></td>
						</tr>
						<tr>
							<th>居住地：</th>
							<td>
								<select id="live" name="live">
									<option value="">----请选择----</option>
									<option value="长春" selected="selected">长春</option>
									<option value="四平" >四平</option>
									<option value="沈阳" >沈阳</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>邮箱：</th>
							<td><input class="inp inw" type="text"
								id="email" name="email" value="${sessionScope.user.email }"></td>
						</tr>
						<tr>
							<th>手机号：</th>
							<td><input class="inp inw" type="text"
								id="phone" name="phone" value="${sessionScope.user.phone }"></td>
						</tr>
						<tr>
							<th>身份证号：</th>
							<td><input class="inp inw" type="text"
								id="idCard" name="idCard" value="${sessionScope.user.idCard }"></td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td colspan="2">
									<div class="member_mod_buttom">
										<input id="submitbutton" type="button"  lay-submit="" lay-filter="demo1" value="完成修改"/>
									</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			</div>
			<!--vip-right/-->
			<div class="clearfix"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--content/-->
	<div class="copy" style="margin-top: 294px;">
		Copyright@ 2019 星辰租房  版权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a
			target="_blank" href="http://www.webqin.net/">秦王网络</a>
	</div>
</body>
<script type="text/javascript">
	$("#submitbutton").click(function() {
	
			if(validateForm()){
				checkFyFhSubmit();
			}
	}); 

    function checkFyFhSubmit(){
		
    	var name =$("#name").val();
		var idCard =$("#idCard").val();
		
		if(name!=""&&idCard!=""){
			// 异步判断该用户是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type:"POST",
				url:"../queryUser.do",
				data:{"name":name,"idCard":idCard},
				dataType : "text",
				success:function(data){
				    //alert(data);
					// 如果返回数据不为空，更改“用户信息”
					if(data != null&&data=="1"){
						 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该用户已存在，请核实自己的身份证号', ok:true,});
						 $("#idCard").css("background", "#EEE");
						 $("#idCard").focus();
						 return false;
					}else{						
						$("#submitForm").attr("action", "../updateUserHouse.do").submit();
					}
				}
			});
		}
		return true;
	}
    
   function validateForm(){
   		if($("#name").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'填写用户名', ok:true,});
			return false;
		}
		if($("#sex").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请选择性别', ok:true,});
			return false;
		}
		if($("#age").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写年龄', ok:true,});
			return false;
		}
		if($("#live").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请选择居住地', ok:true,});
			return false;
		}
		if($("#email").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写邮箱', ok:true,});
			return false;
		}
		if($("#phone").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写手机号', ok:true,});
			return false;
		}
		if($("#idCard").val()==""){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请填写身份证号', ok:true,});
			return false;
		}
	return true;
   	}
</script>
</html>

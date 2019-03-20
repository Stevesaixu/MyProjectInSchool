<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="order by dede58.com/" />
<title>星辰租房</title>
<link rel="stylesheet" type="text/css" href="res/static/css/main.css">
<link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
<script type="text/javascript" src="res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" href="layui/dist/css/layui.css" media="all">
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(3)").addClass("navCur");
	 })
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
			<form action="../queryByTag.do" method="get" class="pro-search">
				<table>
					<tr>
						<th>房源区域：</th>
						<td><a href="javascript:;" class="pro-cur">不限</a> <a
							href="javascript:;">智慧园</a> <a href="javascript:;">立民村</a> <a
							href="javascript:;">塘口村</a> <a href="javascript:;">勤劳村</a> <a
							href="javascript:;">芦胜村</a> <a href="javascript:;">知新村</a></td>
					</tr>
					<tr>
						<th>价格：</th>
						<td><a href="javascript:;" class="pro-cur">不限</a> <a
							href="javascript:;">500-1000</a> <a href="javascript:;">10001-2000</a>
							<a href="javascript:;">2001-3000</a> <a href="javascript:;">3001-4000</a>
							<input type="text" class="protext" /> - <input type="text"
							class="protext" /> 元 <input type="submit" class="proSub"
							value="确定" /></td>
					</tr>
					<tr>
						<th>面积：</th>
						<td><a href="javascript:;" class="pro-cur">不限</a> <a
							href="javascript:;">10平方</a> <a href="javascript:;">20-40平方</a> <a
							href="javascript:;">41-60平方</a> <a href="javascript:;">61-80平方</a>
							<a href="javascript:;">100平方以上</a></td>
					</tr>
					<tr>
						<th>房型：</th>
						<td><a href="javascript:;" class="pro-cur">不限</a> <a
							href="javascript:;">一室一厅</a> <a href="javascript:;">两室一厅</a> <a
							href="javascript:;">3室一厅</a> <a href="javascript:;">一室一厅一卫</a></td>
					</tr>
				</table>
				<div class="paixu">
					<strong>排序：</strong> <a href="javascript:;" class="pai-cur">默认</a>
					<a href="javascript:;">价格 &or;</a> <a href="javascript:;">最新
						&or;</a>
				</div>
			</form>
			<!--pro-search/-->
		</div>
		<!--width1190/-->
		<div class="width1190">
		<c:forEach items="${sessionScope.house}" var="h">
			<div class="pro-left">
				<dl>
					<dt>
						<a href="../queryHouseInfo.do?id=${h.house_id}"><img src="../image/${h.img_name}" width="286"
							height="188" /></a>
					</dt>
					<dd>
						<h3>
							<a href="../queryHouseInfo.do?id=${h.house_id}">${h.house_title}</a>
						</h3>
						<div class="pro-wei">
							<img src="images/weizhi.png" width="12" height="16" /> <strong
								class="red">${h.house_estate}</strong>
						</div>
						<div class="pro-fang">${h.house_storey}</div>
						<div class="pra-fa">发布人${h.house_user}  联系电话：${h.house_phone}</div>
					</dd>
					<div class="price">
						¥ <strong>${h.house_rentMoney}</strong><span class="font12">元/月</span>
					</div>
					<div class="clears"></div>
				</dl>
				
			</div>
			</c:forEach>
			<!--pro-left/-->
			<div class="clears"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--content/-->

	<!-- 尾部 -->


	<div class="footer">
		<div class="ng-promise-box">
			<div class="ng-promise w1200">
				<p class="text">
					<a class="icon1" href="javascript:;">无中间商赚差价</a> <a class="icon2"
						href="javascript:;">接送实地查看房源</a> <a class="icon3"
						style="margin-right: 0" href="javascript:;">100%品质保证</a>
				</p>
			</div>
		</div>
		<div class="mod_help w1200">
			<p>
				<a href="javascript:;">关于我们</a> <span>|</span> <a
					href="javascript:;">帮助中心</a> <span>|</span> <a href="javascript:;">售后服务</a>
				<span>|</span> <a href="javascript:;">家居资讯</a> <span>|</span> <a
					href="javascript:;">关于装修</a>
			</p>
			<p class="coty">星辰租房版权所有 &copy; 2018-2118</p>
		</div>
	</div>

	<!-- 尾部 -->


</body>
</html>

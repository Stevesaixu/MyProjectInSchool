<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
	$(function() {
		//导航定位
		//$(".nav li:eq(6)").addClass("navCur");
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
		<div class="width1190" style="width: 1000px;">
			<div class="proImg fl">
				<img src="../image/${sessionScope.house.img_name}" />
			</div>
			<!--proImg/-->
			<div class="proText fr">
				<h3 class="proTitle">${sessionScope.house.house_title} </h3>
				<div class="proText1">
					租户：${sessionScope.house.house_user}<br /> 户型：${sessionScope.house.house_type}<br /> 面积：${sessionScope.house.house_large}<br />
					楼层：${sessionScope.house.house_floor}<br /> 装修：${sessionScope.house.house_decorate}<br />地理位置：${sessionScope.house.house_address}<br />
					小区：${sessionScope.house.house_estate}

				</div>
				<div class="xun-car">
					<a href="javascript:;" class="xwjg">¥<strong>${sessionScope.house.house_rentMoney}</strong>元
					</a> <a href="javascript:;" class="projrgwc">${sessionScope.house.house_phone}</a>
				</div>
				<!--xun-car/-->
			</div>
			<!--proText/-->
			<div class="clears"></div>
		</div>
		<!--width1190/-->
		<div class="proBox" style="width: 1000px; margin: 10px auto;">
			<div class="proEq">
				<ul class="fl">
					<li class="proEqCur">房源详情</li>
					<li>房源问答</li>
				</ul>
				<div class="lxkf fr">
					<a
						href="http://wpa.qq.com/msgrd?v=3&uin=1072631488&site=qq&menu=yes"
						target="_blank"></a>
				</div>
				<div class="clears"></div>
			</div>
			<!--proEq/-->
			
				<div class="proList">
	
					枝江，是王松华仕途的重要一站。担任枝江市委书记期间，王松华起早贪黑，展现出过人的能力。调查人员告诉记者，枝江市能位居湖北省“十强县”之列，王松华立下汗马功劳。以江汉大道的修建为例，当年修建的时候，规划比较保守，唯有王松华力排众议，决定拓宽车道，引来非议一片。然而，几年过去，枝江经济社会快速发展，再回看这条路，人们都认为王松华有眼光，更有甚者，认为该路应该再修宽一些。<br />
					枝江成就了王松华，正是凭着在枝江任职时期的政绩，王松华被提拔为副厅级干部。但某种程度上说，又是枝江“毁了”王松华，也正是在枝江时期，王松华性格中的负面因素被不断放大，长时间的唯我独尊，让他养成了独断专行、骄傲跋扈、自以为是的作风，这为他日后的严重违纪埋下了伏笔。<br />
					2006年，王松华迎来了人生中的十字路口。当时，正值市县换届，踌躇满志的他满心以为能“更进一步”，不料却与宜昌市委常委的职务失之交臂。<br />
					这样的挫折，本是一个契机。如果泰然处之，反躬自省，人生未尝不能有所精进。然而，王松华无法接受这样的结果，他认为组织不公，怨天尤人。即便是2007年初，组织提拔其为宜昌市经济技术开发区管委会主任（副厅级），他依然精神萎靡，公开宣称“不想来这里”。<br />
					而在这之后，尽管王松华多方“运作”，但又与两次“进步”机会擦肩而过。连续三次受挫，对他打击严重，让他心理彻底失衡，从此一蹶不振。<br />
					“我当时像疯了一样。”王松华这样形容自己当时的状态。有一次，宜昌市某市领导到开发区视察工作，本应出面接待的他坚决不去，并愤愤不平地说：“我去陪他干嘛？！他的位子本来应该是我的！！”<br />
					<c:forEach items="${sessionScope.img}" var="i">
					<img src="../image/${i.img_name}" width="286" height="188"/>
					</c:forEach>
				</div>
		
			<!--proList/-->
			<div class="proList">
				<div class="message">
					<dl>
						<dt>您这个房子有什么问题么</dt>
						<dd>发表人：老李房源</dd>
						<dd>发表时间：2018-12-22</dd>
						<c:if test="${suggest.replyCon != null && suggest.replyCon != ''}">
							<dd>回复内容：没什么问题,就是不能住</dd>
						</c:if>
						<dd>回复时间：2018-12-22</dd>
					</dl>
					<dl>
						<dt>您这个房子有什么问题么</dt>
						<dd>发表人：老李房源</dd>
						<dd>发表时间：2018-12-22</dd>
						<c:if test="${suggest.replyCon != null && suggest.replyCon != ''}">
							<dd>回复内容：没什么问题,就是不能住</dd>
						</c:if>
					</dl>
					<dl>
						<dt>您这个房子有什么问题么</dt>
						<dd>发表人：老李房源</dd>
						<dd>发表时间：2018-12-22</dd>
						<c:if test="${suggest.replyCon != null && suggest.replyCon != ''}">
							<dd>回复内容：没什么问题,就是不能住</dd>
						</c:if>
					</dl>
				</div>
				<div style="margin-top: 90px;">
					<input id="problem" name="problem" type="text"
						style="line-height: 30px; height: 30px; width: 415px; padding: 4px; bottom: 70px; left: 200px;"
						value placeholder="请输入问题内容" /> <a href="javascript:;"
						class="xwjg1"
						style="line-height: 48px; bottom: 66px; left: 649px;"
						onclick="problem()">发布问题</a>
				</div>

			</div>
			<!--proList/-->
		</div>
		<!--proBox/-->
	</div>
	<!--content/-->


	<div class="copy">
		Copyright@ 2015 邻居大妈 版权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a
			target="_blank" href="http://www.webqin.net/">秦王网络</a>
	</div>
	<script>
		function problem() {
			var id = $
			{
				userId
			}
			;
			if (id == null || id == '' || id == 0) {
				layer.msg(decodeURI("请登录后留言"));
				/* location.href = '${WebPath }/index/login.action'; */
			} else {
				var problem = document.getElementById("problem").value;
				var str = /^[，。,.：:!！？“”?A-Za-z0-9\u4e00-\u9fa5]+$/;
				if (problem == "" || problem == null) {
					layer.msg(decodeURI("请输入留言内容"));
				} else if (!str.test(problem)) {
					layer.msg(decodeURI("请输入正确的中文"));
					return;
				} else {
					location.href = '${WebPath }/index/saveSuggest.action?problem='
							+ problem;
				}
			}
		}
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
  <script type="text/javascript" src="res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
   <link rel="stylesheet" href="layui/dist/css/layui.css"  media="all">
  
</head>
<script src="layui/dist/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: '778px'
    ,height: '440px'
    ,interval: 5000
  });
  
  //事件
  carousel.on('change(test4)', function(res){
    console.log(res)
  });
  
  var $ = layui.$, active = {
    set: function(othis){
      var THIS = 'layui-bg-normal'
      ,key = othis.data('key')
      ,options = {};
      
      othis.css('background-color', '#5FB878').siblings().removeAttr('style'); 
      options[key] = othis.data('value');
      ins3.reload(options);
    }
  };
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });
  
  $('.demoSet').on('keyup', function(){
    var value = this.value
    ,options = {};
    if(!/^\d+$/.test(value)) return;
    
    options[this.name] = value;
    ins3.reload(options);
  });
  
  //其它示例
 $('.demoTest .layui-btn').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  }); 
});
</script>

<body>

	<!-- head -->
<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
        
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
        <div class="sp-cart"><a href="shopcart.html">订单</a><span>2</span></div>
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" >
            	
            <img src="../image/xu.jpg"  height="60px" width="60px" />
            星辰租房
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的租房信息">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <ul class="layui-nav ">
          	<li class="layui-nav-item">
          	<a href="commodity.html">区域找房</a>
          		<dl class="layui-nav-child">
			      <dd><a href="">南湖广场</a></dd>
			      <dd><a href="">红旗街</a></dd>
			      <dd><a href="">长春火车站</a></dd>
			    </dl>
			</li>
			<li class="layui-nav-item">
            	<a href="commodity.html" >地铁找房</a>
	            	<dl class="layui-nav-child">
				      <dd><a href="">地铁一号线工农大路站</a></dd>
				      <dd><a href="">地铁一号线长春站</a></dd>
				      <dd><a href="">地铁二号线磐石路站</a></dd>
				    </dl>
            </li>
            <li class="layui-nav-item">
            	<a href="buytoday.html">小区</a>
            </li>
            <li class="layui-nav-item">
            	<a href="information.html">品牌公寓</a>
            </li>
            <li class="layui-nav-item">
            	<a href="about.html">关于我们</a>
            </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    
    <!-- head -->
    
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form" action="../selectByPhone.do">
            <legend>手机号登录</legend>
            <div class="layui-form-item">
              <div class="layui-inline iphone">
                <div class="layui-input-inline">
                  <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                  <input type="tel" name="phone" id="phone" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                  <input id="pnum" type="text" name="verificationCode" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input"  onchange="changeCode()">
                  <label id="verificationCodeMsg" ></label> 
                  <input type="button" class="layui-btn" id="find"  value="验证码"  onclick="validateCode()"/>
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
              	<input type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" value="登录"/>
              	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              	<a class="layui-btn"  href="regist.jsp"/>注册</a>
              </div>
          
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" onclick="window.location='../adm/adm_login.jsp'">管理员登录</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
	
	
	<!-- 尾部 -->
	
	
  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">无中间商赚差价</a>
          <a class="icon2" href="javascript:;">接送实地查看房源</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">家居资讯</a>
        <span>|</span>
        <a href="javascript:;">关于装修</a>
      </p>
      <p class="coty">星辰租房版权所有 &copy; 2018-2118</p>
    </div>
  </div>
  
  <!-- 尾部 -->
  
  
  <script type="text/javascript">
   layui.config({
      base: 'res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','form'],function(){
          var $ = layui.$,form = layui.form;


        $("#find").click(function() {
            if(!/^1\d{10}$/.test($("#phone").val())){
              layer.msg("请输入正确的手机号");
              return false;
            }
            var obj=this;
            $.ajax({
                type:"get",
                url:"../json/login.json",
                dataType:"json",//返回的
                success:function(data) {
                    
                    if(data.result){
                        $("#find").addClass(" layui-btn-disabled");
                        $('#find').attr('disabled',"true");
                        settime(obj);
                        $("#msg").text(data.msg);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(msg) {
                    console.log(msg);
                }
            }); 
        })
        var countdown=60; 
        function settime(obj) { 
        if (countdown == 0) { 
            obj.removeAttribute("disabled"); 
            obj.classList.remove("layui-btn-disabled")
            obj.value="获取验证码"; 
            countdown = 60; 
            return;
        } else { 
            
            obj.value="重新发送(" + countdown + ")"; 
            countdown--; 
        } 
        setTimeout(function() { 
            settime(obj) }
            ,1000) 
        }
    })
    
    function validateCode(){
		var charactors="ab1cd2ef3gh4ij5kl6mn7opq8rst9uvw0xyz";
		var value='',i;
		for(j=1;j<=4;j++){
			i = parseInt(35*Math.random());
			value = value + charactors.charAt(i);
		}
		document.getElementById("verificationCodeMsg").innerHTML = value;
		code=value;
	}
	function changeCode(){
		var value=document.getElementById("verificationCode").value;
		
		if(value){
			if(value!=code){
				document.getElementById("verificationCodeMsg").innerHTML='<font color="red">对不起验证码错误</font>';
				return false;
			}
		}else{
			document.getElementById("verificationCodeMsg").innerHTML='<font color="red">对不起验证码不能为空</font>';
			return false;
		}
		return true;
	}
  </script>

</body>
</html>
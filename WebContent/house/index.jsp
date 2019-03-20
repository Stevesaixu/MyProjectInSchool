<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/house"; %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>/res/layui/css/layui.css">
  <script type="text/javascript" src="<%=basePath%>/res/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <link rel="stylesheet" href="<%=basePath%>/layui/dist/css/layui.css"  media="all">
  <!-- <link type="text/css" href="../css/css.css" rel="stylesheet" /> -->
	<!-- <script type="text/javascript" src="../js/jquery.js"></script> -->
	<!--<script type="text/javascript" src="../js/js.js"></script> -->
  
</head>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
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
<style>
.ads{
	text-align:left
	color:#00F 

}


</style>
<body id="list-cont">


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
            <img src="<%=path %>/image/xu.jpg"  height="60px" width="60px" />
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
  <div class="content content-nav-base about-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
         	<a href="../queryHousePre.do">所有房源</a>
            <a href="<%=path %>/house/buytoday.html">最新房源</a>
            <a href="<%=path %>/house/information.html">房源资讯</a>
            <a href="<%=path %>/house/about.html"  class="active">关于我们</a>
          </div>
        </div>
      </div>
    </div>
   
   <!-- head -->
    
    <!-- 图片轮播 -->
    
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="<%=path %>/image/house.jpg"  height="300px" width="250px">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/jingzhuang1.jpg" ></a>
                    <div class="title">精装品质别墅</div>
                    <div class="ads" >
                      <span>280平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>六环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/fanhua1.jpg"></a>
                    <div class="title">繁华街区</div>
                    <div class="ads">
                      <span>60平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>三环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/jiaoqu1.jpg"></a>
                    <div class="title">安静舒适</div>
                    <div class="ads">
                      <span>120平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>六环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/jiaotong1.jpg"></a>
                    <div class="title">近火车站</div>
                    <div class="ads">
                      <span>80平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>火车站附近</span>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/jiaoqu2.jpg"></a>
                    <div class="title">精装舒适</div>
                    <div class="ads">
                      <span>100平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>五环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/fanhua2.jpg"></a>
                    <div class="title">繁华街区精装</div>
                    <div class="ads">
                      <span>60平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>二环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/jiaoqu3.jpg"></a>
                    <div class="title">精装薰衣草主题舒适</div>
                    <div class="ads">
                      <span>150平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>七环</span>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="<%=path %>/image/fanhua4.jpg"></a>
                    <div class="title">繁华街区小清新</div>
                    <div class="ads">
                      <span>70平米</span>
                      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                      <span>四环</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>

	<!-- 第一模块 房源推荐 -->

    <div class="hot-recommend-con">
       <div class="hot-con1 w1200 layui-clear">
          <div class="item">
            <h4>热门房源推荐</h4>
            <div class="big-img">
              <a href="javascript:;"><img src="<%=path %>/image/jiaoqu5.jpg" height="350px" width="350px"></a>
            </div>
          </div>
          <div class="item">
            <div class="top-img">
              <a href="javascript:;"><img src="<%=path %>/image/fanhua3.jpg" height="220px" width="350px"></a>
            </div>
            <div class="bottom-img">
              <a href="javascript:;"><img src="<%=path %>/image/fanhua5.jpg" height="210px" width="170px"></a>
              <a class="baby-cream" href="javascript:;"><img src="<%=path %>/image/jiaotong2.jpg" height="210px" width="170px"></a>
            </div>
          </div>
          <div class="item item1 margin0 padding0">
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu4.jpg" height="235px" width="250px"></a>
            <a href="javascript:;"><img class="btm-img" src="<%=path %>/image/jiaotong4.jpg" height="235px" width="250px"></a>
          </div>
      </div>
    </div>

	
	<!-- 第二模块  1F -->

    <div class="product-cont w1200" id="product-cont">
      <div class="product-item product-item1 layui-clear">
        <div class="left-title">
          <h4><i>1F</i></h4>
          <img src="<%=path %>/image/icon4.jpg">
          <h5>繁华街区</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="<%=path %>/image/ban.jpg" alt="" height="235px" width="1000px"> </a>
          <div class="img-box">
            <a href="javascript:;"><img src="<%=path %>/image/fanhua1.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/fanhua2.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/fanhua3.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/fanhua4.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/fanhua5.jpg"></a>
          </div>
        </div>
      </div>
      
      
      <!-- 第三模块  2F -->
      
      <div class="product-item product-item2 layui-clear">
        <div class="left-title">
          <h4><i>2F</i></h4>
          <img src="<%=path %>/image/icon4.jpg">
          <h5>幽静郊区</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="<%=path %>/image/ban.jpg" alt="" height="235px" width="1000px"></a>
          <div class="img-box">
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu1.jpg"></a>
            
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu2.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu3.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu4.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaoqu5.jpg"></a>
          </div>
        </div>
      </div>
      
      
      <!-- 第四模块  3F -->
      
      <div class="product-item product-item3 layui-clear">
        <div class="left-title">
          <h4><i>3F</i></h4>
          <img src="<%=path %>/image/icon4.jpg">
          <h5>交通枢纽</h5>
        </div>
        <div class="right-cont">
          <a href="javascript:;" class="top-img"><img src="<%=path %>/image/ban.jpg" alt="" height="235px" width="1000px"></a>
          <div class="img-box">
            <a href="javascript:;"><img src="<%=path %>/image/jiaotong1.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaotong2.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaotong3.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaotong4.jpg"></a>
            <a href="javascript:;"><img src="<%=path %>/image/jiaotong5.jpg"></a>
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
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','carousel'],function(){
      var carousel = layui.carousel,
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
      // 模版引擎导入
     // var ins = carousel.render(option);
     // var html = demo.innerHTML;
     // var listCont = document.getElementById('list-cont');
     // // console.log(layui.router("#/about.html"))
     //  mm.request({
     //    url: '../json/index.json',
     //    success : function(res){
     //      console.log(res)
     //      listCont.innerHTML = mm.renderHtml(html,res)
     //      ins.reload(option);
     //    },
     //    error: function(res){
     //      console.log(res);
     //    }
     //  })
    

});
  </script>
</body>
</html>
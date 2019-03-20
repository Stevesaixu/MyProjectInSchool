<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link href="../css/index.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/uploadImg.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(6)").addClass("navCur");
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
			<div class="vip-left">
				<div class="vipNav">
					<h3 class="vipTitle">个人中心</h3>
					<dl>
						<dt class="vipIcon3">账户设置</dt>
						<dd>
							<a href="user.html">我的资料</a>
						</dd>
						<dt class="vipIcon1">房源</dt>
						<dd>
							<a href="house_list.html">房源列表</a> 
							<a href="house_add.jsp" class="vipNavCur">发布房源</a>
							<a href="house_ranking.html">问题回答</a>
						</dd>
					</dl>
				</div>
				<!--vipNav/-->
			</div>
			<!--vip-left/-->
			<div class="vip-right">
				<h3 class="vipright-title">上传图片</h3>
							<p>图片格式：GIF、JPG、JPEG、PNG ，最适合尺寸100*100像素</p>
							
			<form action="../addHousePictrue.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="houseId" name="houseId" value="${sessionScope.user.id }"/>
			      <div id="container">
			        <a href="javascript:void(0)" class="file">选择文件
			           <input type='file'  name="file"/>
			           <input type="hidden" />
			         </a>
			      </div>
			      <div id="container2">
			        <a href="javascript:void(0)" class="file">选择文件
			           <input type='file' name="file" />
			           <input type="hidden" />
			         </a>
			      </div>
			       
			      
			    </form>
			    
				<h3 class="vipright-title">发布</h3>
				
				<form id="submitForm" name="submitForm" method="post">
				
				<table class="grinfo">
					<tbody>
						<tr>
							<th><span class="red">*</span> 位置：</th>
							<td><input class="inp inw" type="text" name="house_address"  id="fywz"  placeholder="请输入房源所在位置，例如：红旗街"
								></td>
						</tr>
						<th><span class="red">*</span>小区：</th>
						<td><input class="inp inw" type="text" id="fyxq" name="house_estate" placeholder="请输入房源所在小区"
							></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 房源：</th>
							<td><input class="inp inw" type="text" id="fy" name="house_storey" placeholder="例：露水湖畔xx号楼xx单元xx室"
								></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 楼层：</th>
							<td><input class="inp inw" type="text" id="fylc" name="house_floor" placeholder="例如：12层带电梯（请注明带不带电梯）"
								></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 房源面积：</th>
							<td><input class="inp inw" type="text" id="fymj" name="house_large" placeholder="请输入房源面积"
								></td>
						</tr>
						<tr>
							<th><span class="red"></span> 装修：</th>
							<td><select name="house_decorate" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="精装" selected="selected">精装</option>
	                            <option value="普装">普装</option>
                            </td>
						</tr>
						<tr>
							<th><span class="red"></span> 户型：</th>
							<td><select name="house_type" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="一室一厅一卫" selected="selected">一室一厅一卫</option>
	                            <option value="两室一厅一卫">两室一厅一卫</option>
	                            <option value="三室一厅一卫">三室一厅一卫</option>
	                            <option value="三室两厅一卫">三室两厅一卫</option>
	                            <option value="独栋别墅">独栋别墅</option>
                        	</select></td>
						</tr>
						<tr>
							<th><span class="red"></span> 出租方式：</th>
							<td><select name="house_rentWay" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="整租" selected="selected">整租</option>
	                            <option value="合租">合租</option>
                        	</select></td>
						</tr>
						<tr>
							<th><span class="red"></span> 押金要求：</th>
							<td><select name="house_deposit" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="押一付三" selected="selected">押一付三</option>
	                            <option value="押一付二">押一付二</option>
	                            <option value="押一付一">押一付一</option>
	                        </select></td>
						</tr>
						<tr>
							<th><span class="red"></span> 租金：</th>
							<td><input class="inp inw" type="text" id="fyzj" name="house_rentMoney" placeholder="请输入租金"
								></td>
						</tr>
						<tr>
							<th><span class="red"></span> 户主姓名：</th>
							<td><input  class="inp inw" id="fyhzName" name="house_user"  placeholder="请输入户主姓名" value="${sessionScope.user.name }"
									>
							</td>
						</tr>
						<tr>
							<th><span class="red">*</span> 户主手机号：</th>
							<td><input class="inp inw" type="text" id="fyhzPhone" name="house_phone"  placeholder="请输入户主手机号" value="${sessionScope.user.phone}"
								/></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 状态：</th>
							<td><select name="house_state" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="在建">在建</option>
	                            <option value="待租" selected="selected">待租</option>
	                            <option value="已租" >已租</option>
	                            <option value="欠费">欠费</option>
	                            <option value="其他">其他</option>
	                        </select></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 房源标签：</th>
							<td><select name="house_tag" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
	                            <option value="">--请选择--</option>
	                            <option value="交通便利，近地铁" selected="selected">交通便利，近地铁</option>
	                            <option value="交通便利，近火车站" >交通便利，近火车站</option>
	                            <option value="交通便利，近商场" >交通便利，近商场</option>
	                            <option value="交通便利，繁华街区">交通便利，繁华街区</option>
	                            <option value="交通便利，近公园">交通便利，近公园</option>
	                            <option value="幽静郊区，风景优美，空气清新">幽静郊区，风景优美，空气清新</option>
	                        </select></td>
						</tr>
						<tr>
							<th><span class="red">*</span> 房源标题：</th>
							<td><input class="inp inw" type="text" id="fytitle" name="house_title"   placeholder="例：精装近地铁两室一厅整租好房"
								/></td>
						</tr>

						<tr>
							<th>&nbsp;</th>
							<td colspan="2"><label class="butt" id="butt"> <input
									 id="submitbutton" type="button" class="member_mod_buttom" 
									value="立即发布" />
							</label></td>
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


	<div class="copy">
		Copyright@ 2015 邻居大妈 版权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a
			target="_blank" href="http://www.webqin.net/">秦王网络</a>
	</div>
	
<script type="text/javascript">
$("#submitbutton").click(function() {
	
	if(validateForm()){
		checkFyFhSubmit();
	}
});
/** 检测房源房号是否存在并提交form  **/
function checkFyFhSubmit(){
	// 分别获取小区编号、栋号、层号、房号
	var fy = $('#fy').val();

	if(fy!=""){
		// 异步判断该房室是否存在，如果已存在，给用户已提示哦
		$.ajax({
			type:"POST",
			url:"../queryHouse.do",
			data:{"storey":fy},
			dataType : "text",
			success:function(data){
			    alert(data);
				// 如果返回数据不为空，更改“房源信息”
				if(data != null&&data=="1"){
					 art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'该房室在系统中已经存在哦，\n请维护其他房室数据', ok:true,});
					 $("#fy").css("background", "#EEE");
					 $("#fy").focus();
					 return false;
				}else{					
					$("#submitForm").attr("action", "../addHousePre.do").submit();				
				}
			}
		});
	}
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
<script type="text/javascript">
        var data = [
          {
            "url": 'https://img.alicdn.com/tfs/TB11nHZXWagSKJjy0FgXXcRqFXa-218-46.png'
          },
          {
            "url": 'https://img.alicdn.com/simba/img/TB1WT41SVXXXXaSXpXXSutbFXXX.jpg'
          }
        ];
        var params = {
          container: '#container',
          url: '',
          dragDrop: false,
          data: data,
          onDragLeave: function(target) {
            console.log(111)
          }
        };
        var uploadImg1 = new UploadImg(params);
        
        // 多个情况下
        var params2 = {
          container: '#container2',
          url: ''
        };
        var uploadImg2 = new UploadImg(params2);
      </script>
</body>

</html>

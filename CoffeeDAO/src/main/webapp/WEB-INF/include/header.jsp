<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>CoffeeDAO</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
      <!-- owl stylesheets -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet" />
     
   </head>
   <body>
      <!-- header section start -->
		<div class="header_section">
		
		<!-- 로그인을 하지 않았을 경우 -->
		<c:if test="${ empty MEM_ID && empty SELL_ID }">
			<form class="form-inline my-2 my-lg-0">
			
				<div>
					
				</div>
				<div class="login_menu">
	               <ul>
	                  <li id="login"><a href="loginForm.da">Login</a></li>
	                  <li id="mypage"><a href="loginForm.da"><img src="resources/images/user-icon.png"></a></li>
	                  <li id="cart"><a href="loginForm.da"><img src="resources/images/trolly-icon.png"></a></li>
	               </ul>
	            </div>
			</form>
		</c:if>
		
		<!-- 일반회원으로 로그인했을 경우 -->
		<c:if test="${! empty MEM_ID}">
			<form class="form-inline my-2 my-lg-0">
			
				<div class="login_menu">
	               <ul>
						<li style="color: black;"><%= session.getAttribute("MEM_ID") %>님</li>
						<li id="mypage"><a href="myPage.da"><img src="resources/images/user-icon.png"></a></li>
						<li id="cart"><a href="cartList.da"><img src="resources/images/trolly-icon.png"></a></li>
						<li id="logout"><a href="logout.da"><img width="25px" height="25px" src="resources/images/logout-icon.png"></a>
	               </ul>
	            </div>
			</form>
		</c:if>
		
		<!-- 업체회원으로 로그인했을 경우 -->
		<c:if test="${! empty SELL_ID}">
			<form class="form-inline my-2 my-lg-0">
				<div class="login_menu">
	               <ul>
						<li style="color: black;"><%= session.getAttribute("SELL_ID") %>님</li>
						<li id="mypage"><a href="sellerMyPage.da"><img src="resources/images/user-icon.png"></a></li>
						<li id="logout"><a href="sellerLogout.da"><img width="25px" height="25px" src="resources/images/logout-icon.png"></a>
	               </ul>
	            </div>
			</form>
		</c:if>
		
		<!-- 관리자 -->
		<c:if test="${MEM_ID == 'admin' }">
			<form class="form-inline my-2 my-lg-0">
				<div class="login_menu">
	               <ul>
						<li style="color: black;"><%= session.getAttribute("MEM_ID") %>님</li>
						<li id="mypage"><a href="adminMain.da"><img src="resources/images/user-icon.png"></a></li>
						<li id="logout"><a href="logout.da"><img width="25px" height="25px" src="resources/images/logout-icon.png"></a>
	               </ul>
	            </div>
			</form>
		</c:if>
		
         <div class="banner_logo">
            <a class="logo" href="home.da"><img src="resources/images/logo.png"></a>
         </div>
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="home.da">메인</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="productList.da">상품</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="sellerList.da">로스터리</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="freeTalkList.da">커뮤니티</a>
                        <input type="hidden" id="BO_TYPE" value="N">
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="inquiryList.da">고객센터</a>
                     </li>
                  </ul>
               </div>
            </nav>
            <div class="jb-division-line2"></div>
         </div>
      </div>
      <%@ include file="/WEB-INF/include/include-body.jspf" %>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/coffeedao/resources/js/common.js" charset="utf-8"></script>
   
		<script type="text/javascript">
			$(document).ready(function(){
				$("a[name='notice']").on("click", function(e){
					e.preventDefault();
					fn_BoardList($(this));
				});
			});
			
			function fn_BoardList(obj){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/BoardList.da'/>");
				comSubmit.addParam("BO_TYPE", obj.parent().find("#BO_TYPE").val());
				comSubmit.submit();
			}
		</script>
   </body>
   
			
</html>
      <!-- header section end -->
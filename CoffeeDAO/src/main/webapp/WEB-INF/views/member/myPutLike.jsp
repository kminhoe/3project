<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>

.product-collapsible {
	background-color: transparent;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
}

.img_item {
  border: 1px solid #CC9977;
}

.collapsible_item {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible_item:hover {
  background-color: #555;
}

.content_item {
  padding: 0 18px;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
  max-height: 0;
}

/* 태영 추가 */

.product-container{
	display:flex;
	width:100%;
	height: auto; 
	min-width:1300px;
	max-width:1140px;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	
	overflow: auto;
}

.nav-background {
   display:flex;
   width:300px;
   height: auto;
}

.nav4 {
    float: left;
    width: 90%;
    height: calc(100% - 512px);
    position: sticky;
    top: 30px;
}

.product-content {
	display:flex;
	width: calc(100% - 300px);
	min-width: 1000px;	
	height: 100%;
	overflow: hidden;
}

.product-sidemenu {
    padding: 0 18px;
    overflow: hidden;
    color: black;
    background-color: transparent;
    transition: max-height 0.2s ease-out;
    max-height: 0;
}

.item_area{
	padding-top: 15px;
	padding-left: 15px;
	list-style-type: none;
	float: left;
}

.item_wrapper{
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 308px;
	border-radius: 4px;
	background-color: #fffdf9;
	border: 1px solid rgba(0,0,0,.05);
	box-sizing: border-box;
}

.item_img{
	width: 100%;
	aspect-ratio: 1;
}

.price_text {
    width: 150%;
    text-align: center;
    font-size: 20px;
    color: #363636;
    font-weight: bold;
    padding-top: 20px;
}

.menu_btn1{
cursor: pointer;
background-color: none;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- basic -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- mobile metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1">
	<!-- site metas -->
	<title>Contact</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- bootstrap css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<!-- style css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- Responsive-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
	<!-- fevicon -->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/fevicon.png" type="image/gif" />
	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.min.css">
	<!-- Tweaks for older IEs-->
	<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	<!-- fonts -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- owl stylesheets -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet" />
</head>

<style>
	.jb-division-line4 {
	    border-top: 1px solid #ded3c3;
		margin-top: 30px;
	    width: 1100px; 
	}
</style>

<body>

	<!-- header section start -->
	<%@ include file="../../include/header.jsp" %>
	<!-- header section end -->
	
	<!-- contact section start -->
	<div id="wrap">
	<%@ include file="../../include/mypage_left.jsp" %>
		<div class="content">
				<h1>내 찜</h1>
				<div class="jb-division-line4"></div>
	
				<c:forEach items="${myPutLike}" var="like">
					<li class="item_area">
						<div class="item_wrapper">
							<a href="productDetail.da?ITEM_ID=${like.ITEM_ID}"><img class="item_img" src="${pageContext.request.contextPath}/resources/img/${like.FILE_STD}" alt="image" /></a>
							<input type="hidden" id="ITEM_ID" name="ITEM_ID" value="${like.ITEM_ID}"/>
		                    <input type="hidden" id="LIKE" name="LIKE" value="${like.like}"/>
		                    <div><img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart3.png" /></div>
							<h6 class="price_text"><a href="productDetail.da?ITEM_ID=${like.ITEM_ID}">${like.ITEM_NAME} <br><span style="color: #f75261;">${like.ITEM_200}원</span></a></h6>
						</div>
					</li>
				</c:forEach>
		</div>
	</div>
	<!-- contact section end -->
	
	<!-- footer section start -->
	<!-- footer section end -->
	
	<!-- Javascript files-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugin.js"></script>
	<!-- sidebar -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<!-- javascript --> 
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<!-- owl carousel -->
	<script>
		$(function() {
	
			let like = document.querySelectorAll('#ITEM_ID');
			let image = document.querySelectorAll('#IMAGE');
			let state = document.querySelectorAll('#LIKE');
	
			for (let i = 0; i < like.length; i++) {
	
				image[i].addEventListener("click", function() {
					
					var id = like[i].value;
	
					console.log(like[i].value);
					/* alert(id); */
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myDeleteLike.da' />");
					comSubmit.addParam("UP_ID", id);
					comSubmit.addParam("ITEM_ID", id);
	
					comSubmit.submit();
				});
			}
		});
	</script>
</body>
</html>
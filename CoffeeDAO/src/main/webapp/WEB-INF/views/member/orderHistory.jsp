<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Responsive-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
<!-- fevicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/fevicon.png"
	type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<!-- owl stylesheets -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css"
	rel="stylesheet" />
</head>
<style>
.img_pro {
	width: 20%;
	height: 20%;
}
/* input type date */
input[type="date"]::-webkit-clear-button {
	display: none;
}

input[type="date"]::-webkit-inner-spin-button {
	display: none;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	color: #2c3e50;
}

input[type="date"] {
	appearance: none;
	-webkit-appearance: none;
	color: #95a5a6;
	font-family: "Helvetica", arial, sans-serif;
	font-size: 18px;
	border: 1px solid #ffffff;
	background: #999286;
	padding: 5px;
	display: inline-block !important;
	visibility: visible !important;
	text-align: center;
	width: 200px;
	margin: 10px;
	margin-top: 15px;
}

input[type="date"], focus {
	color: #ffffff;
	box-shadow: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
}
/* orderhistory img */
.orderhistory {
	display: flex;
}

.orderhistory-left {
	float: left;
}

.orderhistory-right {
	float: right;
}

.orderhistory-text {
	margin-left: 50px;
	transform: translateY(10%);
	width: 200px;
	color: #363636;
}

.orderhistory-text2 {
	text-align: center;
	margin-left: 50px;
	transform: translateY(25%);
	width: 300px;
	color: #363636;
}

.orderhistory label {
	margin-top: 25px;
}

.orderhistory-img img {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 5px;
	width: 150px;
	height: 150px;
	background: #ffffff;
}

.orderhistory_bt {
	width: 100px;
	float: left;
	color: #ffffff;
	margin-left: 100px;
	margin-top: 15px;
}

.orderhistory_bt a {
	width: 100%;
	padding: 3px 0px;
	float: left;
	background-color: #999286;
	color: #ffffff;
	text-align: center;
	font-size: 12px;
}

.orderhistory_bt a:hover {
	background-color: #363636;
	color: #ffffff;
}

.jb-division-line4 {
	border-top: 1px solid #ded3c3;
	margin-top: 30px;
	width: 1100px;
}
</style>
<body>

	<!-- header section start -->
	<%@ include file="../../include/header.jsp"%>
	<!-- header section end -->

	<!-- contact section start -->
	<div id="wrap">
		<%@ include file="../../include/mypage_left.jsp"%>
		<div class="content">
			<h1>구독 내역</h1>
			<div class="jb-division-line4"></div>
			구독한 상품이 없습니다.
			<div class="jb-division-line4"></div>
			<br>
			<br>
			<h1>주문조회</h1>
			<div class="jb-division-line4"></div>
			<br>

			<!-- 날짜 조회 -->
			<div class="orderhistory">
				<form id="dateForm" name="dateForm"
					action="/coffeedao/orderhistory.da" method="POST">
					<label for="DATE_START" style="font-size: 16px">시작 날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="date" id="DATE_START" name="DATE_START"
						value="${start}">&nbsp;&nbsp;&nbsp;&nbsp; <label
						for="DATE_END" style="font-size: 16px">종료 날짜</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="date" id="DATE_END" name="DATE_END" value="${end}">
					<button type="submit" class="send_bt orderhistory-right">
						<a>조회</a>
					</button>
					<br>
				</form>
			</div>
			<div class="jb-division-line4"></div>
			<br>
			<c:forEach items="${orderList}" var="list">
				<!-- 주문 내역 리스트 -->
				<div class="orderhistory">
					<div class="orderhistory-left">
						<div class="orderhistory-img">
							<img class="img_pro"
								src="${pageContext.request.contextPath}/resources/img/${list.FILE_STD}">
						</div>
					</div>
					<div class="orderhistory-left orderhistory-text">
						${list.ORDER_ITEM}<br> ${list.ORDER_PRICE}원<br>
						${list.ORDER_COUNT}개<br> ${list.ORDER_STATE}<br>
						<fmt:formatDate value="${list.ORDER_DATE}" pattern="yyyy.MM.dd" />
					</div>

					<div class="orderhistory-left orderhistory-text2">
						${list.SELL_NAME}<br> ${list.SELL_PHONE}<br>
						<div class="orderhistory_bt">
							<a href="inquiryWriteForm.da">문의하기</a>
						</div>
					</div>
					<!-- 주문완료, 배송중, 배송완료 -->
					<div class="orderhistory-right">
						<c:choose>
							<c:when test="${list.ORDER_STATE == '주문완료'}">
								<br>
								<br>
								<%-- <div class="orderhistory_bt"><a target="_blank" onclick="openPop(${list.ORDER_ID})">주문취소</a></div><br> --%>
								<form action="/coffeedao/orderState.da" method="post">
									<input type="hidden" name="ORDER_ID" value="${list.ORDER_ID}">
									<input type="hidden" name="ORDER_STATE" value="주문취소">
									<button type="submit" class="orderhistory_bt"
										onclick="alert('판매자와 협의 없이 신청 시에는 주문취소 처리가 되지 않을 수 있습니다.')">
										<a>주문취소</a>
									</button>
									<br>
								</form>
							</c:when>
							<c:when test="${list.ORDER_STATE == '배송중'}">
								<div class="orderhistory_bt">
									<a href="#">배송조회</a>
								</div>
								<br>
								<%-- <div class="orderhistory_bt"><a target="_blank" onclick="openPop(${list.ORDER_ID})">주문취소</a></div><br> --%>
								<form action="/coffeedao/orderState.da" method="post">
									<input type="hidden" name="ORDER_ID" value="${list.ORDER_ID}">
									<input type="hidden" name="ORDER_STATE" value="주문취소">
									<button type="submit" class="orderhistory_bt"
										onclick="alert('판매자와 협의 없이 신청 시에는 주문취소 처리가 되지 않을 수 있습니다.')">
										<a>주문취소</a>
									</button>
									<br>
								</form>
								<form action="/coffeedao/orderState.da" method="post">
									<input type="hidden" name="ORDER_ID" value="${list.ORDER_ID}">
									<input type="hidden" name="ORDER_STATE" value="구매확정">
									<button type="submit" class="orderhistory_bt"
										onclick="alert('구매확정 되었습니다.')">
										<a>구매확정</a>
									</button>
									<br>
								</form>
							</c:when>
							<c:when test="${list.ORDER_STATE == '배송완료'}">
								<div class="orderhistory_bt">
									<a href="#">배송조회</a>
								</div>
								<br>
								<%-- <div class="orderhistory_bt"><a target="_blank" onclick="openPop(${list.ORDER_ID})">주문취소</a></div><br> --%>
								<form action="/coffeedao/orderState.da" method="post">
									<input type="hidden" name="ORDER_ID" value="${list.ORDER_ID}">
									<input type="hidden" name="ORDER_STATE" value="주문취소">
									<button type="submit" class="orderhistory_bt"
										onclick="alert('판매자와 협의 없이 신청 시에는 주문취소 처리가 되지 않을 수 있습니다.')">
										<a>주문취소</a>
									</button>
									<br>
								</form>
								<form action="/coffeedao/orderState.da" method="post">
									<input type="hidden" name="ORDER_ID" value="${list.ORDER_ID}">
									<input type="hidden" name="ORDER_STATE" value="구매확정">
									<button type="submit" class="orderhistory_bt"
										onclick="alert('구매확정 되었습니다.')">
										<a>구매확정</a>
									</button>
									<br>
								</form>
							</c:when>
							<c:when test="${list.ORDER_STATE == '구매확정'}">
								<br>
								<br>
								<div class="orderhistory_bt">
									<p
										style="color: #666666; font-size: 14px; font-family: 'Poppins', sans-serif; line-height: 1.80857; font-weight: normal;">구매확정</p>
								</div>
								<br>
							</c:when>
							<c:when test="${list.ORDER_STATE == '주문취소'}">
								<br>
								<br>
								<div class="orderhistory_bt">
									<p
										style="color: #666666; font-size: 14px; font-family: 'Poppins', sans-serif; line-height: 1.80857; font-weight: normal;">취소처리</p>
								</div>
								<br>
							</c:when>
							<c:when test="${list.ORDER_STATE == '취소완료'}">
								<br>
								<br>
								<div class="orderhistory_bt">
									<p
										style="color: #666666; font-size: 14px; font-family: 'Poppins', sans-serif; line-height: 1.80857; font-weight: normal;">취소완료</p>
								</div>
								<br>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="jb-division-line4"></div>
				<br>
			</c:forEach>
		</div>
	</div>
	<!-- contact section end -->

	<!-- footer section start -->
	<!-- footer section end -->

	<!-- Javascript files-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/plugin.js"></script>
	<!-- sidebar -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<!-- javascript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<!-- owl carousel -->

	<script type="text/javascript">
		function openPop(orderid) {
			var popup = window
					.open(
							'/coffeedao/orderReturn.da?orderid=' + orderid,
							'반품/취소',
							'top=10, left=10, width=700, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		}
	</script>
</body>
</html>
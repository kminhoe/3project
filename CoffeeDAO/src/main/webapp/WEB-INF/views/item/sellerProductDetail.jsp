<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp"%>
<!-- taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품 상세보기</title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
	function dsubmit() {
		aa.submit();
		alert("삭제되었습니다.");
	}
</script>
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

*, *:before, *:after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background:;
	font-family: 'Open Sans', sans-serif;
}

table {
	border-collapse: collapse;
	border: none;
	width: 100% word-break:break-all;
	margin: 0px 0px 0px 0px;
}

th, td {
	border: px solid #aaa;
	background-clip: padding-box;
	scroll-snap-align: start;
}

tbody tr:last-child th, tbody tr:last-child td {
	border-bottom: 1;
}

thead {
	z-index: 1000;
	position: relative;
	text-align: center;
}

th, td {
	min-width: 6rem;
	text-align: center;
	margin: 0;
	padding: 10px;
	border-bottom: 1px solid;
}

thead th {
	position: sticky;
	top: 0;
	border-top: 0;
	background-clip: padding-box;
}

thead th.pin {
	left: 0;
	z-index: 1001;
	border-left: 0;
}

tbody th {
	background-clip: padding-box;
	border-left: 1;
}

tbody {
	z-index: 10;
	position: relative;
}

tbody th {
	position: sticky;
	left: 0;
}

thead th, tbody th {
	background-color: #f8f8f8;
}

table {
	border: none;
}

tr, td {
	border-bottom: 1px solid;
	border-top: 1px solid;
}

.imgItem {
	float: left;
	width: 100px;
	height: 100px;
	object-fit: contain;
}

input[type=text], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=password], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #B2BEB5;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

textarea {
	width: 70%;
	height: 200px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
	background-color: #f8f8f8;
	resize: none;
}

button {
	background-color: #B2BEB5;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
</head>

<body>
	<div id="wrap">
		<%@ include file="../../include/sellerMypage_left.jsp"%>
		<div class="content" style="height: 100%;">
			<div align="center" class="col-md-12">
				<h1 class="login_taital">상품코드 ${list[0].ITEM_ID}</h1>
				<br> <br>
			</div>
			<div class="container">
				<div class="register_center"></div>
				<form id="aa" method="POST">
					<table style="margin: 0px 0px 0px 0px; width: 100%;">
						<tr>
							<th>상품코드</th>
							<td style="font-weight: bold;">${list[0].ITEM_ID}</td>
						</tr>
						<tr>
							<th>상품이미지<br>- 썸네일
							</th>
							<td><br> <img src="resources/img/${list[0].FILE_STD}"
								width="300px" height="200px"> <br>${list[0].FILE_ORG}<br>
								<br></td>
						</tr>
						<tr>
							<th>상품이미지<br>- 디테일
							</th>
							<td><br> <img src="resources/img/${list[1].FILE_STD}"
								width="300px" height="200px"> <br>${list[1].FILE_ORG}<br>
								<br></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>${list[0].ITEM_NAME}</td>
						</tr>
						<tr>
							<th>가격 200g</th>
							<td>${list[0].ITEM_200}원</td>
						</tr>
						<tr>
							<th>가격 500g</th>
							<td>${list[0].ITEM_500}원</td>
						</tr>
						<tr>
							<th>상세설명</th>
							<td>${list[0].ITEM_CONT}</td>
						</tr>
						<tr>
							<th>원두 맛</th>
							<td>${list[0].ITEM_TASTE}맛</td>
						</tr>
						<tr>
							<th>원두 종류</th>
							<td>${list[0].ITEM_TYPE}</td>
						</tr>
						<tr>
							<th>카페인 유무</th>
							<td>${list[0].ITEM_CAF}</td>
						</tr>
						<tr>
							<th>제조 회사</th>
							<td>${list[0].ITEM_COMP}</td>
						</tr>
						<tr>
							<th>원산지</th>
							<td>${list[0].ITEM_LOC}</td>
						</tr>
						<tr>
							<th>구독 서비스</th>
							<td>${list[0].ITEM_SUB}</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>${list[0].ITEM_DATE}</td>
						</tr>
					</table>
					<input type="hidden" name="ITEM_ID" value="${list[0].ITEM_ID}">
					<input type="hidden" name="SELL_ID" value="${list[0].SELL_ID}">
					<br>
					<div>
						<div style="display: inline-block; float: left;">
							<button class="register_button" type="button"
								id="sellerProductList"
								onClick="location.href='sellerProductList.da'">돌아가기</button>
						</div>
					</div>
					<div>
						<div style="display: inline-block; float: right;">
							<button class="register_button" type="submit"
								formaction="productDeletePro.da" onclick="dsubmit();">삭제</button>
						</div>
					</div>
					<div>
						<div
							style="display: inline-block; float: right; margin-right: 4px;">
							<button class="register_button" type="submit"
								formaction="productUpdateForm.da">수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<br>
<%@ include file="../../include/footer.jsp"%>
</html>
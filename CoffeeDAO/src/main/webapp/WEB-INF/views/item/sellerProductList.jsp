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
<title>내 상품 리스트</title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	function paging(nowPage) {
		location.href = "/coffeedao/sellerProductList.da?nowPage=" + nowPage;
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
	word-break: break-all;
}

th, td {
	border: px solid #aaa;
	background-clip: padding-box;
	scroll-snap-align: start;
}

tbody tr:last-child th, tbody tr:last-child td {
	border-bottom: 0;
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
	border-left: 0;
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
}

.imgItem {
	float: left;
	width: 200px;
	height: 200px;
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

.paging_button {
	font-size: 20px;
	margin-right: 10px;
}
</style>
</head>

<body>
	<div id="wrap">
		<%@ include file="../../include/sellerMypage_left.jsp"%>
		<div class="content" style="height: 100%;">
			<div align="center" class="col-md-12">
				<h1 class="login_taital">내 상품 리스트</h1>
			</div>
			<div class="container">
				<div style="float: left; font-size: 15px;">
					<button
						style="background-color: #B2BEB5; padding: 1px 20px; margin: 5px 5px; border: none; color: white; text-decoration: none; cursor: pointer;"
						onclick="location.href='productWriteForm.da'">상품 등록하기</button>
					[총 상품 수 : ${pagination.totalItem}개]
				</div>
				<table style="margin: 0px 0px 0px 0px; width: 100%;">
					<thead>
						<tr style="border: none;">
							<th style="width: 45px;">번호</th>
							<th style="width: 90px;">상품코드</th>
							<th>상품이미지</th>
							<th>상품명</th>
							<th style="width: 150px;">가격 200g</th>
							<th style="width: 150px;">가격 500g</th>
							<th style="width: 80px;">등록일</th>
							<th style="width: 100px;">수정/삭제</th>
							<th style="width: 100px;">답글등록</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="item">
									<tr>
										<td style="font-weight: bold;">${item.RN}</td>
										<td>${item.ITEM_ID}</td>
										<td><img class="imgItem"
											src="resources/img/${item.FILE_STD}" width="200px"
											height="150px"></td>
										<td>${item.ITEM_NAME}</td>
										<td>${item.ITEM_200}원</td>
										<td>${item.ITEM_500}원</td>
										<td>${item.ITEM_DATE}</td>
										<td><a class="register_button"
											style="font-size: 15px; margin-left: 2px; margin-right: 2px; background-color: #B2BEB5; color: white; padding: 5px 10px;"
											href="/coffeedao/sellerProductDetail.da?ITEM_ID=${item.ITEM_ID}&SELL_ID=${item.SELL_ID}">상세보기</a></td>
										<td><a class="register_button"
											style="font-size: 15px; margin-left: 2px; margin-right: 2px; background-color: #B2BEB5; color: white; padding: 5px 10px;"
											href="/coffeedao/sellerProductReview.da?ITEM_ID=${item.ITEM_ID}&SELL_ID=${item.SELL_ID}">리뷰보기</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr style="border: none">
									<td colspan=9 " style="text-align: center; height: 100px;">등록한
										상품이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br>
				<div style="display: inline-block; float: left;">
					<button class="register_button" type="button"
						onClick="location.href='sellerMyPage.da'">마이페이지</button>
				</div>
				<div style="display: inline-block; float: right;">
					<button class="register_button" type="button"
						onclick="location.href='productWriteForm.da'">상품 등록</button>
				</div>

				<!-- 페이징 -->
				<div style="text-align: center;">
					<c:if test="${pagination.nowPage ne 1}">
						<a class="paging_button" href="#"
							onClick="paging('${pagination.prevPage}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPagePerLine}"
						end="${pagination.endPagePerLine}">
						<c:choose>
							<c:when test="${pageNum eq pagination.nowPage}">
								<span class="paging_button"
									style="font-weight: bold; color: black;"><a href="#"
									onClick="paging('${pageNum}')">${pageNum}</a></span>
							</c:when>
							<c:otherwise>
								<a class="paging_button" href="#" onClick="paging('${pageNum}')">${pageNum}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination.nowPage ne pagination.totalPage && pagination.endPagePerLine > 1}">
						<a class="paging_button" href="#"
							onClick="paging('${pagination.nextPage}')">[다음]</a>
					</c:if>
				</div>
				<br>
			</div>
		</div>
	</div>
</body>
<br>
<%@ include file="../../include/footer.jsp"%>
</html>
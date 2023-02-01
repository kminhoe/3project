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
<title></title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	function paging(nowPage, ITEM_ID) {
		var ITEM_ID = ${list[0].RE_ITEM};
		location.href = "/coffeedao/sellerProductReview.da?nowPage=" + nowPage
				+ "&ITEM_ID=" + ITEM_ID;
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
	width: 100%;
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
	border-top: 1;
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
	object-fit: cover;
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
				<h1 class="login_taital">리뷰 리스트 - 상품코드 ${list[0].RE_ITEM}</h1>
			</div>
			<div class="container">
				<h5 style="font-size: 15px;">[총 리뷰 수 :
					${pagination.totalReview}개]</h5>
				<table style="margin: 0px 0px 0px 0px; width: 100%;">
					<thead>
						<tr style="border: none;">
							<th style="width: 45px;">번호</th>
							<th style="width: 90px;">리뷰코드</th>
							<th style="width: 150px;">회원명</th>
							<th>내용</th>
							<th style="width: 80px;">등록일</th>
							<th style="width: 100px;">답글관리</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(list) > 0}">
								<c:forEach items="${list}" var="review">
									<tr style="height: 150px;">
										<td style="font-weight: bold;">${review.RN}</td>
										<td>${review.RE_IDX}</td>
										<td>${review.RE_MEM}</td>
										<td>${review.RE_CONTENT}</td>
										<td>${review.RE_DATE}</td>
										<td><a class="register_button"
											style="font-size: 15px; margin-left: 2px; margin-right: 2px; background-color: #B2BEB5; color: white; padding: 5px 10px;"
											href="/coffeedao/productReviewDetail.da?RE_IDX=${review.RE_IDX}&RE_ITEM=${review.RE_ITEM}&RE_REF=${review.RE_REF}">[상세보기]</a></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" style="text-align: center; height: 100px;">등록된
										리뷰가 없습니다.</td>
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
						id="sellerProductReview"
						onClick="location.href='sellerProductList.da'">돌아가기</button>
				</div>

				<!-- 페이징 -->
				<div style="text-align: center;">
					<c:if test="${pagination.nowPage ne 1}">
						<a class="paging_button" href="#"
							onClick="paging('${pagination.prevPage}')">[이전]</a>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPagePerLine}"
						end="${pagination.endReviewPagePerLine}">
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
						test="${pagination.nowPage ne pagination.totalReviewPage && pagination.endReviewPagePerLine > 1}">
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
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
	border-bottom: 0px solid;
	padding: 10px;
}

thead th {
	position: sticky;
	top: 0;
	background-clip: padding-box;
}

thead th.pin {
	left: 0;
	z-index: 1001;
	border-left: 0;
}

tbody th {
	background-clip: padding-box;
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

table, tr, td {
	border: none;
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
</style>
</head>

<body>
<body>
	<div id="wrap">
		<%@ include file="../../include/sellerMypage_left.jsp"%>
		<div class="content" style="height: 100%;">
			<div align="center" class="col-md-12">
				<h1 class="login_taital">리뷰 상세보기</h1>
			</div>
			<div class="container">
				<div class="register_center"></div>
				<h5 style="font-size: 15px;">[상품코드 ${RE_ITEM}]</h5>
				<table style="margin: 0px 0px 0px 0px; width: 100%;">
					<thead>
						<tr>
							<th style="width: 90px;">리뷰코드</th>
							<th style="width: 150px;">회원명</th>
							<th>내용</th>
							<th style="width: 80px;">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr style="height: 150px;">
							<td style="font-weight: bold;">${RE_IDX}</td>
							<td>${map.RE_MEM}</td>
							<td>${map.RE_CONTENT}</td>
							<td>${map.RE_DATE}</td>
					</tbody>
				</table>

				<br> <br>

				<table
					style="border: 1px solid; margin: 0px 0px 0px 0px; width: 100%;">
					<c:choose>
						<c:when test="${fn:length(maps) > 0}">
							<tr>
								<th style="width: 90px;">내 답글</th>
								<td>${maps.RE_CONTENT}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th style="width: 90px;">내 답글</th>
								<td>등록된 답글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>

				<input type="hidden" name="RE_ITEM" value="${RE_ITEM}"> <input
					type="hidden" name="RE_IDX" value="${RE_IDX}"> <input
					type="hidden" name="RE_REF" value="${map.RE_REF}"> <br>
				<div>
					<div style="display: inline-block; float: left;">
						<button class="register_button"
							onclick="location.href='sellerProductReview.da?RE_IDX=${RE_IDX}&ITEM_ID=${RE_ITEM}'">돌아가기</button>
					</div>
				</div>
				<c:choose>
					<c:when test="${fn:length(maps) > 0}">
						<div>
							<div style="display: inline-block; float: right;">
								<button class="register_button"
									onclick="location.href='productAnswerUpdateForm.da?RE_IDX=${RE_IDX}&RE_ITEM=${RE_ITEM}&RE_REF=${map.RE_REF}'">답글
									수정</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<div style="display: inline-block; float: right;">
								<a class="register_button"
									href="/coffeedao/productAnswerWriteForm.da?RE_IDX=${RE_IDX}&RE_ITEM=${RE_ITEM}&RE_REF=${RE_REF}">답글
									등록</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<br>
			</div>
		</div>
	</div>
</body>
<br>
<%@ include file="../../include/footer.jsp"%>
</html>
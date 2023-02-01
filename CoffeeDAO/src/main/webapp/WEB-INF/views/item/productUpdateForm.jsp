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
<title>상품 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	function ucheck() {
		var ITEM_IMG_S = $("#ITEM_IMG_S").val();
		var ITEM_IMG_D = $("#ITEM_IMG_D").val();
		var ITEM_NAME = $("#ITEM_NAME").val();
		var ITEM_200 = $("#ITEM_200").val();
		var ITEM_500 = $("#ITEM_500").val();
		var ITEM_COMP = $("#ITEM_COMP").val();
		var ITEM_LOC = $("#ITEM_LOC").val();

		if (ITEM_IMG_S == null || ITEM_IMG_S == '') {
			$('p').remove();
		}

		if (ITEM_IMG_D == null || ITEM_IMG_D == '') {
			$('a').remove();
		}

		if (ITEM_NAME == null || ITEM_NAME == '') {
			alert("상품명을 입력하세요.");
			return;
		}

		if ((ITEM_200 == null || ITEM_200 == '')
				&& (ITEM_500 == null || ITEM_500 == '')) {
			alert("가격을 입력하세요.");
			return;
		}

		if ($('input:radio[name=ITEM_TASTE]').is(":checked")) {
		} else {
			alert("원두맛을 선택하세요.");
			return false;
		}

		if ($('input:radio[name=ITEM_TYPE]').is(":checked")) {
		} else {
			alert("원두종류을 선택하세요.");
			return false;
		}

		if ($('input:radio[name=ITEM_CAF]').is(":checked")) {
		} else {
			alert("카페인 유무를 선택하세요.");
			return false;
		}

		if (ITEM_COMP == null || ITEM_COMP == '') {
			alert("제조회사를 입력하세요.");
			return;
		}

		if (ITEM_LOC == null || ITEM_LOC == '') {
			alert("원산지를 입력하세요.");
			return;
		}

		if ($('input:radio[name=ITEM_SUB]').is(":checked")) {
		} else {
			alert("구독여부를 선택하세요.");
			return false;
		}

		uit.submit();
		alert("상품 정보가 수정되었습니다.")
		return;
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
	width: 100% WORD-BREAK: break-all;
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
	border-bottom: 1px solid;
	padding: 10px;
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
	border: none;
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
<body>
	<div id="wrap">
		<%@ include file="../../include/sellerMypage_left.jsp"%>
		<div class="content" style="height: 100%;">
			<div align="center" class="col-md-12">
				<h1 class="login_taital">상품 수정</h1>
			</div>
			<br>
			<div class="register_center"></div>
			<form id="uit" action="productUpdatePro.da" method="post"
				enctype="multipart/form-data">
				<table style="margin: 0px 0px 0px 0px; width: 100%;">
					<tr>
						<th>상품코드</th>
						<td>${list[0].ITEM_ID}</td>
					</tr>
					<tr>
						<th>상품이미지<br>- 썸네일
						</th>
						<td><br> <img src="resources/img/${list[0].FILE_STD}"
							width="300px" height="200px"> <br>${list[0].FILE_ORG}<br>
							<br>
							<div>
								썸네일 변경 - <input type="file" name="ITEM_IMG_S" id="ITEM_IMG_S">
								<p>
									<input type="hidden" name="FILE_NUM"
										value="${list[0].FILE_NUM}">
								</p>
							</div> <br></td>
					</tr>
					<tr>
						<th>상품이미지<br>- 디테일
						</th>
						<td><br> <img src="resources/img/${list[1].FILE_STD}"
							width="300px" height="200px"> <br>${list[1].FILE_ORG}<br>
							<br>
							<div>
								디테일 변경 - <input type="file" name="ITEM_IMG_D" id="ITEM_IMG_D">
								<a><input type="hidden" name="FILE_NUM"
									value="${list[1].FILE_NUM}"></a>
							</div> <br></td>
					</tr>

					<tr>
						<th>상품명</th>
						<td><input type="text" maxlength="20" name="ITEM_NAME"
							id="ITEM_NAME" value="${list[0].ITEM_NAME}"></td>
					</tr>
					<tr>
						<th>가격 200g</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="ITEM_200" id="ITEM_200" maxlength="10"
							value="${list[0].ITEM_200}">&nbsp;원
						</td>
					</tr>
					<tr>
						<th>가격 500g</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
							name="ITEM_500" id="ITEM_500" maxlength="10"
							value="${list[0].ITEM_500}">&nbsp;원
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td><textarea rows="6" cols="50" style="resize: none;"
								maxlength="333" name="ITEM_CONT">${list[0].ITEM_CONT}</textarea></td>
					</tr>
					<tr>
						<th>원두 맛</th>
						<td><input type="radio" name="ITEM_TASTE" value="고소한"
							id="ITEM_TASTE"
							<c:if test="${list[0].ITEM_TASTE eq '고소한'}">checked</c:if>>고소한
							<input type="radio" name="ITEM_TASTE" value="쌉쌀한" id="ITEM_TASTE"
							<c:if test="${list[0].ITEM_TASTE eq '쌉쌀한'}">checked</c:if>>쌉쌀한
							<input type="radio" name="ITEM_TASTE" value="부드러운"
							id="ITEM_TASTE"
							<c:if test="${list[0].ITEM_TASTE eq '부드러운'}">checked</c:if>>
							부드러운</td>
					</tr>
					<tr>
						<th>원두 종류</th>
						<td><input type="radio" name="ITEM_TYPE" value="아라비카"
							id="ITEM_TYPE"
							<c:if test="${list[0].ITEM_TYPE eq '아라비카'}">checked</c:if>>아라비카
							<input type="radio" name="ITEM_TYPE" value="로부스타" id="ITEM_TYPE"
							<c:if test="${list[0].ITEM_TYPE eq '로부스타'}">checked</c:if>>로부스타
							<input type="radio" name="ITEM_TYPE" value="리베리카" id="ITEM_TYPE"
							<c:if test="${list[0].ITEM_TYPE eq '리베리카'}">checked</c:if>>리베리카</td>
					</tr>
					<tr>
						<th>카페인 유무</th>
						<td><input type="radio" name="ITEM_CAF" value="카페인"
							<c:if test="${list[0].ITEM_CAF eq '카페인'}">checked</c:if>>
							카페인 <input type="radio" name="ITEM_CAF" value="디카페인"
							<c:if test="${list[0].ITEM_CAF eq '디카페인'}">checked</c:if>>디카페인</td>
					</tr>
					<tr>
						<th>제조 회사</th>
						<td><input type="text" name="ITEM_COMP" id="ITEM_COMP"
							maxlength="20" value="${list[0].ITEM_COMP}"></td>
					</tr>
					<tr>
						<th>원산지</th>
						<td><input type="text" name="ITEM_LOC" id="ITEM_LOC"
							maxlength="20" value="${list[0].ITEM_LOC}"></td>
					</tr>
					<tr>
						<th>구독 서비스</th>
						<td><input type="radio" name="ITEM_SUB" id="ITEM_SUB"
							value="운영"
							<c:if test="${list[0].ITEM_SUB eq '운영'}">checked</c:if>>
							운영 <input type="radio" name="ITEM_SUB" id="ITEM_SUB" value="미운영"
							<c:if test="${list[0].ITEM_SUB eq '미운영'}">checked</c:if>>
							미운영</td>
					</tr>
				</table>
				<input type="hidden" name="ITEM_ID" value="${list[0].ITEM_ID}">
				<input type="hidden" name="SELL_ID" value="${list[0].SELL_ID}">
			</form>
			<br>
			<div>
				<div style="display: inline-block; float: left;">
					<button class="register_button" type="button"
						id="sellerProductList"
						onClick="location.href='sellerProductList.da'">돌아가기</button>
				</div>
			</div>
			<div>
				<div style="display: inline-block; float: right; margin-right: 4px;">
					<button class="register_button" type="button" onclick="ucheck();">수정
						제출</button>
				</div>
			</div>
		</div>
	</div>
</body>
<br>
<%@ include file="../../include/footer.jsp"%>
</html>
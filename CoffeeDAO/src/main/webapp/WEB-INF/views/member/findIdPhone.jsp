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
<style>
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
<meta charset="UTF-8">
<title></title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	function idCheck() {
		var user_name = $("#user_name").val();
		var user_phone = $("#user_phone").val();

		if (user_name == null || user_name == '') {
			alert("이름을 입력하세요.");
			return 0;
		} else if (user_phone == null || user_phone == '') {
			alert("전화번호를 입력하세요");
			return 0;
		}
		fip.submit();
	}
</script>
</head>
<body>
	<div
		style="text-align: center; margin-top: 3%; margin-bottom: 40px; font-size: 40px;">
		<h1>회원 아이디 찾기</h1>
	</div>
	<div class="container">
		<div align="center" id="fit">
			<input type="radio" name="findId" onClick="location.href='findId.da'">
			이메일로 찾기 <input type="radio" name="findId"
				onClick="location.href='findIdPhone.da'" checked="checked">
			전화번호로 찾기
		</div>
		<br>
		<div align="center" id="fid">
			<form id="fip" action="findIdPhoneResult.da" method="POST">
				<div>
					<label>이 름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label> <span><input
						type="text" class="register_text" maxlength="20" name="user_name"
						id="user_name" placeholder="이름 입력"></span>
				</div>
				<br>
				<div>
					<label>전화번호 : </label> <span><input type="text"
						class="register_text" maxlength="40" name="user_phone"
						id="user_phone" placeholder="전화번호 입력"></span>
				</div>
				<br>
				<div class="register_center">
					<button class="register_button" type="button" onclick="idCheck();">아이디
						확인</button>
				</div>
			</form>
		</div>
	</div>
</body>
<br>
<%@ include file="../../include/footer.jsp"%>
</html>
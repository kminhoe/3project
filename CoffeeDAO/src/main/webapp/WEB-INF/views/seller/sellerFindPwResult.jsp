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

button{
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
</head>
<body>
	<div
		style="text-align: center; margin-top: 3%; margin-bottom: 40px; font-size: 40px;">
		<h1>업체회원 비밀번호 찾기 결과</h1>
	</div>
	<div align="center" id="fif">
		<c:if test="${empty list || list==''}">
				가입되지 않은 회원입니다.
				</c:if>
		<c:if test="${list != null && list != ''}">
			<c:forEach items="${list}" var="item">
				<c:out value="${item.SELL_NAME}" />
					님의 비밀번호는<br>
				<c:out value="${item.SELL_PWD}" />
					입니다.
			</c:forEach>
		</c:if>
		<div align="center" class="register_center">
			<button class="register_button"
				onClick="location.href='sellerLoginForm.da'">로그인</button>
		</div>
	</div>
</body>
</html>
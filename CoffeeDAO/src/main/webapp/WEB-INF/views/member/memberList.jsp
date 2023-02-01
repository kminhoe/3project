<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CoffeeDAO</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>회원 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">ID</th>
			<th scope="col">NAME</th>
			<th scope="col">REGISTER DATE</th>
			<th scope="col">EMAIL</th>
			<th scope="col">PHONE</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.MEM_ID }</td>
						<td>${row.MEM_NAME }</td>
						<td>${row.MEM_RDATE }</td>
						<td>${row.MEM_EMAIL }</td>
						<td>${row.MEM_PHONE }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
</table>
</body>
</html>
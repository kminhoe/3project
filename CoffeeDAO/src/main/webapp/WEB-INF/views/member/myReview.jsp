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
			<h1>리뷰보기</h1>
			<div class="jb-division-line4"></div>

            <table class="type10">
               <thead>
               <tr>
                 <th scope="col">아이디</th>
                 <th scope="col">내용</th>
                 <th scope="col">날짜</th>
               </tr>
               </thead>
               <tbody>
               <tr>
					<c:forEach items="${myReview}" var="R">
						<c:choose>
							<c:when test="${R.RE_STEP == 0}">
								<tr>
									<!-- 번호 제목 작성자 작성일 조회수  -->
									<td class="td1">${R.RE_MEM}</td>
									<td class="td2">${R.RE_CONTENT}</td>
									<td class="td1"><fmt:formatDate value="${R.RE_DATE}" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<!-- 번호 제목 작성자 작성일 조회수  -->
									<td class="even td1">${R.RE_SELLER}</td>
									<td class="even td2">ㄴ ${R.RE_CONTENT}</td>
									<td class="even td1"><fmt:formatDate value="${R.RE_DATE}" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
               </tbody>
             </table>
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

	<script type="text/javascript">
		function openPop(orderid) {
		    var popup = window.open('/coffeedao/orderReturn.da?orderid=' + orderid, '반품/취소', 'top=10, left=10, width=700, height=600, status=no, menubar=no, toolbar=no, resizable=no');
		}
	</script>
</body>
</html>
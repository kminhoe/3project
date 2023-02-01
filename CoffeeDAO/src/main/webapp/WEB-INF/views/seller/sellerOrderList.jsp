<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <head>
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
      
      <style>
.img_pro{
width:20%;
height:20%;
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
    border:1px solid  #ffffff;
    background:#999286;
    padding:5px;
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

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

*, *:before, *:after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background: ;
  font-family: 'Open Sans', sans-serif;
}

table {
  border-collapse: collapse;
  border: none;
  width:100%;
}
th,
td {
  border: px solid #aaa;
  background-clip: padding-box;
  scroll-snap-align: start;
}
tbody tr:last-child th,
tbody tr:last-child td {
  border-bottom: 0;
}
thead {
  z-index: 1000;
  position: relative;
  text-align: center;
}
th,
td {
  
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
thead th,
tbody th {
  background-color: #f8f8f8;
}
table, tr, td {
    border: none;
}
</style>
   </head>
   <body>
      <!-- header section start -->
	<%@ include file="../../include/header.jsp" %>
      <!-- header section end -->
      
      <!-- contact section start -->
      <div id="wrap">
      <%@ include file="../../include/sellerMypage_left.jsp" %>
         <div class="content">
         <div>
         	<div>
         		거래내역 > 리스트
         	</div>
         	
				<br><br>         	
         	<div >
         	<form>
         		<table>
         		<thead align="center">
         		<tr>
         		<th >주문일</th>
         		<th width="10%">주문번호</th>
         		<th width="15%">상품명</th>
         		<th>주문자</th>
         		<th width="10%">총 주문금액</th>
         		<th width="20%">주소</th>
         		<th>상태</th>
         		<th>운송장번호</th>
         		</tr>
         		</thead>
         		<tbody align="center">
         			<tr >
         				<c:forEach items="${orderList}" var="order" varStatus="status">
         					
         						<tr>
         							<th><fmt:formatDate value="${order.ORDER_DATE}" pattern="yyyy.MM.dd"/></th>
         							<td>${order.ORDER_ID}</td>
         							<td>${order.ORDER_ITEM}</td>
         							<td>${order.ORDER_MEM}</td>
         							<td>${order.ORDER_TOT}원</td>
         							<td>${order.ORDER_ADDR1}<br>
         							${order.ORDER_ADDR2}</td>
         							<td>
         								<select id="ORDER_STATE${status.index}" name="ORDER_STATE${status.index}" onchange="this.value" >
	         								<option value="주문완료">${order.ORDER_STATE}</option>
	         								<option value="배송중">배송중</option>
	         								<option value="배송완료">배송완료</option>
	         								<option value="구매확정">구매확정</option>
         								</select>
         							</td>
         							<td><input type="hidden" id="ORDER_IDX${status.index}" name="ORDER_IDX${status.index}" value="${order.ORDER_IDX}">
         								<input type="text" id="ORDER_SENDNO${status.index}" name="ORDER_SENDNO${status.index}" Placeholder="${order.ORDER_SENDNO}" value="${order.ORDER_SENDNO}"></td>
         							<td><button type="button" onclick="updateState(ORDER_STATE${status.index},ORDER_IDX${status.index},ORDER_SENDNO${status.index});"><a>수정</a></button></td>
         						
         						</tr>
         					
         				</c:forEach>
         			</tr>
         			
         		</tbody>
         		
         		
         		</table>
         		</form>
         	</div>
         </div>
	         
            <!-- 페이징 처리 부분-->
			<div style="display: block; text-align: center; font-size: 17px;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/coffeedao/sellerOrderList.da?SELL_ID=${order.ORDER_SELLER}&keyword=${paging.keyword}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a href="/coffeedao/sellerOrderList.da?SELL_ID=${order.ORDER_SELLER}&keyword=${paging.keyword}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/coffeedao/sellerOrderList.da?SELL_ID=${order.ORDER_SELLER}&keyword=${paging.keyword}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
			<!-- 페이징 처리 끝 -->
         </div>
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-6">
                  <div class="location_icon">
                     <ul>
                        <li><a href="#"><img src="images/map-icon.png"></a></li>
                        <li><a href="#"><img src="images/mail-icon.png"></a></li>
                        <li><a href="#"><img src="images/call-icon.png"></a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-lg-6 col-md-6">
                  <div class="mail_box">
                     <textarea class="enter_email_text" placeholder="Enter Your Email" rows="5" id="comment" name="Message"></textarea>
                     <div class="subscribe_bt_1"><a href="#">Subscribe</a></div>
                  </div>
               </div>
               <div class="col-lg-3 col-md-6">
                  <div class="social_icon">
                     <ul>
                        <li><a href="#"><img src="images/fb-icon.png"></a></li>
                        <li><a href="#"><img src="images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="images/linkedin-icon.png"></a></li>
                        <li><a href="#"><img src="images/instagram-icon.png"></a></li>
                        <li><a href="#"><img src="images/youtub-icon.png"></a></li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="footer_section_2">
               <div class="row">
                  <div class="col-lg-3 col-md-6">
                     <h3 class="company_text">Product</h3>
                     <p class="dolor_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.Lorem ipsum dolor sit amet, </p>
                  </div>
                  <div class="col-lg-3 col-md-6">
                     <h3 class="company_text">Shop</h3>
                     <p class="dolor_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.Lorem ipsum dolor sit amet, </p>
                  </div>
                  <div class="col-lg-3 col-md-6">
                     <h3 class="company_text">Company</h3>
                     <p class="dolor_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.Lorem ipsum dolor sit amet, </p>
                  </div>
                  <div class="col-lg-3 col-md-6">
                     <h3 class="company_text">MY ACCOUNT</h3>
                     <p class="dolor_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.Lorem ipsum dolor sit amet, </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">© 2020 All Rights Reserved.<a href="https://html.design"> Free html Templates</a></p>
         </div>
      </div>
      <!-- copyright section end  -->
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
</body>

	<script>
		function check() {
			var keyword = document.getElementById("keyword"); // 키워드

			if (keyword.value.trim() == ""){ alert("키워드를 입력해주세여."); keyword.focus(); return false; }

			document.Search.submit();
		}
		
		function updateState(state, idx, sendno){
		
		/* 	console.log(state.value);
			console.log(idx.value);
			console.log(sendno.value); */
			
		var ORDER_STATE = state.value;
		var ORDER_IDX = idx.value;
		var ORDER_SENDNO = sendno.value;
		
		console.log("state :" + ORDER_STATE);
		
		var paramData = JSON.stringify({
			"ORDER_STATE" : ORDER_STATE
			,"ORDER_IDX" : ORDER_IDX
			,"ORDER_SENDNO" : ORDER_SENDNO
		});
		console.log(paramData);
		
		$.ajax({
			  url : "${pageContext.request.contextPath}/stateUpdate.da"
			, type : 'POST'
			, contentType : 'application/json; charset=utf-8'
			, data : paramData
			, dataType : 'text'
			, success: function(result){
				
				location.reload();
				alert('수정되었습니다.')


			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	 }
	
	</script>
</html>
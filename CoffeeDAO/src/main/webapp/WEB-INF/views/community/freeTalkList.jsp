<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div id="wrap">
     <%@ include file="../../include/content_left.jsp" %>
         <div class="content">
            <form id="Search" name="Search" method="post" action="/coffeedao/freeTalkList.da?type=${paging.type}">
	            <input type="text" class="mail_text" placeholder="Search" id="keyword" name="keyword">
	            <div class="send_bt" onClick="check(this.form)"><a>검색</a></div>
	        </form>
	        <c:choose>
	        <c:when test="${type == 'N'}"></c:when>
	        <c:otherwise>
            <div class="send_bt"><a href="/coffeedao/freeTalkWriteForm.da?type=${type}">글쓰기</a></div>
            </c:otherwise>
            </c:choose>
            <table class="type10">
               <thead>
               <tr>
                 <th scope="col">번호</th>
                 <th scope="col">제목</th>
                 <th scope="col">작성자</th>
                 <th scope="col">작성일</th>
                 <th scope="col">조회수</th>
               </tr>
               </thead>
               <tbody>
               <tr>
					<c:forEach items="${freeTalkList}" var="free">
						<c:choose>
							<c:when test="${free.RNUM % 2 == 0}">
								<tr>
									<!-- 번호 제목 작성자 작성일 조회수  -->
									<th scope="row" class="even">${free.BO_IDX}</th>
									<td class="even td2"><a href="/coffeedao/freeTalkDetail.da?BO_IDX=${free.BO_IDX}">${free.BO_TITLE}</a></td>
									<td class="even">${free.BO_MEMID}</td>
									<td class="even"><fmt:formatDate value="${free.BO_DATE}" pattern="yyyy.MM.dd"/></td>
									<td class="even">${free.BO_COUNT}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<!-- 번호 제목 작성자 작성일 조회수  -->
									<th scope="row">${free.BO_IDX}</th>
									<td class="td2"><a href="/coffeedao/freeTalkDetail.da?BO_IDX=${free.BO_IDX}">${free.BO_TITLE}</a></td>
									<td class="td1">${free.BO_MEMID}</td>
									<td class="td1"><fmt:formatDate value="${free.BO_DATE}" pattern="yyyy.MM.dd"/></td>
									<td class="td1">${free.BO_COUNT}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
               </tbody>
             </table>
			<br><br><br>
            <!-- 페이징 처리 부분-->
			<div style="display: block; text-align: center; font-size: 17px;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/coffeedao/freeTalkList.da?type=${type}&nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a href="/coffeedao/freeTalkList.da?type=${type}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/coffeedao/freeTalkList.da?type=${type}&nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
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
                        <li><a href="#"><img src="resources/images/map-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/mail-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/call-icon.png"></a></li>
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
                        <li><a href="#"><img src="resources/images/fb-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/linkedin-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/instagram-icon.png"></a></li>
                        <li><a href="#"><img src="resources/images/youtub-icon.png"></a></li>
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
      <script src="resources/js/jquery.min.js"></script>
      <script src="resources/js/popper.min.js"></script>
      <script src="resources/js/bootstrap.bundle.min.js"></script>
      <script src="resources/js/jquery-3.0.0.min.js"></script>
      <script src="resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="resources/js/custom.js"></script>
      <!-- javascript --> 
      <script src="resources/js/owl.carousel.js"></script>
      <!-- owl carousel -->
      <!-- 검색 부분 --> 
      <script>
		function check() {
			var keyword = document.getElementById("keyword"); // 키워드

			if (keyword.value.trim() == ""){ alert("키워드를 입력해주세여."); keyword.focus(); return false; }

			document.Search.submit();
		}
	</script>
</body>
</html>
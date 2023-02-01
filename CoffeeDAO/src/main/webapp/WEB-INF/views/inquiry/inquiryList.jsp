<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../include/header.jsp" %>

 
 <!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

  .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 5px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link { text-decoration: none;}
 a:visited { text-decoration: none;}
 a:hover { text-decoration: underline;}
 .active{
  background-color: #E2E2E2;
 }
 
 /* 스크롤 없애기 */
 /* ( 크롬, 사파리, 오페라, 엣지 ) 동작 */
.content::-webkit-scrollbar {
  display: none;
}

.content {
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */

}
 
</style>


<body>
      <div id="wrap">
     <%@ include file="../../include/inquiry_left.jsp" %>
         <div class="content" >
            <form id="inquiryForm" name="inquiryForm"  >
            <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
            <input type="hidden" name="amount" value="${page.cri.amount}">
	            <input type="text" class="mail_text" placeholder="Search" id="keyword" name="keyword"
	            value="${page.cri.keyword}">
	            <div class="send_bt" ><a>검색</a></div>
	        </form>
                
            <c:if test="${id !=null }">
            <div class="send_bt"><a class="write">글쓰기</a></div>
            </c:if>

            <table class="type10">
               <thead>

               <tr>
                 <th scope="col">작성일</th>
                 <th scope="col">분류</th>
                 <th scope="col">제목</th>
                 <th scope="col">작성자</th>
                 <th scope="col">문의상태</th>
                 <th scope="col">답변시간</th>
               </tr>
               </thead>
               <tbody>
               <tr>
               
               <c:forEach var="list" items="${inquiryList }">  
               <c:choose>
							<c:when test="${list.RN % 2 == 0}">
								
								<tr>
							<!-- 작성일 분류 제목 작성자 문의상태 답변시간  -->
							<th scope="row" class="even" style="width: 170px;">
							<fmt:formatDate value="${list.QA_DATE}" pattern="yyyy.MM.dd"/></th> <!-- 작성일 -->
							<td class="even td2" style="width: 300px; text-align: center;">${list.QA_CLASS}</td>
							<td class="even"><a class="title" href='<c:out value="${list.QA_IDX}"/>'>
							${list.QA_TITLE}</a></td>
							<td class="even">${list.QA_WRITER}</td>
							<td class="even">${list.QA_STATE}</td>
							<td class="even"></td> 
							</tr>
							
							</c:when>
							<c:otherwise>
				
							<tr>
							<!-- 작성일 분류 제목 작성자 문의상태 답변시간  -->
							<th scope="row" style="width: 170px;">
							<fmt:formatDate value="${list.QA_DATE}" pattern="yyyy.MM.dd"/></th> <!-- 작성일 -->
							<td class="td1" style="width: 300px">${list.QA_CLASS}</td>
							<td class="td2" style="text-align: center;">
							<a class="title" href='<c:out value="${list.QA_IDX}"/>'>
							${list.QA_TITLE}</a></td>
							<td class="td1">${list.QA_WRITER}</td>
							<td class="td1">${list.QA_STATE}</td>
							<td class="td1"></td> 
							</tr>
			
							</c:otherwise>
						</c:choose>     
              
					</c:forEach>

					
               </tbody>
             </table>

			<br><br><br>

<!-- 페이징 -->		
<div>
<div>
<ul id="pageInfo" class="pageInfo">

<c:if test="${page.prev}">
<li><a href="${page.startPage-1}"> [이전]</a></li>
</c:if>

<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
<li class="pageInfo_btn ${page.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
</c:forEach>

<c:if test="${page.next}">
<li><a href="${page.endPage + 1}"> [다음] </a></li>
</c:if>

</ul>
</div>
</div>
<br><br>
 
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

	
	<script>
	//페이징
	
	let inquiryForm = $("#inquiryForm");
	
	$(".title").on("click", function(e){
		
		e.preventDefault();
		inquiryForm.append("<input type='hidden' name='QA_IDX' value='"+ $(this).attr("href")+ "'>");
		inquiryForm.attr("action", "inquiryDetail.da");
		inquiryForm.submit();
		
	});
	
       $(".write").on("click", function(e){
		
		e.preventDefault();
		inquiryForm.attr("action", "inquiryWriteForm.da");
		inquiryForm.submit();
		
	});
	
	
	
	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		inquiryForm.find("input[name='pageNum']").val($(this).attr("href"));
		inquiryForm.attr("action", "inquiryList.da");
		//inquiryForm.attr("action", "/inquiryListPage.da"); /붙이면 안됨
		inquiryForm.submit();
	});
	
	
	$(".send_bt").on("click", function(e){
		
		e.preventDefault();
		let val = $("input[name='keyword']").val();
		inquiryForm.find("input[name='keyword']").val(val);
		inquiryForm.find("input[name='pageNum']").val(1);
		inquiryForm.submit();
	});
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>커피다오</title>
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
.img_bestItem {
float: left; 
width:  300px; 
height: 400px; 
object-fit: cover;
}

.carousel-item {
    height: 350px;
}

.carousel-indicators li {
    width: 10px;
    height: 10px;
    border-radius: 100%;
}
.carousel-indicators {
    bottom: -50px;
}

   </style>
   <body>
      <!-- header section start -->
		<%@ include file="../include/header.jsp" %>
      <!-- header section end -->

      <!-- banner section start -->
      <div class="banner_section banner_bg">
         <div class="container-fluid">
            <div id="my_slider" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div>
                     <div class="taital_main">
                        <div class="taital_right">
                           <div class="product_img"><img src="${pageContext.request.contextPath}/resources/images/product-img.png"></div>
                        </div>
                     </div>
                  </div>
         </div>
      </div>
      <div class="product_section layout_padding">
         <div class="jb-division-line"></div>
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="product_taital"><br><br>베스트 상품</h1>
                  <p class="product_text">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim</p>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="owl-carousel owl-theme">
	                  <c:forEach items="${bestItemList}" var="ITEM">
	                     <div class="item">
	                        <div class="box">
	                        <c:choose>
	                        	<c:when test="${empty ITEM.FILE_STD}">
	                        		<img src="${pageContext.request.contextPath}/resources/images/img-2.png" alt="image" />
	                        	</c:when>
	                        	<c:otherwise>
	                        		<a href="productDetail.da?ITEM_ID=${ITEM.ITEM_ID}"><img class="img_bestItem" src="${pageContext.request.contextPath}/resources/img/${ITEM.FILE_STD}" alt="image" /></a><br><br>
	                        	</c:otherwise>
	                        </c:choose>
	                     </div>
	                        <c:choose>
	                        	<c:when test="${ITEM.ITEM_200 == '0'}">
	                        	<div>
	                        	
	                        		<h6 class="price_text"><a href="productDetail.da?ITEM_ID=${ITEM.ITEM_ID}">${ITEM.ITEM_NAME} <br>${item.SELLER}<br><span style="color: #f75261;">$${ITEM.ITEM_500}</span></a></h6>
	                        	</div>	
	                        		</c:when>
	                        	<c:otherwise>
	                        		<h6 class="price_text"><a href="productDetail.da?ITEM_ID=${ITEM.ITEM_ID}">${ITEM.ITEM_NAME} <br>${item.SELLER}<br><span style="color: #f75261;">$${ITEM.ITEM_200}</span></a></h6>
	                        	</c:otherwise>
	                        </c:choose>
	                     </div>
	                 </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- product section start -->
      <!-- client section start -->
      <div class="client_section layout_padding banner_bg">
         <div class="jb-division-line"></div>
         <div class="container">
            <div class="row">
               <div class="col-md-3">
                  <h1 class="client_taital">로스터리<br>리스트</h1><br><br><br>
               </div>
               <div class="col-md-9">
                  <div class="client_box">
                     <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                         	<c:forEach items="${bestSellerList}" varStatus="status">
                         	<c:choose>
	                        	<c:when test="${status.index == 0}">
									<li data-target="#carouselExampleIndicators" data-slide-to="${status.index}" class="active"></li>
								</c:when>
								<c:otherwise>
									<li data-target="#carouselExampleIndicators" data-slide-to="${status.index}"></li>
								</c:otherwise>
							</c:choose>
							</c:forEach>
                        </ol>
                  
                        <div class="carousel-inner">
                        	<c:forEach items="${bestSellerList}" var="SELLER" varStatus="status">
                        	   <c:choose>
	                        	   <c:when test="${status.index == 0}">
		                           	  <div class="carousel-item active">
		                           </c:when>
		                           <c:otherwise>
									  <div class="carousel-item" >
								   </c:otherwise>
							   </c:choose>
	                              
	                              <div class="client_main">
	                              <%-- <p class="client_text">${SELLER.SELL_CONT}</p> --%>
	                                 <div class="client_left">
	                                 <c:choose>
	                                 	<c:when test="${SELLER.SELL_PROF == null}">
	                                 		<div class="client_img"><img src="${pageContext.request.contextPath}/resources/images/seller.PNG"></div>
	                                 	</c:when>
	                                 	<c:otherwise>
	                                    	<div class="client_img"><a href="sellerDetail.da?SELL_ID=${SELLER.SELL_ID}"><img src="${pageContext.request.contextPath}/resources/img/${SELLER.SELL_PROF}"></a></div>
	                                    </c:otherwise>
	                                 </c:choose>
	                                 </div>
	                                 <div class="client_right">
	                                    <div class="quick_icon"><img src="${pageContext.request.contextPath}/resources/images/quick-icon.png"></div>
	                                    <h6 class="client_name"><a href="sellerDetail.da?SELL_ID=${SELLER.SELL_ID}">${SELLER.SELL_NAME}</a></h6>
	                                    <a class="aliqua_text" href="https://www.instagram.com/${SELLER.SELLER_SNS}">Instagram : @${SELLER.SELL_SNS}</a>
                                 </div>
                              </div>
                           </div>
                           </c:forEach>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>&nbsp;&nbsp;&nbsp;&nbsp;
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
      <script>
         $('.owl-carousel').owlCarousel({
         loop:true,
         margin:30,
         nav:true,
         responsive:{
          0:{
              items:1
          },
          600:{
              items:3
          },
          1000:{
              items:4
          }
         }
         })
      </script>
   </body>
</html>
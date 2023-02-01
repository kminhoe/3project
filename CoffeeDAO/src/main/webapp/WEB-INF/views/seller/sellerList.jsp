<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>업체리스트</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
      <!-- owl stylesheets -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet" />
      
<style type="text/css">
		.center {
		  display: block;
		  margin-left: auto;
		  margin-right: auto;
		  width: 68%;
		}

.container {
  position: relative;
  width: 100%;
}

.images {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

.container:hover .image {
  opacity: 0.3;
}

.container:hover .middle {
  opacity: 1;
}

.text {
  color: white;
  font-size: 16px;
  padding: 16px 32px;
}
      </style>
   </head>
   <body>
      <!-- product section start -->
      <div class="product_section layout_padding">
 
            <div class="col-md-12">
               <h1 class="product_taital">업체리스트</h1>
            </div>
            <div class="center">
                <div class="container">
                         <div class="row">
                         	<c:forEach items="${sellerBeanList}" var="seller">
                             <div class="seller">
                                 <div class="container">
                                     <div>
                                     <c:choose>
                                     <c:when test="${seller.SELL_PROF == null}">
                            
                             <img src="resources/images/camera.png" width=120px, height=120px style= "margin : 10px; border: 1px solid;">
                             </c:when>
                             
                             <c:otherwise>
                            <a href="sellerDetail.da?SELL_ID=${seller.SELL_ID}"><img class="images" style="width:170px; height:170px; margin: 1px;" src="resources/img/${seller.SELL_PROF}" width=120px, height=120px style= "margin : 10px; border: 1px solid;"></a>
                            </c:otherwise>
                            </c:choose>
                                     <div class="middle">
                                         <div class="text"><a href="sellerDetail.da?SELL_ID=${seller.SELL_ID}">${seller.SELL_NAME}</a><br><a href="http://www.instagram.com/${seller.SELL_SNS }">@${seller.SELL_SNS}</a></div>
                                     </div>
                                 </div>
                                 </div>
                             </div>
                             </c:forEach>
                     
                         </div>
                    </div>
              </div>
            </div>
     
      </div>
      <!-- product section start -->
      
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
      <script>
         var coll = document.getElementsByClassName("collapsible");
            var i;

            for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function() {
               this.classList.toggle("active");
               var content = this.nextElementSibling;
               if (content.style.maxHeight){
                  content.style.maxHeight = null;
               } else {
                  content.style.maxHeight = content.scrollHeight + "px";
               } 
            });
} 
      </script>
   </body>
</html>
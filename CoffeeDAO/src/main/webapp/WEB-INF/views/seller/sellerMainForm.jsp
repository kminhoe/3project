<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <body>
      <div id="wrap">
         <nav id="nav2">
			<ul>
				<li><input type="button" value="๋ก๊ทธ์์" onClick="location.href='sellerLogout.da'"></li>
				<li><a class="logo" href="home.da"><img height="300px" src="resources/images/logo.png"></a></li>
					<div>
						<div class="jb-division-line3"></div>
					</div>
				<li class="logoli2">
				<li><a href="#">์ํ๊ด๋ฆฌ</a></li>
				<li><a href="#">๊ฑฐ๋๋ด์ญ</a></li>
				<li><a href="#">๋งค์ถ/์?์ฐ๊ด๋ฆฌ</a></li>
				<li><a href="#">๋ฆฌ๋ทฐ๊ด๋ฆฌ</a></li>
				<li><a href="#">์ฌ์์์?๋ณด</a></li>
			</ul>
		</nav>
         <div class="content">
           <!--  <div class="center">
               <h4>ํ์๊ฐ์ ํํฉ</h4>
               <div class="graph_wrap">
                  <strong class="tit">๊ฐ์์ (๋ง ๋จ์)</strong>
                  <div class="graph">
                    ๊ธฐ์ค
                    <ul class="y-axis">
                      <li><span>35</span></li>
                      <li><span>30</span></li>
                      <li><span>25</span></li>
                      <li><span>20</span></li>
                      <li><span>15</span></li>
                      <li><span>10</span></li>
                      <li><span>5</span></li>
                      <li><span>0</span></li>
                    </ul>
                
                    ๋ชฉ๋ก
                    <ul class="x-axis">
                      <li><span>10์</span></li>
                      <li><span>11์</span></li>
                      <li><span>12์</span></li>
                    </ul>
                
                    ๋ฐ ๊ทธ๋ํ (๋ฐฑ๋ถ์จ ๋งํผ heigh๊ฐ)
                    <ul class="bar">
                      <li style="height:100%;"><span></span></li>
                      <li style="height:70%;"><span></span></li>
                      <li style="height:30%;"><span></span></li>
                    </ul>
                  </div>
                </div>
               <h4>์ต์? ์๋ฌด ์ํฉ</h4>
               <div class="c1">์์ฒด ์น์ธ ๋๊ธฐ<br>10</div>
               <div class="c1">์ผ๋์ผ ๋ฌธ์<br>10</div>
         </div> -->
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-6">
                  <div class="location_icon">
                     <ul>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/map-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/mail-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/call-icon.png"></a></li>
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
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/fb-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/twitter-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/linkedin-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/instagram-icon.png"></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/youtub-icon.png"></a></li>
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
            <p class="copyright_text">ยฉ 2020 All Rights Reserved.<a href="https://html.design"> Free html Templates</a></p>
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
</html>
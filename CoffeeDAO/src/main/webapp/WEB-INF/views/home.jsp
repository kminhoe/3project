<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/header.jsp" %>	
<!DOCTYPE html>
<html lang="en">
   <body>
      <!-- banner section start -->
      <div class="banner_section banner_bg">
         <div class="container-fluid">
            <div id="my_slider" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner">
                  <div >
                     <div class="taital_main">
                        <div class="taital_right">
                           <div class="product_img"><img src="resources/images/product-img.png"></div>
                        </div>
                     </div>
                  </div>
         </div>
      </div>
      <!-- banner section end -->
      <!-- about section start -->
      <!-- <div class="about_section layout_padding">
         <div class="jb-division-line"></div>
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div><img src="images/about-img.png" class="about_img"></div>
               </div>
               <div class="col-md-6">
                  <h1 class="about_taital">About Dao</h1>
                  <div class="border"></div>
                  <p class="about_text">Dao is a plattform where anyone could sell or buy products.</p>
                  <div class="read_bt_1"><a href="#">Read More</a></div>
                  <div class="image_1"><img src="images/img-1.png"></div>
               </div>
            </div>
         </div>
      </div> -->
      <!-- about section end -->
      <!-- product section start -->
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
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">상품명 <br>업체명<br><span style="color: #f75261;">가격</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 코스타리카 <br>커피다오<br><span style="color: #f75261;">₩20,000</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 케냐AA <br>커피다오<br><span style="color: #f75261;">₩30,000</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 콜롬비아 <br>커피다오<br><span style="color: #f75261;">₩20,000</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 디카페인 블랜디드 <br>커피다오<br><span style="color: #f75261;">₩25,000</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 수마트라 <br>커피다오<br><span style="color: #f75261;">₩25,000</span></h6>
                     </div>
                     <div class="item">
                        <div class="image_main"><img src="resources/images/img-2.png" alt="image" /></div>
                        <h6 class="price_text">커피다오 에티오피아 예가체프 <br>커피다오<br><span style="color: #f75261;">₩20,000</span></h6>
                     </div>
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
                  <h1 class="client_taital">로스터리<br>리스트</h1>
               </div>
               <div class="col-md-9">
                  <div class="client_box">
                     <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                           <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                           <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                           <div class="carousel-item active">
                              <p class="client_text">"New wave of Vietnamese Coffee" 한국에서는 찾아볼 수 없던 최상급 베트남 커피와 그 속의 담긴 이야기를 전합니다. 
                                 라까프는 최고 품질의 커피를 재배하고 가공하는 6개 농장들과 파트너십을 맺고 직공정거래를 통해 생두를 안정적으로 공급 받습니다.
                                 베트남 커피 그리고 파트너 농장의 커피만을 사용하기에 균일한 품질을 유지할 수 있습니다.
                                 커피의 최초 생산자와 그 어떤 로스터리보다 밀접한 관계를 유지하기에 직접적으로 커피농장에서부터 한 잔의 커피가 되는 모든 과정에 라까프가 함께 합니다.</p>
                              <div class="client_main">
                                 <div class="client_left">
                                    <div class="client_img"><img src="resources/images/im1.webp"></div>
                                 </div>
                                 <div class="client_right">
                                    <div class="quick_icon"><img src="resources/images/quick-icon.png"></div>
                                    <h6 class="client_name">${sellerList.SELL_NAME}</h6>
                                    <p class="aliqua_text">instagram : lacaph.coffee.korea</p>
                                 </div>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <p class="client_text">오이르(Oír)는 스페인어로 '듣다'라는 뜻입니다.
                                 모든 사람들이 다 좋아할만한 커피를 만들고 싶어 2021년 작은 공간에서 로스팅 시작,
                                 블랜딩 연구와 생두 수입 그리고 업체 납품을 늘려 가고 있습니다.
                                 난청아이들에게 소리를 들려줄 수 있다는 설레이는 희망으로 오늘도 정성스레 로스팅합니다.</p>
                              <div class="client_main">
                                 <div class="client_left">
                                    <div class="client_img"><img src="resources/images/im2.webp"></div>
                                 </div>
                                 <div class="client_right">
                                    <div class="quick_icon"><img src="resources/images/quick-icon.png"></div>
                                    <h6 class="client_name">오이르 로스터스</h6>
                                    <p class="aliqua_text">Aliqua. Ut enim</p>
                                 </div>
                              </div>
                           </div>
                           <div class="carousel-item">
                              <p class="client_text">단맛 밸런스의 향긋한 풍미가 가득, FLAVOURSOME
                                 IFA(International Flavor Association) 인증 맛 평가와 로스터의 자격으로 플레이버썸은 커피가 가진 본연의 향미를 발현시키는데 집중하고 있습니다.
                                 부드럽고 고소한 커피, 과일주스 같은 커피, 화사하고 복합적인 풍미의 커피까지, 소중히 담긴 원두를 건내 받는 때부터 시작해 드시는 커피마다 생산부터 추출까지의 모든 것과 느껴지는 향미의 뉘앙스를 스페셜하게 안내해드리고 있습니다.</p>
                              <div class="client_main">
                                 <div class="client_left">
                                    <div class="client_img"><img src="resources/images/im3.webp"></div>
                                 </div>
                                 <div class="client_right">
                                    <div class="quick_icon"><img src="resources/images/quick-icon.png"></div>
                                    <h6 class="client_name">플레이버썸</h6>
                                    <p class="aliqua_text">Aliqua. Ut enim</p>
                                 </div>
                              </div>
                           </div>
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
   </body>
</html>

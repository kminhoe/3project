<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
   	<!-- include 부분 -->
	  <%@include file="/WEB-INF/include/header.jsp" %>
      <style>
.button_log {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

input[type=text], select {
  width: 35%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 35%;
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
</style>
   </head>
   <body>
      <!-- product section start -->
      <div class="product_section layout_padding">
        <div class="row">
            <div class="col-md-12">
               <h1 align="center" class="login_taital">로그인</h1>
            </div>
            <div class="container">
                <div>
                <div align="center">
                                    <ul>
									<li onclick="kakaoLogin();">
								      <a href="javascript:void(0)">
								          <input type="image" name="kakaoLogin" src="resources/images/kakao_login_medium_narrow.png">
								      </a>
									</li>
									<li onclick="kakaoLogout();">
								      <a href="javascript:void(0)">
								          <!-- <span>카카오 로그아웃</span> -->
								      </a>
									</li>
									</ul>
									<!-- 카카오로그인 버튼 (끝)-->
									</div>
                    <div align="center">
                        <form id="memberLoginForm" action="login.da" method="POST">
                            아이디&nbsp;&nbsp;&nbsp;
                            <input class="login_text" id="MEM_ID" name="MEM_ID" type="text"><br>
                            비밀번호    
                            <input class="login_text" id="MEM_PWD" name="MEM_PWD" type="password"> 
                            <br>
                            <div class="login_subcenter">
                                <input  type="submit" value="로그인" onclick="return formCheck()">
                                <input  type="button" value="회원가입" onClick="location.href='registerForm.da'">
                                <input style="background-color: #0ac875;" type="button" value="판매자 로그인" onClick="location.href='sellerLoginForm.da'">
                                <br>
                                <br>
                               
                               <div style="display: inline-block">
 <a onClick="location.href='findId.da'" style="margin-right: 10px; cursor: pointer; font-size: 15px;">아이디 찾기</a>
  <!-- <input  type="button" name="findId" id="findId" value="ID 찾기" onClick="location.href='findId.da'"> -->
</div> |
<div style="display: inline-block">
     <a onClick="location.href='findPw.da'" style="margin-left: 10px; cursor: pointer; font-size: 15px;">비밀번호 찾기</a>
     <!--  <input  type="button" name="findPwd" id="findPwd" value="비밀번호 찾기" onClick="location.href='findPw.da'"> -->
</div>
                               
                                    <!-- 카카오로그인 버튼 (시작)-->
                              
                                   
<!-- 카카오 스크립트 -->

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript" src="resources/js/api.js"></script>
<script>
		/* 로그인 유효성 체크 */
		function formCheck() {
			var form = document.getElementById("memberLoginForm");
			var MEM_ID = document.getElementById("MEM_ID");
			var MEM_PWD = document.getElementById("MEM_PWD");
	
			if(MEM_ID.value.trim()=="") {
				alert("아이디를 입력해주세요.");
				MEM_ID.focus();
				return false;
			} else if(MEM_PWD.value.trim()=="") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else if(MEM_ID.value ){
				
			} 
			
			else {	
				form.submit();
			}
		}
		
		/* 첫 화면 로딩 시 포커스 */
		window.onload = function() {
			document.getElementById("MEM_ID").focus();
		}
		
	</script>
<script>
Kakao.init('31de08a1b5feac1233066d524024dc8b'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          //성공시 response에 정보가 들어간다
          success: function (response) {
        	  kakaoapi(response);
        	  
        	  //var result = sessionStorage.getItem("MEM_ID");
        	  
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
                                    
                                    
                                    
                                </div>
                            </div>
                                
                            
                        </form>    
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
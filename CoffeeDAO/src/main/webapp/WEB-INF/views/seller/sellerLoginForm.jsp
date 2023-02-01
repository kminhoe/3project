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
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 30%;
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
            <div align="center"class="col-md-12">
               <h1 class="login_taital">판매자 로그인</h1>
            </div>
            <div class="container">
                <div>
                    <hr width="100%">
                    <div align="center">
                        <form id="sellerLoginForm" action="sellerLogin.da" method="POST"  onsubmit="return formCheck()">
                            <br>
                            아이디&nbsp;&nbsp;&nbsp;
                            <input class="login_text" id="SELL_ID" name="SELL_ID" type="text"><br>
                            비밀번호    
                            <input class="login_text" id="SELL_PWD" name="SELL_PWD" type="password"> 
                            <br>
                            <div class="login_subcenter">
                                <input class="login_submit" type="submit" value="로그인">
                                <input class="login_submit" type="button" value="회원가입" onClick="location.href='sellerRegisterForm.da'">
                                 <input style="background-color: #0ac875;" type="button" value="일반 로그인" onClick="location.href='loginForm.da'">
                                <br>
                                <br>
                                <div class="">
                                    <!-- <input class="login_button" type="button" name="findId" id="findId" value="ID 찾기" onClick="location.href='findId.da'"> -->
                                    <a onCLick="location.href='sellerFindId.da'">ID 찾기</a>
                                    <br>
                                   <!-- <input class="login_button" type="button" name="findPwd" id="findPwd" value="비밀번호 찾기" onClick="location.href='findPw.da'"> -->
                                    <a onCLick="location.href='sellerFindPw.da'">비밀번호 찾기</a>
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
      
      <!-- 로그인 폼 실행시 두 번씩 실행하게 함 -->
      <!-- <script src="resources/js/custom.js"></script> -->
      
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
      <script>
		/* 로그인 유효성 체크 */
		function formCheck() {
			var form = document.getElementById("sellerLoginForm");
			var SELL_ID = document.getElementById("SELL_ID");
			var SELL_PWD = document.getElementById("SELL_PWD");
	
			if(SELL_ID.value.trim()=="") {
				alert("아이디를 입력해주세요.");
				SELL_ID.focus();
				return false;
			} else if(SELL_PWD.value.trim()=="") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} 
		}
		
		/* 첫 화면 로딩 시 포커스 */
		window.onload = function() {
			document.getElementById("SELL_ID").focus();
		}
		
	</script>
      
   </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!DOCTYPE html>
<html lang="en">
   <head>
   	  <!-- include 부분 -->
	  <%@include file="/WEB-INF/include/header.jsp" %>	
<!-- 주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("MEM_ADDR2").value = extraAddr;
                
                } else {
                    document.getElementById("MEM_ADDR2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_ZP').value = data.zonecode;
                document.getElementById("MEM_ADDR1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEM_ADDR2").focus();
            }
        }).open();
    }
</script>

<style>
.vertical-menu {
  width: 200px;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #04AA6D;
  color: white;
}

input[type=text], select {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 50%;
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
textarea {
  width: 70%;
  height: 200px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  resize: none;
}

button{
	background-color: #B2BEB5;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

h1{
text-align:center;
}

p{
text-align:center;
}
</style>
   </head>
   
   <% 
   String id = (String)session.getAttribute("MEM_ID");
   System.out.println("세션값 확인 : "+id);
   %>
   
   
   
   <body>
	<!-- header section end -->
	
	<!-- contact section start -->
	<div id="wrap">
	<%@ include file="../../include/mypage_left.jsp" %>
		<div class="content">
			<div class="register_center">
                    	<!-- form id값은 common.js	 참고 -->
                        <form id="detailForm" action="/updateForm.da">
                            <br>
                           	
                            <input class="login_taital" id="MEM_ID" name="MEM_ID" type="hidden" value="${map.MEM_ID}" readonly><h1 class="register_center" align="center">${map.MEM_ID}님</h1>
                            <!--  수정 불가 항목
                            비밀번호    
                            <input class="detail_text" id="MEM_PWD" name="MEM_PWD" type="password"> 
                            비밀번호 확인
                            <input class="detail_text" id="MEM_PWD2" name="MEM_PWD2" type="password">  
                            -->
                            
                            <br><br>
                            <p>이름</p>
                            <input class="" id="MEM_NAME" name="MEM_NAME" value="${map.MEM_NAME}" type="hidden" disabled>
                            <h1>${map.MEM_NAME}</h1><br><br>
                            <p>이메일</p>
                            <input class="" id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL}" type="hidden" disabled>
                            <h1>${map.MEM_EMAIL}</h1><br><br>
                            <p>전화번호</p>
                            <input class="" id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE}" type="hidden" disabled>
                            <h1>${map.MEM_PHONE}</h1><br><br>
                            <p>주소</p><br>
                            <input class="" id="MEM_ZP" name="MEM_ZP" value="${map.MEM_ZP}" type="hidden" disabled>
                            <h1>${map.MEM_ZP}</h1>&nbsp;&nbsp;<br><br>
                            <input class="" id="MEM_ADDR1" name="MEM_ADDR1" value="${map.MEM_ADDR1}" type="hidden" disabled>
                            <h1>${map.MEM_ADDR1}</h1><br><br>
                            <p>상세주소</p>
                            <input class="" id="MEM_ADDR2" name="MEM_ADDR2" value="${map.MEM_ADDR2}" type="hidden" disabled>
                            <h1>${map.MEM_ADDR2}</h1><br><br>
                            	
                                <button class="register_center" id ="update" onclick="check(this.form)">수정</button></form>
                                <form id="delete" action="/coffeedao/deleteMember.da" >
                                <input class="login_taital" id="MEM_ID" name="MEM_ID" type="hidden" value="${map.MEM_ID}" >
                                <button class="register_button" id ="delete" onclick="return result">회원탈퇴</button></form>
                                <br>
                                
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
      <script src="../resources/js/jquery.min.js"></script>
      <script src="../resources/js/popper.min.js"></script>
      <script src="../resources/js/bootstrap.bundle.min.js"></script>
      <script src="../resources/js/jquery-3.0.0.min.js"></script>
      <script src="../resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="../resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="../resources/js/custom.js"></script>
      <!-- javascript --> 
      <script>
	function check() {
		var MEM_ID = document.getElementById("MEM_ID");
		var MEM_PWD = document.getElementById("MEM_PWD");
		var MEM_PWD2 = document.getElementById("MEM_PWD2");
		var MEM_NAME = document.getElementById("MEM_NAME");
		var MEM_EMAIL = document.getElementById("MEM_EMAIL");
		var MEM_ADDR1 = document.getElementById("MEM_ADDR1");
		var MEM_ADDR2 = document.getElementById("MEM_ADDR2");
		var MEM_PHONE = document.getElementById("MEM_PHONE");
		var MEM_ZP = document.getElementById("MEM_ZP");	
	
		
		if(MEM_ID.value.trim() == ""){
			alert("아이디를 입력해주세요.");
			MEM_ID.focus();
			return false;
		}

		if(MEM_PWD.value.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			MEM_PWD.focus();
			return false;
		}
		
		if(MEM_PWD2.value.trim() == ""){
			alert("비밀번호를 다시 입력해주세요.");
			MEM_PWD2.focus();
			return false;
		}
		
		if(MEM_PWD2.value != MEM_PWD.value){
			alert("비밀번호가 일치하지 않습니다.");
			MEM_PWD2.focus();
			return false;
		}
		
		if(MEM_NAME.value.trim() == ""){
			alert("이름을 입력해주세요.");
			MEM_NAME.focus();
			return false;
		}
		
		if(MEM_EMAIL.value.trim() == ""){
			alert("이메일를 입력해주세요.");
			MEM_EMAIL.focus();
			return false;
		}
		
		if(MEM_ADDR1.value.length<6) {
			alert("주소를 입력해주세요.");
			MEM_ADDR1.focus();
			return false;
		}
		
		if(MEM_ADDR2.value.trim() == ""){
			alert("상세 주소를 입력해주세요.");
			MEM_ADDR2.focus();
			return false;
		}
		
		
		if(MEM_ZP.value.trim() == ""){
			alert("우편번호를 입력해주세요.");
			MEM_ZP.focus();
			return false;
		}

		if(MEM_PHONE.value.trim() == ""){
			alert("핸드폰 번호를 입력해주세요.");
			MEM_PHONE.focus();
			return false;
		}		
		document.registerForm.submit();
	}
</script>

<script>

$(document).ready(function(){
$("#update").on("click", function(e){ //수정하기 버튼
	e.preventDefault();
	fn_updateMember();
});
});

function fn_updateMember(){
	location.href='/coffeedao/updateForm.da'
}

$(document).ready(function(){
	$("#delete").on("click", function(e){
		//탈퇴하기 버튼
var result = confirm("회원 탈퇴를 하시겠습니까?");
	if(result) {
    	alert("탈퇴 처리되었습니다.");
    	location.href='/coffeedao/deleteMember.da'

	} else {
    	alert("탈퇴 취소되었습니다.");
    	return false;
}
	});
});
</script>

      <script src="../resources/js/owl.carousel.js"></script>
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
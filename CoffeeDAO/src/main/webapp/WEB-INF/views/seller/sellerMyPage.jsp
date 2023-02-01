<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!DOCTYPE html>
<html lang="en">
   <head>
   <!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>

.filebox label {
display: inline-block;
    font-size: 14px;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    position: absolute;
    left: 0;
    
    width: 267px;
    height: 32px;
    background-color: transparent;
    border: none;
}

.label {
display: inline-block;
    font-size: 14px;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 5px;
    position: absolute;
    left: 0;
    
    width: 267px;
    height: 32px;
    background-color: transparent;
    border: none;
}

.filebox .btn_save {
    /* width: 76px; */
    height: 32px;
    padding: 6px 12px;
    border: 1px solid #dbdbdb;
    border-radius: 5px;
    color: #777;
    font-size: 14px;
    font-family: 'NotoSansKR-Regular';
    background-color: #fff;
    vertical-align: middle;
    cursor: pointer;
    bottom:0px;
}

/* .filebox input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
} */

.input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
    align: center;
} 

  textarea {
    width: 100%;
    height: 8em;
    border: none;
    resize: none;
  }
  
  .modify_bank{
    width: 15%;
    height : 50px;
    padding: 10px 20px;
    margin: 8px 0;
    box-sizing: border-box;
}

  .modify_bnum{
    width: 40%;
    height : 50px;
    padding: 10px 20px;
    margin: 8px 0;
    box-sizing: border-box;
}

.upload-name {
    display: inline-block;
    font-size: 14px;
    vertical-align: middle;
    background-color: #fff;
    border: 1px solid #dbdbdb;
    border-radius: 5px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    width: 296px;
    height: 32px;
    padding: 10px 29px 10px 16px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    align: center;
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

</style>
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
                    document.getElementById("SELL_ADDR2").value = extraAddr;
                
                } else {
                    document.getElementById("SELL_ADDR2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('SELL_ZP').value = data.zonecode;
                document.getElementById("SELL_ADDR1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("SELL_ADDR2").focus();
            }
        }).open();
    }
</script>
   </head>
   
   <% 
   String id = (String)session.getAttribute("SELL_ID");
   System.out.println("세션값 확인 : "+id);
   %>
   
   
   
   
   <body>
 <!-- product section start -->
      <div id="wrap">
      <%@ include file="../../include/sellerMypage_left.jsp" %>
         <div class="content">
            <div align="center">
               <h1 class="login_taital">사업자 정보</h1>
            </div>
            <div>
                <div align="center">
               
                    	<!-- form id값은 common.js	 참고 -->
                        <form id="sellerMyPage" action="/coffeedao/sellerModifyForm.da" enctype="multipart/form-data">
                            <br>
                            
                            
                           	
                            <input class="login_taital" id="SELL_ID" name="SELL_ID" type="hidden" value="${map.SELL_ID}" >
                            
                            <!--  마이페이지에선 보이지 않지만 수정 시 보여지게 됨
                            비밀번호    
                            <input class="detail_text" id="MEM_PWD" name="MEM_PWD" type="password"> 
                            비밀번호 확인
                            <input class="detail_text" id="MEM_PWD2" name="MEM_PWD2" type="password">  
                            -->
                            
                            <br><br>
                            상호
                            <input class="" id="SELL_NAME" name="SELL_NAME" value="${map.SELL_NAME}" type="hidden" disabled>
                            <h1>${map.SELL_NAME}</h1><br><br>
                            사업자번호
                            <input class="" id="SELL_NUM" name="SELL_NUM" value="${map.SELL_NUM}" type="hidden" disabled>
                            <h1>${map.SELL_NUM}</h1><br><br>                         
                            
                            이메일
                            <input class="" id="SELL_EMAIL" name="SELL_EMAIL" value="${map.SELL_EMAIL}" type="hidden" disabled>
                            <h1>${map.SELL_EMAIL}</h1><br><br>
                            전화번호
                            <input class="" id="SELL_PHONE" name="SELL_PHONE" value="${map.SELL_PHONE}" type="hidden" disabled>
                            <h1>${map.SELL_PHONE}</h1><br><br>
                            계좌
                            <input class="" id="SELL_BANK" name="SELL_BANK" value="${map.SELL_BANK}" type="hidden" disabled>
                            <h1>${map.SELL_BANK}</h1><br><br>
                
                <input class="" id="SELL_BNUM" name="SELL_BNUM" value="${map.SELL_BNUM}" type="hidden" disabled>
                            <h1>${map.SELL_BNUM}</h1><br><br>
                            
                            
                            주소<br>
                            <input class="" id="SELL_ZP" name="SELL_ZP" value="${map.SELL_ZP}" type="hidden" disabled>
                            <h1>${map.SELL_ZP}</h1>&nbsp;&nbsp;<br><br>
                            <input class="" id="SELL_ADDR1" name="SELL_ADDR1" value="${map.SELL_ADDR1}" type="hidden" disabled>
                            <h1>${map.SELL_ADDR1}</h1><br><br>
                            상세주소
                            <input class="" id="MEM_ADDR2" name="MEM_ADDR2" value="${map.SELL_ADDR2}" type="hidden" disabled>
                            <h1>${map.SELL_ADDR2}</h1><br><br>
                            
                                                        <BR><BR><BR><BR>
                            <hr />
                            <BR>
                            <h1 class="login_taital2" align="center">업체 정보</h1>
                            <BR><BR>
                            프로필 이미지<BR>
                             <div class="filebox" style="position:relative;height:140px;">
                           <!-- 업체 이미지 있으면 경로에서 가져오고 없으면 기본이미지 -->
                             <c:choose>
                             <c:when test="${map.SELL_PROF == null}">
                            
                             <img src="resources/images/camera.png" width=120px, height=120px style= "margin : 20px; border: 1px solid;">
                             </c:when>
                             
                             <c:otherwise>
                            <img src="resources/img/${map.SELL_PROF}" width=120px, height=120px style= "margin : 20px; border: 1px solid;">
                            </c:otherwise>
                            </c:choose>
                            
             <div class="filebox"
								style="position: relative; height: 0px; ">
								<div style="position: absolute; right: 43%; bottom: 0px;">
									<input class="upload-name" type="hidden" value="${map.SELL_PROF }" disabled>
									

								</div>
							</div>
        </div>    
        <BR>
        <p>${map.SELL_CONT}</p><BR>
            <BR>   
            업체 소개 이미지 <BR> 

            <div align="center">
				<c:choose>
					<c:when test="${map.SELL_PROF == null}">

						<img src="resources/images/seller.PNG" width=120px,
							height=120px style="margin: 20px; border: 1px solid;">
						<img src="resources/images/seller.PNG" width=120px,
							height=120px style="margin: 20px; border: 1px solid;">
					</c:when>
					<c:otherwise>
					<!-- 사진이 있으면 출력 -->
					<c:set var="items" value="${fn:split(map.SELL_IMAGE, ',')}"/>
						<c:forEach var="i" begin="1" end="${fn:length(items)}">
							<img src="resources/img/${fn:split(map.SELL_IMAGE,',')[i-1]}"
								width=170px, height=170px
								style="margin: 20px; border: 1px solid; align: center;">
								
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div><br>

							<div class="filebox" style="position: relative; height: 0px;">
								<div
									style="position: absolute; absolute; right: 30%; bottom: 0px;">
									<input class="upload-name" type="hidden" value="${map.SELL_IMAGE }" disabled>


								</div>
							</div>
							<BR>
            <BR>
            <BR>
            <img style=" border: 1px ; border-radius: 70%; " src="resources/images/insta1.png" width=40px, height=40px style= "margin : 20px; ">
&nbsp;&nbsp;&nbsp;&nbsp;@${map.SELL_SNS}
<BR><BR><BR>
            
                        
                            <div class="detail_subcenter"></div>
                                <button id ="update" onclick="check(this.form)">수정</button><br><br> </form>
                                <form id="delete" action="/coffeedao/sellerDelete.da" >
                                <input class="login_taital" id="SELL_ID" name="SELL_ID" type="hidden" value="${map.SELL_ID}" >
                                <button id ="delete" onclick="return result">회원탈퇴</button></form>
                                <br>
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

$(document).ready(function(){
$("#modify").on("click", function(e){ //수정하기 버튼
	e.preventDefault();
	fn_updateMember();
});
});

function fn_updateMember(){
	location.href='/coffeedao/sellerModifyForm.da'
}


</script>

<script>

$(document).ready(function(){
	$("#delete").on("click", function(e){ //탈퇴하기 버튼

var result = confirm("회원 탈퇴를 하시겠습니까?");
if(result) {
    alert("탈퇴 처리되었습니다.");
    location.href='/coffeedao/sellerDelete.da'

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
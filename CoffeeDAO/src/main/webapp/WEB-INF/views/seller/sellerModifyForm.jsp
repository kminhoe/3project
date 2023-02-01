<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
      <div class="product_section layout_padding">
      	
        <div class="row">
            <div class="col-md-12">
               <h1 class="login_taital">사업자 정보</h1>
            </div>
            <div class="container">
                <div>
               
                    <div align="center">
                    	<!-- form id값은 common.js 참고 -->
                        <form id="sellerMyPage" action="sellerModifyPro.da" enctype="multipart/form-data" method="post">
                            <br>
                            
                            
                           	
                            <input class="login_taital" id="SELL_ID" name="SELL_ID" type="hidden" value="${map.SELL_ID}" >
                            
                            
                            비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
                            <input class="detail_text" id="SELL_PWD" name="SELL_PWD" type="password"> <br>
                            비밀번호 확인
                            <input class="detail_text" id="SELL_PWD2" name="SELL_PWD2" type="password">  
                            
                            
                            <br><br>
                            상호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="register_text" id="SELL_NAME" name="SELL_NAME" value="${map.SELL_NAME}" type="text" >
                            <br><br>
                            사업자번호
                            <input class="register_text" id="SELL_NUM" name="SELL_NUM" value="${map.SELL_NUM}" type="hidden" disabled>
                            <h1>${map.SELL_NUM}</h1>
                            <br>                         
                            
                            이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="register_text" id="SELL_EMAIL" name="SELL_EMAIL" value="${map.SELL_EMAIL}" type="text" >
                            <br><br>
                            전화번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="register_text" id="SELL_PHONE" name="SELL_PHONE" value="${map.SELL_PHONE}" type="text" >
                            <br><br> 계좌 <br>
                            <select class="modify_bank" id="SELL_BANK"
								name="SELL_BANK">
								<option value="국민은행">국민은행</option>
								<option value="우리은행">우리은행</option>
							</select> 

                
                <input class="modify_bnum" id="SELL_BNUM" name="SELL_BNUM" value="${map.SELL_BNUM}" type="text" >
                            <br><br>
                            
                            
                            주소<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="register_text" id="SELL_ZP" name="SELL_ZP" value="${map.SELL_ZP}" type="text" >
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                            <input class="register_text" id="SELL_ADDR1" name="SELL_ADDR1" value="${map.SELL_ADDR1}" type="text" >
                            <br><br>
                            상세주소
                            <input class="register_text" id="SELL_ADDR2" name="SELL_ADDR2" value="${map.SELL_ADDR2}" type="text" >
                            <br><br>
                            
                                                        <BR><BR><BR><BR>
                            <hr />
                            <BR>
                            <h1 class="login_taital2" align="center">업체 정보</h1>
                            <BR><BR>
 
                            업체 프로필 이미지 등록<BR>
                             <div  style="position:relative;height:140px;">
                            <img id="preview" src="resources/images/camera.png" width=120px, 
                            height=120px style= "margin : 20px; border: 1px solid;">
                            <div style="position:absolute; right:40%; bottom:0px;">     
                  <input id="SELL_PROF" name="SELL_PROF_UPLOADFILE" type="file" class="upload-hidden" onchange="readURL(this);">

               <BR>
            
       </div>
        </div>    
        <BR>
							<textarea id="SELL_CONT" name="SELL_CONT">${map.SELL_CONT}</textarea>
							<BR> <BR> 업체 소개 이미지 등록(최대 2개) <BR>
							<div align="center">
								<img id="one" src="resources/images/seller.PNG" width=170px, height=170px
									style="margin: 20px; border: 1px solid; align: center;">
								<img id="two" src="resources/images/seller.PNG" width=170px, height=170px
									style="margin: 20px; border: 1px solid; align: center">
							</div>
							<br>
							

							 <div 
								style="position: relative; height: 0px; ">
								<div style="position: absolute; right: 30%; bottom: 0px;">
									<input id="SELL_IMAGE" name="SELL_IMAGE_UPLOADFILE"
										type="file" class="upload-hidden" onchange="readURL2(this);" multiple>
								</div>
							</div> 
							<BR>
							
            <BR>
            <BR>
            <img style=" border: 1px ; border-radius: 70%; " src="resources/images/insta1.png" width=40px, height=40px style= "margin : 20px; ">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="SELL_SNS" name="SELL_SNS" value="${map.SELL_SNS}"/>
<BR><BR><BR>
            
                        
                            <div class="detail_subcenter">
                                <button  class="register_button" id ="modify" onclick="return check(this.form)">수정</button><br><br>
                                
                                <br>
                            </div>
                        </form>    
                    </div>
                </div>
            </div>
        </div>
      </div>
      <!-- product section start -->
   
 
      <!-- copyright section start -->
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
	
		var SELL_PWD = document.getElementById("SELL_PWD");
		var SELL_PWD2 = document.getElementById("SELL_PWD2");
		var SELL_NAME = document.getElementById("SELL_NAME");
		var SELL_EMAIL = document.getElementById("SELL_EMAIL");
		var SELL_ADDR1 = document.getElementById("SELL_ADDR1");
		var SELL_ADDR2 = document.getElementById("SELL_ADDR2");
		var SELL_PHONE = document.getElementById("SELL_PHONE");
		var SELL_ZP = document.getElementById("SELL_ZP");	
		var SELL_PROF_UPLOADFILE = document.getElementById("SELL_PROF_UPLOADFILE");	
		var SELL_IMAGE_UPLOADFILE = document.getElementById("SELL_IMAGE_UPLOADFILE");	
	
		if(SELL_PROF_UPLOADFILE.value.trim() == ""){
			alert("업체 프로필 이미지를 첨부해주세요.");
			SELL_PWD.focus();
			return false;
		}
		
		if(SELL_IMAGE_UPLOADFILE.value.trim() == ""){
			alert("업체 소개 이미지를 첨부해주세요.");
			SELL_PWD.focus();
			return false;
		}

		if(SELL_PWD.value.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			SELL_PWD.focus();
			return false;
		}
		
		if(SELL_PWD2.value.trim() == ""){
			alert("비밀번호를 다시 입력해주세요.");
			SELL_PWD2.focus();
			return false;
		}
		
		if(SELL_PWD2.value != MEM_PWD.value){
			alert("비밀번호가 일치하지 않습니다.");
			SELL_PWD2.focus();
			return false;
		}
		
		if(SELL_NAME.value.trim() == ""){
			alert("이름을 입력해주세요.");
			SELL_NAME.focus();
			return false;
		}
		
		if(SELL_EMAIL.value.trim() == ""){
			alert("이메일를 입력해주세요.");
			SELL_EMAIL.focus();
			return false;
		}
		
		if(SELL_ADDR1.value.length<6) {
			alert("주소를 입력해주세요.");
			SELL_ADDR1.focus();
			return false;
		}
		
		if(SELL_ADDR2.value.trim() == ""){
			alert("상세 주소를 입력해주세요.");
			SELL_ADDR2.focus();
			return false;
		}
		
		
		if(SELL_ZP.value.trim() == ""){
			alert("우편번호를 입력해주세요.");
			SELL_ZP.focus();
			return false;
		}

		if(SELL_PHONE.value.trim() == ""){
			alert("핸드폰 번호를 입력해주세요.");
			SELL_PHONE.focus();
			return false;
		}		
		document.sellerMyPage.submit();
	}
</script>

<script>

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;

	      
	    };
	    reader.readAsDataURL(input.files[0]);
	   
	  } else {
	    document.getElementById('preview').src = "resources/images/camera.png";
	  }
	}
	
	
$("#SELL_PROF").on('change',function(){
	  var fileName = $("#SELL_PROF").val();
	  $(".upload-name").val(fileName);
	  console.log(fileName);
	});
	
	
function readURL2(input) {
	  if (input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('one').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('one').src = "resources/images/seller.PNG";
	  }
	  
	  if (input.files[1]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('two').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[1]);
		  } else {
		    document.getElementById('two').src = "resources/images/seller.PNG";
		  }
	  
	 
	  
	  
	}
	
	
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
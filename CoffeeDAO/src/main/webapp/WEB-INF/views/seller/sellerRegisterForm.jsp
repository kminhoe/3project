<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피다오</title>

<style>

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
</head>

<body>
 <!-- product section start -->
      <div class="product_section layout_padding">
        <div align="center">
            <div>
               <h1>판매자 가입</h1>
            </div>
            <div class="container">
                <div>
                    <div align="center">
        <form id="sellerRegisterForm" name="sellerRegisterForm" method="POST" enctype="multipart/form-data" action="/coffeedao/sellerRegister.da">
        아이디<br/>               
		<input style="width:39%" class="register_zp" type="text" id="SELL_ID" name="SELL_ID" >
		<input class="register_button2" type="button" value="중복확인" name="check_id" onClick="location.href='/coffeedao/sellerConfirmId.da?SELL_ID=' + $('#SELL_ID').val()"><br/>
		비밀번호<br/> 
		<input class="register_text" type="password" id="SELL_PWD" name="SELL_PWD" ><br/>
		비밀번호 확인 <br/>
		<input class="register_text" type="password" id="SELL_PWD2" name="SELL_PWD2" ><br/>
		이메일 <br/>
		<input class="register_text" type="text" id="SELL_EMAIL" name="SELL_EMAIL"><br/>
		전화번호<br/>
		<input class="register_text" type="text" id="SELL_PHONE" name="SELL_PHONE"><br/>
		상호명<br/>
		<input class="register_text" type="text" id="SELL_NAME" name="SELL_NAME"><br/>
		사업자번호<br/>
		<input class="register_text" type="text" id="SELL_NUM" name="SELL_NUM" ><br/>
		우편번호<br/>
		<input class="register_zp" style="width:36%" type="text" id="SELL_ZP" name="SELL_ZP" readonly>
		<input class="register_button2" type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br/>
		주소<br/>
		<input class="register_text" type="text" id="SELL_ADDR1" name="SELL_ADDR1" readonly><br>
		
		상세 주소 <br/>
		<input class="register_text" type="text" id="SELL_ADDR2" name="SELL_ADDR2" readonly><br/>
		
		<div class="container">
		업체 로고 이미지<br> <input type="file" name="SELL_PROF_UPLOADFILE" placeholder="파일 선택"><br/>
		
		업체 소개 이미지 <br><input type="file" name="SELL_IMAGE_UPLOADFILE" multiple placeholder="파일 선택"><br/>
		</div>
		
		<!-- <input class="register_text" type="text" id="SELL_CONT" name="SELL_CONT" value="기업 소개"><br/> -->
		기업 소개<br/>
		<textarea class="register_text" id="SELL_CONT" name="SELL_CONT" rows="20" cols="50"></textarea><br/>
		SNS<br/>
		<input class="register_text" type="text" id="SELL_SNS" name="SELL_SNS"><br/><br/>
		<!-- <input type="submit" value="회원가입"> -->
        <button type="button" onClick="check(this.form)">회원가입</button><br/>
	</form>  
                    </div>
                </div>
            </div>
        </div>
      </div>
      <!-- product section start -->
	
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function check() {
		var SELL_ID = document.getElementById("SELL_ID"); // 아이디
		var SELL_PWD = document.getElementById("SELL_PWD"); // 패스워드
		var SELL_PWD2 = document.getElementById("SELL_PWD2"); // 패스워드 확인
		var SELL_NAME = document.getElementById("SELL_NAME"); // 상호명
		var SELL_NUM = document.getElementById("SELL_NUM"); // 사업자 번호
		var SELL_EMAIL = document.getElementById("SELL_EMAIL"); // 이메일
		var SELL_ADDR1 = document.getElementById("SELL_ADDR1"); // 주소
		var SELL_ADDR2 = document.getElementById("SELL_ADDR2"); // 상세 주소
		var SELL_PHONE = document.getElementById("SELL_PHONE"); // 전화 번호
		var SELL_ZP = document.getElementById("SELL_ZP"); // 우편번호
		var SELL_CONT = document.getElementById("SELL_CONT"); // 기업 내용
	
		
		if(SELL_ID.value.trim() == ""){
			alert("아이디를 입력해주세요.");
			SELL_ID.focus();
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
		
		if(SELL_PWD2.value != SELL_PWD.value){
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
		
		if(SELL_PHONE.value.trim() == ""){
			alert("핸드폰 번호를 입력해주세요.");
			SELL_PHONE.focus();
			return false;
		}
		
		if(SELL_ADDR1.value.length == "") {
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
		
		if(SELL_CONT.value.trim() == ""){
			alert("기업 소개란을 입력해주세요.");
			SELL_PHONE.focus();
			return false;
		}
		
		document.sellerRegisterForm.submit();
	}
</script>

<script>
function DaumPostcode() {
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
</html>
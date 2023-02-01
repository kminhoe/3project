<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../include/header.jsp" %>

<!DOCTYPE html>
<html>

<style>

select {

  position: relative;
  width: 150px;
  height: 35px;
  margin: 13px;

}



</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


      <div id="wrap">
		<%@ include file="../../include/inquiry_left.jsp" %>
         <div class="content" id="inquiry">
         <form id="inquiryWriteForm" name="inquiryWriteForm" enctype="multipart/form-data" method="POST"
         action="/coffeedao/inquiryWrite.da">
            <input type="text" class="mail_text2" placeholder="제목" id="QA_TITLE" name="QA_TITLE">
            
            <select style="width: 80%;" id="QA_CLASS" name="QA_CLASS">
            <option value="회원정보" selected>회원정보</option>
            <option value="주문 결제 배송">주문 결제 배송</option>
            <option value="취소 반품 교환">취소 반품 교환</option>
            <option value="기타">기타</option>
         </select>
            
            <textarea class="massage-bt" placeholder="내용" rows="5" id="QA_CONT" name="QA_CONT"></textarea>
            <!-- <input type="hidden" name="BO_TYPE" value="N"> -->
            <br>
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
				<label for="inquiry_file">파일 업로드</label> 
				<input type="file" id="inquiry_file" name="QA_FILE" class="upload-hidden"> 
			</div>
            <br>
            <div class="send_bt" onClick="inquiryS()"><a>작성하기</a></div>
            <div class="send_bt"><a href="/coffeedao/inquiryList.da">목록보기</a></div>
         </form>
         </div>
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
  	  <%@ include file="../../include/footer.jsp" %>


<script>

function inquiryS() {
	if(document.getElementById("QA_TITLE").value==''){
		alert("제목을 입력해주십시오.");
		return false;
	}
	if(document.getElementById("QA_CONT").value==''){
		alert("내용를 입력해주십시오.");
		return false;
	}

	document.getElementById('inquiryWriteForm').submit();
	}

</script>
</body>
</html>
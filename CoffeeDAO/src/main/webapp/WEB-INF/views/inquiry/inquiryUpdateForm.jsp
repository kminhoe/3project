<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../include/header.jsp" %>

 <!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
         <div id="inquiry">
         <form id="inquiryUpdateForm" name="inquiryUpdateForm" enctype="multipart/form-data" method="POST"
         action="/coffeedao/inquiryUpdate.da">
           <input type="hidden" id="QA_IDX" name="QA_IDX" value="${detail.QA_IDX}">
           <input type="hidden" name="pageNum" value="${cri.pageNum}">
           <input type="hidden" name="amount" value="${cri.amount}">
            <input type="text" class="mail_text2" id="QA_TITLE" name="QA_TITLE" value="${detail.QA_TITLE}">
            
            <c:choose>
            <c:when test="${detail.QA_CLASS == '회원정보'}">
            <select style="width: 80%;" id="QA_CLASS" name="QA_CLASS">
            <option value="회원정보" selected>회원정보</option>
            <option value="주문 결제 배송">주문 결제 배송</option>
            <option value="취소 반품 교환">취소 반품 교환</option>
            <option value="기타">기타</option>
            </select>
            </c:when>
            
            <c:when test="${detail.QA_CLASS == '주문 결제 배송'} ">
            <select style="width: 80%;" id="QA_CLASS" name="QA_CLASS">
            <option value="회원정보" >회원정보</option>
            <option value="주문 결제 배송" selected>주문 결제 배송</option>
            <option value="취소 반품 교환">취소 반품 교환</option>
            <option value="기타">기타</option>
            </select>
            </c:when>
            
            <c:when test="${detail.QA_CLASS == '취소 반품 교환'}">
            <select style="width: 80%;" id="QA_CLASS" name="QA_CLASS">
            <option value="회원정보" >회원정보</option>
            <option value="주문 결제 배송">주문 결제 배송</option>
            <option value="취소 반품 교환" selected>취소 반품 교환</option>
            <option value="기타">기타</option>
            </select>
            </c:when>
            
            <c:otherwise>
            <select style="width: 80%;" id="QA_CLASS" name="QA_CLASS">
            <option value="회원정보">회원정보</option>
            <option value="주문 결제 배송">주문 결제 배송</option>
            <option value="취소 반품 교환">취소 반품 교환</option>
            <option value="기타" selected>기타</option>
            </select>
            </c:otherwise>
            
            </c:choose>
            
            
            <textarea class="massage-bt" rows="5" id="QA_CONT" name="QA_CONT">
            ${detail.QA_CONT}</textarea>
    
            <br>
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="${detail.QA_IMAGE}" disabled="disabled" style="width: 200px;">
				<label for="inquiry_file">파일 업로드</label> 
				<input type="file" id="inquiry_file" name="QA_FILE" class="upload-hidden" > 
			</div>
            <br>
            <div class="send_bt" onClick="inquiryS()"><a>수정하기</a></div>
            <div class="send_bt"><a id="list">목록보기</a></div>
         </form>
         </div>
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
  	  <%@ include file="../../include/footer.jsp" %>


<script>


	function inquiryS() {
		if (document.getElementById("QA_TITLE").value == '') {
			alert("제목을 입력해주십시오.");
			return false;
		}
		if (document.getElementById("QA_CONT").value == '') {
			alert("내용를 입력해주십시오.");
			return false;
		}

		document.getElementById('inquiryUpdateForm').submit();
	}


</script>

<script>

let form = $("#inquiryUpdateForm");

$("#list").on("click", function(e) {
	form.find("#QA_IDX").remove();
	form.attr("action", "inquiryList.da");
	form.submit();
});

</script>
</body>
</html>
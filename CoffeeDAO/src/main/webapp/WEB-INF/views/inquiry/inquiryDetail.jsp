<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="wrap">
		<%@ include file="../../include/inquiry_left.jsp" %>
         <div class="content" id="inquiry">
         <form id="inquiryDetailForm" name="inquiryDetailForm" enctype="multipart/form-data" 
         action="/coffeedao/inquiryUpdateForm.da">
         <input type="hidden" id="QA_IDX" name="QA_IDX" value="${detail.QA_IDX}">
         <input type="hidden" name="pageNum" value="${cri.pageNum}">
         <input type="hidden" name="amount" value="${cri.amount}">
            <h3>[${detail.QA_CLASS}]</h3><h1>${detail.QA_TITLE}</h1><br/><hr>
            <h3>${detail.QA_WRITER}</h3>

            <hr>
				<c:choose>
					<c:when test="${empty detail.QA_IMAGE }">
						<div style="height: 200px;">
							<p>${detail.QA_CONT}</p>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<p>${detail.QA_CONT}</p>
						</div>
					</c:otherwise>
				</c:choose>

				<!-- <input type="hidden" name="BO_TYPE" value="N"> -->
            <br>
			<div class="filebox bs3-primary preview-image">
			<c:choose>
				<c:when test="${empty detail.QA_IMAGE }"></c:when> 
				<c:otherwise>
					<img src="resources/img/${detail.QA_IMAGE}" width=50%>
				</c:otherwise>
			</c:choose>
			</div>
            <br>
            <div class="send_bt"><a id="list">목록보기</a></div>
            
            <c:if test="${id == detail.QA_WRITER}">
            <div class="send_bt"><a id="update">수정하기</a></div>
            <div class="send_bt"><a id="delete">삭제하기</a></div>
            </c:if>
         </form>
         </div>
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
  	  <%@ include file="../../include/footer.jsp" %>

</body>

<script>

let form = $("#inquiryDetailForm");

$("#list").on("click", function(e){
	form.find("#QA_IDX").remove();
	form.attr("action", "inquiryList.da");
	form.submit();
});

$("#update").on("click", function(e){
	form.attr("action", "inquiryUpdateForm.da");
	form.submit();
});

$("#delete").on("click", function(e){
	
	if(confirm("삭제하시겠습니까?") == true){
		form.attr("action", "inquiryDelete.da");
		form.submit();
	}
	else {
		false;
	}
});

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/adminHeader.jsp" %>
<%@ include file="../../include/adminNavbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.collapsible_admin {
  background-color: #777;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible_admin:hover {
  background-color: #555;
}

.content_admin {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #777;
  color: white;
}

.pagination {
  display: inline-block;
  margin: 0 auto;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: #777;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

/* Set a style for all buttons */
button {
  background-color: #777;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.button2 {
  background-color: #777;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 10%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  float: left;
  width: 50%;
}

/* Add a color to the cancel button */
.cancelbtn {
  background-color: #ccc;
  color: black;
}

/* Add a color to the delete button */
.deletebtn {
  background-color: #f44336;
}

/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* The Modal Close Button (x) */
.closes {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.closes:hover,
.closes:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='resources/js/common.js'/>" charset="utf-8"></script>
</head>
<body>

<div id=main>
<h1 align="center">COFFEEDAO ADMIN</h1>

<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 공지사항</span>

<form id="Search" name="Search" method="post" action="/coffeedao/adminSellerList.da">
	<input type="text" class="mail_text" placeholder="Search" id="keyword" name="keyword">
	<button class="send_bt" onClick="check(this.form)">검색</button>
</form>
<!-- modal -->
<div align="right">
<button style="background-color:#04AA6D; width:30%;" id="myBtn">글쓰기</button>
</div>
<div>
<c:forEach items="${freeTalkList}" var="member">
	<button class="collapsible_admin">${member.BO_TITLE}</button>
		<div class="content_admin">
  			<table id="customers">
  				<thead>
  					<tr>
  						<th></th>
  						<th colspan="4">CONTENT</th>
  						<th>DATE</th>
  						<th>COUNT</th>
  						<th></th>
  					</tr>
  				</thead>
  				<tbody>
  					<tr>
  						<c:choose>
  							<c:when test="${member.BO_IMAGE == null}">
  								<td></td>
  							</c:when>
  							<c:otherwise>
  								<td><img  width="150" height="150" src="resources/img/${member.BO_IMAGE}"></td>
  							</c:otherwise>	
  						</c:choose>
  						<td colspan="4">${member.BO_CONT}</td>
  						<td>${member.BO_DATE}</td>
  						<td>${member.BO_COUNT}</td>
  						<td>
  							<button id="thisBtn">수정 / 삭제</button>
  						</td>
  					</tr>
  				</tbody>
  			</table>
		</div>
</c:forEach>
</div>
<!-- 페이징 처리 부분-->
			<div class="pagination">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/coffeedao/boardList.da?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<a class="active">${p}</a>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a href="/coffeedao/boardList.da?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/coffeedao/boardList.da?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
			<!-- 페이징 처리 끝 -->
</div>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal write form content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <div class="register_center">
    <form method="post" enctype="multipart/form-data" action="/coffeedao/adminNoticeWrite.da">
    <h2>Write a notice</h2>
    Title<br>
    <input class="register_text" type="text" id="BO_TITLE" name="BO_TITLE"><br>
    Content<br>
    <textarea class="register_text" id="BO_CONT" name="BO_CONT" rows="10" cols="100"></textarea><br>
    Upload<br>
    <div class="filebox bs3-primary preview-image">
		<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
		<label for="input_file">파일 업로드</label> 
		<input type="file" id="input_file" name="BO_IMAGE_FILE" class="upload-hidden"> 
	</div>
    <button style="background-color:#f44336" type="button" onclick="document.getElementById('myModal').style.display='none'">Cancel</button>
    <button style="background-color:#04AA6D" type="submit">Submit</button>
    </form>
    </div>
  </div>

</div>
<!-- modal end -->

<!-- modal js -->

<script>
// Get the modal
var modal = document.getElementById("myModal");
var modal2 = document.getElementById("thisModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var btn2 = document.getElementById("thisBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var span2 = document.getElementsByClassName("closes")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

btn2.onclick = function() {
	modal2.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

span2.onclick = function(){
	modal2.style.display = "none";
}


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal || event.target == modal2) {
    modal.style.display = "none";
    modal2.style.display = "none";
  }
}
</script>

<!-- modal js end -->

<!-- 파일 -->

<script>
   $(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
   </script>

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
     

<script>
		function check() {
			var keyword = document.getElementById("keyword"); // 키워드

			if (keyword.value.trim() == ""){ alert("키워드를 입력해주세여."); keyword.focus(); return false; }

			document.Search.submit();
		}
	</script>
<script>

$(document).ready(function(){
	$("#validate").on("click", function(e){ //탈퇴하기 버튼

var result = confirm("회원 탈퇴를 하시겠습니까?");
if(result) {
    alert("탈퇴 처리되었습니다.");
    location.href='/coffeedao/adminSellerValidate.da'

} else {
    alert("탈퇴 취소되었습니다.");
    return false;
}

});
});
</script>
	<script>
		var coll = document.getElementsByClassName("collapsible_admin");
		var i;

		for (i = 0; i < coll.length; i++) {
  			coll[i].addEventListener("click", function() {
    		this.classList.toggle("active");
    		var content = this.nextElementSibling;
    	if (content.style.maxHeight){
      		content.style.maxHeight = null;
    		} 
    	else {
      		content.style.maxHeight = content.scrollHeight + "px";
    		} 
 		 });
		}
</script>
</body>
</html>
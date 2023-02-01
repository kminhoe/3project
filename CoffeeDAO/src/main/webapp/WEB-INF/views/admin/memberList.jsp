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
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
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
</head>
<body>
<div id="main">
<h1 align="center">COFFEEDAO ADMIN</h1>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 회원 관리</span>
<form id="Search" name="Search" method="post" action="/coffeedao/adminMemberList.da">
	<input type="text" class="mail_text" placeholder="Search" id="keyword" name="keyword">
	<div class="send_bt" onClick="check(this.form)"><a>검색</a></div>
</form>
<c:forEach items="${memberList}" var="member">
	<button class="collapsible_admin">${member.MEM_ID }</button>
		<div class="content_admin">
  			<table id="customers">
  				<thead>
  					<tr>
  						<th>NAME</th>
  						<th>EMAIL</th>
  						<th>RDATE</th>
  						<th>ADDR1</th>
  						<th>ADDR2</th>
  						<th>ZP</th>
  						<th>PHONE</th>
  						<th>DEL</th>
  					</tr>
  				</thead>
  				<tbody>
  					<tr>
  						<td>${member.MEM_NAME}</td>
  						<td>${member.MEM_EMAIL}</td>
  						<td>${member.MEM_RDATE}</td>
  						<td>${member.MEM_ADDR1}</td>
  						<td>${member.MEM_AFFR2}</td>
  						<td>${member.MEM_ZP}</td>
  						<td>${member.MEM_PHONE}</td>
  						<td><a>${member.MEM_DEL}</a></td>
  					</tr>
  				</tbody>
  			</table>
		</div>
</c:forEach>

<!-- 페이징 처리 부분-->
			<div class="pagination">		
				<c:if test="${paging.startPage != 1 }">
					<a href="/coffeedao/fadminMemberList.da?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<a class="active">${p}</a>
						</c:when>
						<c:when test="${p != paging.nowPage}">
							<a href="/coffeedao/adminMemberList.da?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/coffeedao/adminMemberList.da?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
			<!-- 페이징 처리 끝 -->
	</div>
	<script>
			function check() {
				var keyword = document.getElementById("keyword"); // 키워드

				if (keyword.value.trim() == ""){ alert("키워드를 입력해주세여."); keyword.focus(); return false; }

			document.Search.submit();
		}
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
	
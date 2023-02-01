<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/adminHeader.jsp" %>
	<%@ include file="../../include/adminNavbar.jsp" %>
<!DOCTYPE html>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Contact</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- fonts -->
      <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
      <!-- owl stylesheets -->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.css" rel="stylesheet" />
      
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
      <!-- header section start -->

      <!-- header section end -->
 	  <!-- contact section start -->
 	   <div id="main">
 	   <h1 align="center">COFFEEDAO ADMIN</h1>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;고객센터</span>
      <div align="center">
         <div>
         <form id="adminInquiryReply" name="adminInquiryReply" method="POST" action="/coffeedao/adminInquiryReplyPro.da">
            <h1>${map.QA_TITLE}</h1><br/><hr>
            <h3>${map.QA_WRITER}</h3>
            <hr>
            <textarea id="QA_CONT" name="QA_CONT">${map.QA_CONT}&#13;&#10;[reply:] </textarea>
            <img src="resources/img/${map.QA_IMAGE}">
            <input type="hidden" name="QA_STATE" id="QA_STATE" value="${map.QA_STATE}">
            <input type="hidden" name="QA_IDX" id="QA_IDX" value="${map.QA_IDX}">
            <br>
            <input type="submit" value="작성하기">
         </form>
         
         </div>
      </div>
      <!-- contact section end -->
      <!-- footer section start -->
  	  <%@ include file="../../include/footer.jsp" %>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">© 2020 All Rights Reserved.<a href="https://html.design"> Free html Templates</a></p>
         </div>
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
      <script src="resources/js/custom.js"></script>
      <!-- javascript --> 
      <script src="resources/js/owl.carousel.js"></script>
      <!-- owl carousel -->
   </body>
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   
   <script>
		function check() {
/* 			var BO_TITLE = document.getElementById("BO_TITLE"); // 제목
			var BO_CONT = document.getElementById("BO_CONT"); // 내용
			
			if (BO_TITLE.value.trim() == ""){ alert("제목을 작성해주세요."); BO_TITLE.focus(); return false; }
			if (BO_CONT.value.trim() == ""){ alert("내용을 작성해주세요."); BO_CONT.focus(); return false; }
			 */
			document.adminInquiryReply.submit();
		}
   </script>
</html>
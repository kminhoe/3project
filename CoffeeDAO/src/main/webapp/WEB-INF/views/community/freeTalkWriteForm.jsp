<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   </head>
   <body>
      <!-- header section start -->
	<%@ include file="../../include/header.jsp" %>
      <!-- header section end -->
 	  <!-- contact section start -->
      <div id="wrap">
		<%@ include file="../../include/content_left.jsp" %>
         <div class="content">
         <form id="freeTalkWriteForm" name="freeTalkWriteForm" method="POST" enctype="multipart/form-data" action="/coffeedao/freeTalkWrite.da">
            <input type="text" class="mail_text2" placeholder="제목" id="BO_TITLE" name="BO_TITLE">
            <input type="hidden" name="BO_TYPE" value="${type}">
            <textarea class="massage-bt" placeholder="내용" rows="5" id="BO_CONT" name="BO_CONT"></textarea>
            <!-- <input type="hidden" name="BO_TYPE" value="N"> -->
            <br>
			<div class="filebox bs3-primary preview-image">
				<input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
				<label for="input_file">파일 업로드</label> 
				<input type="file" id="input_file" name="BO_IMAGE_FILE" class="upload-hidden"> 
			</div>
            <br>
            <div class="send_bt" onClick="check(this.form)"><a>작성하기</a></div>
            <div class="send_bt"><a href="#">목록보기</a></div>
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
   
   <script>
		function check() {
/* 			var BO_TITLE = document.getElementById("BO_TITLE"); // 제목
			var BO_CONT = document.getElementById("BO_CONT"); // 내용
			
			if (BO_TITLE.value.trim() == ""){ alert("제목을 작성해주세요."); BO_TITLE.focus(); return false; }
			if (BO_CONT.value.trim() == ""){ alert("내용을 작성해주세요."); BO_CONT.focus(); return false; }
			 */
			document.freeTalkWriteForm.submit();
		}
   </script>
</html>
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
            <h1>${map.BO_TITLE}</h1><br/><hr>
            <h3>${map.BO_MEMID}</h3>
            <input type="hidden" name="BO_TYPE" value="${type}">
            <hr>
            <p>${map.BO_CONT}</p>
            <!-- <input type="hidden" name="BO_TYPE" value="N"> -->
            <br>
			<div class="filebox bs3-primary preview-image">
			<c:choose>
				<c:when test="${empty map.BO_IMAGE }"></c:when> 
				<c:otherwise>
					<img src="resources/img/${map.BO_IMAGE}" width=50%>
				</c:otherwise>
			</c:choose>
			</div>
            <br>
            <div class="send_bt"><a href="freeTalkList.da?type=${map.BO_TYPE}">목록보기</a></div>
            <c:choose>
            <c:when test="${MEM_ID != map.BO_MEMID }"></c:when>
            <c:otherwise>
            <div class="send_bt"><a href="freeTalkModify.da?BO_IDX=${map.BO_IDX}">수정하기</a></div>
            <div class="send_bt"><a href="freeTalkDelete.da?BO_IDX=${map.BO_IDX }">삭제하기</a></div>
            </c:otherwise>
            </c:choose>
         </form>
          <br><br><br><br><br><br>
         		<h1>코멘트</h1>
         		<c:if test="${! empty MEM_ID}">
	         		<form id="test" name="test" method="post">
	         			<input type="hidden" id="COM_WRITER" name="COM_WRITER" value="<%= session.getAttribute("MEM_ID") %>">
	         			<input type="hidden" id="COM_ARTNO" name="COM_ARTNO" value="${map.BO_IDX}">
	         			<input type="hidden" id="COM_REF" name="COM_REF" value="0">
	         			<input type="hidden" id="COM_STEP" name="COM_STEP" value="0">
	         			<input type="hidden" id="COM_LEVEL" name="COM_LEVEL" value="0">
	         			<input type="hidden" id="COM_IDX" name="COM_IDX" value="0">
		               	<textarea class="massage-bt" placeholder="내용" rows="5" id="COM_CONT" name="COM_CONT"></textarea><br>
		               	<button type="button" class="send_bt" id="btnReplySave"><a>작성하기</a></button><br><br><br><br><hr>
	         		</form>
	         	</c:if>
         		
				<div id="replyList"></div>
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
   <script>
	// 댓글 리스트
	function showReplyList(){

		var url = "${pageContext.request.contextPath}/selectComment.da?idx=" + ${map.BO_IDX};

		var paramData = {"CommentMap" : "${CommentMap.BO_IDX}"};

		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',

            success: function(result) {
               	var htmls = "";
               	var nbsp = "";
               	var MEM_ID = "<%=(String)session.getAttribute("MEM_ID")%>"
               	
				if(result.length < 1){
					/* 등록된 댓글이 없을 경우 출력 */
					htmls.push("등록된 댓글이 없습니다.");
				} else {
					$(result).each(function(){
						
						var day = new Date(this.COM_DATE);
						nbsp = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
						
						if (this.COM_LEVEL != '0') {
							for (i=1; i < this.COM_LEVEL; i++) {nbsp += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';}} else {nbsp = "";}
							htmls += '<div id="COM_IDX' + this.COM_IDX +'">';
		                 	htmls += nbsp + this.COM_WRITER + ' <a style="font-size: 10px;">(' + day.getFullYear() + '.' + (day.getMonth() + 1) + '.' + day.getDate() + ')</a>&nbsp;&nbsp;';
		                 	/* 댓글 수정 삭제 시작 */
		                 	if (this.COM_WRITER == MEM_ID) {
		                 		htmls += '<a style="font-size: 10px; color: #6c757d;" href="javascript:void(0)" onclick="fn_updateComment(' + this.COM_IDX + ', \'' + this.COM_WRITER + '\', \'' + this.COM_CONT + '\',' + this.COM_DATE + ' )" >수정</a>&nbsp;';
		                 		htmls += '<a style="font-size: 10px; color: #6c757d;" href="javascript:void(0)" onclick="fn_deleteComment(' + this.COM_IDX + ')" >삭제</a>';
		                 	}

		                 	htmls += '<br>';
		                 	/* 댓글 수정 삭제 종료 */
		                 	htmls += nbsp + this.COM_CONT;
		                 	/* 대댓글 접기 펼치기 시작 */
		                 	if (MEM_ID != "null") {
			                 	htmls += '<div>';
			                 	htmls += '<a href=#none id="show" onclick="';
			                 	htmls += "if (COM_IDX_" + this.COM_IDX + ".style.display=='none') {COM_IDX_" + this.COM_IDX + ".style.display='';show.innerText='댓글 작성'} else {COM_IDX_" + this.COM_IDX + ".style.display='none';show.innerText='댓글 작성'}";
			                 	htmls += '">' + nbsp + '> 댓글 작성</a>';
			                 	htmls += '<div id="COM_IDX_' + this.COM_IDX + '" style="display: none">';
			             		/* 대댓글 입력 폼 start */
			                 	htmls += '<form id="test" name="test" method="POST">';
			                 	htmls += '<input type="hidden" id="COM_WRITER' + this.COM_IDX + '" name="COM_WRITER" value="' + MEM_ID + '">';
			                 	htmls += '<input type="hidden" id="COM_ARTNO' + this.COM_IDX + '" name="COM_ARTNO" value="' + this.COM_ARTNO + '">';
			                 	htmls += '<input type="hidden" id="COM_IDX' + this.COM_IDX + '" name="COM_IDX" value="' + this.COM_IDX + '">';
			                 	htmls += '<input type="hidden" id="COM_REF' + this.COM_IDX + '" name="COM_REF" value="' + this.COM_REF + '">';
			                 	htmls += '<input type="hidden" id="COM_STEP' + this.COM_IDX + '" name="COM_STEP" value="' + this.COM_STEP + '">';
			                 	htmls += '<input type="hidden" id="COM_LEVEL' + this.COM_IDX + '" name="COM_LEVEL" value="' + parseInt(this.COM_LEVEL + 1) + '">';
								/* IDX, WRITER, ARTNO, REF, STEP, LEVEL */
			                 	htmls += '<textarea class="massage-bt" placeholder="내용" rows="5" id="COM_CONT' + this.COM_IDX + '" name="COM_CONT"></textarea><br>';
			                 	htmls += '<button type="button" class="send_bt" onclick="btnReplySave2(' + this.COM_IDX + ');"><a>작성하기</a></button><br><br><br>';
			                 	htmls += '</form>';
		                 	}
		                 	
		                 	/* 대댓글 입력 폼 end */
		         			htmls += '</div>';
		                 	htmls += '</div>';
		                 	/* 대댓글 접기 종료 */
		                 	htmls += '<hr>';
		                 	/* alert(htmls); */
	 				});	//each end
				}
				$("#replyList").html(htmls);
            }	   // Ajax success end
		});	// Ajax end
	}
</script>

<script>
//댓글 저장 버튼 클릭 이벤트
$(test).on('click', '#btnReplySave', function(){
	var COM_WRITER = $('#COM_WRITER').val();
	var COM_ARTNO = $('#COM_ARTNO').val();
	var COM_IDX = $('#COM_IDX').val();
	var COM_REF = $('#COM_REF').val();
	var COM_STEP = $('#COM_STEP').val();
	var COM_LEVEL = $('#COM_LEVEL').val();
	var COM_CONT = $('#COM_CONT').val();

	var paramData = JSON.stringify ({
			  "COM_WRITER" : COM_WRITER
			, "COM_ARTNO" : COM_ARTNO
			, "COM_IDX": COM_IDX
			, "COM_REF": COM_REF
			, "COM_STEP": COM_STEP
			, "COM_LEVEL": COM_LEVEL
			, "COM_CONT" : COM_CONT
	});

	console.log("COM_CONT : " + COM_CONT);

	$.ajax({
		  url : "${pageContext.request.contextPath}/insertComment.da"
		, type : 'POST'
		, contentType : 'application/json; charset=utf-8'
		, data : paramData
		, dataType : 'text'
		, success: function(result){
			
			showReplyList();
			
			COM_CONT = $('#COM_CONT').val('');

		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
});
</script>

<script>
//대댓글 저장 버튼 클릭 이벤트
function btnReplySave2(idx) {
 	var COM_WRITER = $('#COM_WRITER' + idx).val();
 	var COM_ARTNO = $('#COM_ARTNO' + idx).val();
 	var COM_IDX = idx;
	var COM_REF = $('#COM_REF' + idx).val();
	var COM_STEP = $('#COM_STEP' + idx).val();
	var COM_LEVEL = $('#COM_LEVEL' + idx).val();
	var COM_CONT = $('#COM_CONT' + idx).val();

	var paramData = JSON.stringify ({
		  "COM_WRITER" : COM_WRITER
		, "COM_ARTNO" : COM_ARTNO
		, "COM_IDX" : COM_IDX
		, "COM_REF" : COM_REF
		, "COM_STEP" : COM_STEP
		, "COM_LEVEL" : COM_LEVEL
		, "COM_CONT" : COM_CONT
	});
	
	console.log("COM_CONT : " + COM_CONT);
	
	$.ajax({
		  url : "${pageContext.request.contextPath}/insertComment.da"
		, type : 'POST'
		, contentType : 'application/json; charset=utf-8'
		, data : paramData
		, dataType : 'text'
		, success: function(result){
			showReplyList();
	
		}
		, error: function(error){
			console.log("에러 : " + error);
		}
	});
}
</script>

<script>
	//댓글 삭제
	function fn_deleteComment(COM_IDX){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/deletecomment.da"
			,data : {"COM_IDX" : COM_IDX} 
			,type : 'POST'
			,dataType : "json"
			,success : function(result){
				alert("삭제되었습니다.");
				showReplyList();
			}
			,error : function(result){
				console.log("에러 : " + error);
			}
		});
	}
	
	//댓글 수정
	function fn_updateComment(COM_IDX, COM_WRITER, COM_CONT, COM_DATE) {		
		
		var htmls = "";
		var day = new Date(COM_DATE);
		
		/* htmls += '<form id="test" name="test" action="updatecomment.da?CON_IDX='+${COM_IDX}'" method="POST">'; */
		htmls += '<div id="COM_IDX' + this.COM_IDX +'">';
     	htmls += COM_WRITER + ' <a style="font-size: 10px;">(' + day.getFullYear() + '.' + (day.getMonth() + 1) + '.' + day.getDate() + ')</a>&nbsp;&nbsp;</br>';
     	htmls += '<textarea class="massage-bt" placeholder="내용" rows="3" id="editContent" name="editContent" >';
     	htmls += COM_CONT;
     	htmls += '</textarea>'
     	htmls += '<div>';
     	htmls += '<div id="COM_IDX_' + this.COM_IDX + '" style="display: none">';
     	htmls += '</div>';
     	/* htmls += '<input type="hidden" name="COM_WRITER" value="${map.WRITER}">'; */
     	htmls += '<input type="hidden" name="COM_IDX" value="${map.COM_IDX}">'; 
     	/* htmls += '<button type="submit" class="send_bt"><a>수정하기</a></button>'+ '&nbsp;'; */
     	htmls += '<button type="button" onclick="fn_editComment(' + COM_IDX + ', \'' + COM_WRITER + '\')" class="send_bt"><a>수정하기</a></button>'+ '&nbsp;';
     	htmls += '<button type="button" onclick="history.go(0)" class="send_bt"><a>취소</a></button></br></br>';
     	/* htmls += '</form>' */
     	
     	htmls += '<br><hr>'
     	
     	$('#COM_IDX' + COM_IDX).replaceWith(htmls);
     	
	}
	
	 function fn_editComment(COM_IDX, COM_WRITER){

		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"COM_CONT": replyEditContent

				, "COM_IDX": COM_IDX });
		/* var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"}; */
		

		$.ajax({

			url: "${pageContext.request.contextPath}/updatecomment.da"
			, contentType : "application/json; charset=UTF-8" 
			, data : paramData 
			, type : 'POST'
			, dataType : 'json'
			, success: function(status){
                console.log(status);
                alert("수정되었습니다.");
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}

		});

	} 
</script>

<script>
	$(document).ready(function(){
		showReplyList();
	});
// 이하 코드 생략
</script>
</html>
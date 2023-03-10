<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!DOCTYPE html>
<html lang="en">
   <head>
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
   	  <!-- include ?????? -->
	  <%@include file="/WEB-INF/include/header.jsp" %>
<!-- ??????API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var addr = ''; // ?????? ??????
                var extraAddr = ''; // ???????????? ??????

                //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
                if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                    addr = data.roadAddress;
                } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                    addr = data.jibunAddress;
                }

                // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
                if(data.userSelectedType === 'R'){
                    // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                    // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                    if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // ???????????? ??????, ??????????????? ?????? ????????????.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ????????? ??????????????? ?????? ????????? ?????????.
                    document.getElementById("SELL_ADDR2").value = extraAddr;
                
                } else {
                    document.getElementById("SELL_ADDR2").value = '';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('SELL_ZP').value = data.zonecode;
                document.getElementById("SELL_ADDR1").value = addr;
                // ????????? ???????????? ????????? ????????????.
                document.getElementById("SELL_ADDR2").focus();
            }
        }).open();
    }
</script>
   </head>
   
   <% 
   String id = (String)session.getAttribute("SELL_ID");
   System.out.println("????????? ?????? : "+id);
   %>
   
   
   
   
   <body>
 <!-- product section start -->
      <div id="wrap">
      <%@ include file="../../include/sellerMypage_left.jsp" %>
         <div class="content">
            <div align="center">
               <h1 class="login_taital">????????? ??????</h1>
            </div>
            <div>
                <div align="center">
               
                    	<!-- form id?????? common.js	 ?????? -->
                        <form id="sellerMyPage" action="/coffeedao/sellerModifyForm.da" enctype="multipart/form-data">
                            <br>
                            
                            
                           	
                            <input class="login_taital" id="SELL_ID" name="SELL_ID" type="hidden" value="${map.SELL_ID}" >
                            
                            <!--  ????????????????????? ????????? ????????? ?????? ??? ???????????? ???
                            ????????????    
                            <input class="detail_text" id="MEM_PWD" name="MEM_PWD" type="password"> 
                            ???????????? ??????
                            <input class="detail_text" id="MEM_PWD2" name="MEM_PWD2" type="password">  
                            -->
                            
                            <br><br>
                            ??????
                            <input class="" id="SELL_NAME" name="SELL_NAME" value="${map.SELL_NAME}" type="hidden" disabled>
                            <h1>${map.SELL_NAME}</h1><br><br>
                            ???????????????
                            <input class="" id="SELL_NUM" name="SELL_NUM" value="${map.SELL_NUM}" type="hidden" disabled>
                            <h1>${map.SELL_NUM}</h1><br><br>                         
                            
                            ?????????
                            <input class="" id="SELL_EMAIL" name="SELL_EMAIL" value="${map.SELL_EMAIL}" type="hidden" disabled>
                            <h1>${map.SELL_EMAIL}</h1><br><br>
                            ????????????
                            <input class="" id="SELL_PHONE" name="SELL_PHONE" value="${map.SELL_PHONE}" type="hidden" disabled>
                            <h1>${map.SELL_PHONE}</h1><br><br>
                            ??????
                            <input class="" id="SELL_BANK" name="SELL_BANK" value="${map.SELL_BANK}" type="hidden" disabled>
                            <h1>${map.SELL_BANK}</h1><br><br>
                
                <input class="" id="SELL_BNUM" name="SELL_BNUM" value="${map.SELL_BNUM}" type="hidden" disabled>
                            <h1>${map.SELL_BNUM}</h1><br><br>
                            
                            
                            ??????<br>
                            <input class="" id="SELL_ZP" name="SELL_ZP" value="${map.SELL_ZP}" type="hidden" disabled>
                            <h1>${map.SELL_ZP}</h1>&nbsp;&nbsp;<br><br>
                            <input class="" id="SELL_ADDR1" name="SELL_ADDR1" value="${map.SELL_ADDR1}" type="hidden" disabled>
                            <h1>${map.SELL_ADDR1}</h1><br><br>
                            ????????????
                            <input class="" id="MEM_ADDR2" name="MEM_ADDR2" value="${map.SELL_ADDR2}" type="hidden" disabled>
                            <h1>${map.SELL_ADDR2}</h1><br><br>
                            
                                                        <BR><BR><BR><BR>
                            <hr />
                            <BR>
                            <h1 class="login_taital2" align="center">?????? ??????</h1>
                            <BR><BR>
                            ????????? ?????????<BR>
                             <div class="filebox" style="position:relative;height:140px;">
                           <!-- ?????? ????????? ????????? ???????????? ???????????? ????????? ??????????????? -->
                             <c:choose>
                             <c:when test="${map.SELL_PROF == null}">
                            
                             <img src="resources/images/camera.png" width=120px, height=120px style= "margin : 20px; border: 1px solid;">
                             </c:when>
                             
                             <c:otherwise>
                            <img src="resources/img/${map.SELL_PROF}" width=120px, height=120px style= "margin : 20px; border: 1px solid;">
                            </c:otherwise>
                            </c:choose>
                            
             <div class="filebox"
								style="position: relative; height: 0px; ">
								<div style="position: absolute; right: 43%; bottom: 0px;">
									<input class="upload-name" type="hidden" value="${map.SELL_PROF }" disabled>
									

								</div>
							</div>
        </div>    
        <BR>
        <p>${map.SELL_CONT}</p><BR>
            <BR>   
            ?????? ?????? ????????? <BR> 

            <div align="center">
				<c:choose>
					<c:when test="${map.SELL_PROF == null}">

						<img src="resources/images/seller.PNG" width=120px,
							height=120px style="margin: 20px; border: 1px solid;">
						<img src="resources/images/seller.PNG" width=120px,
							height=120px style="margin: 20px; border: 1px solid;">
					</c:when>
					<c:otherwise>
					<!-- ????????? ????????? ?????? -->
					<c:set var="items" value="${fn:split(map.SELL_IMAGE, ',')}"/>
						<c:forEach var="i" begin="1" end="${fn:length(items)}">
							<img src="resources/img/${fn:split(map.SELL_IMAGE,',')[i-1]}"
								width=170px, height=170px
								style="margin: 20px; border: 1px solid; align: center;">
								
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div><br>

							<div class="filebox" style="position: relative; height: 0px;">
								<div
									style="position: absolute; absolute; right: 30%; bottom: 0px;">
									<input class="upload-name" type="hidden" value="${map.SELL_IMAGE }" disabled>


								</div>
							</div>
							<BR>
            <BR>
            <BR>
            <img style=" border: 1px ; border-radius: 70%; " src="resources/images/insta1.png" width=40px, height=40px style= "margin : 20px; ">
&nbsp;&nbsp;&nbsp;&nbsp;@${map.SELL_SNS}
<BR><BR><BR>
            
                        
                            <div class="detail_subcenter"></div>
                                <button id ="update" onclick="check(this.form)">??????</button><br><br> </form>
                                <form id="delete" action="/coffeedao/sellerDelete.da" >
                                <input class="login_taital" id="SELL_ID" name="SELL_ID" type="hidden" value="${map.SELL_ID}" >
                                <button id ="delete" onclick="return result">????????????</button></form>
                                <br>
                            </div>
                       
                    </div>
                </div>
      </div>

      <!-- product section start -->
   
 
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">?? 2020 All Rights Reserved.<a href="https://html.design"> Free html Templates</a></p>
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

$(document).ready(function(){
$("#modify").on("click", function(e){ //???????????? ??????
	e.preventDefault();
	fn_updateMember();
});
});

function fn_updateMember(){
	location.href='/coffeedao/sellerModifyForm.da'
}


</script>

<script>

$(document).ready(function(){
	$("#delete").on("click", function(e){ //???????????? ??????

var result = confirm("?????? ????????? ???????????????????");
if(result) {
    alert("?????? ?????????????????????.");
    location.href='/coffeedao/sellerDelete.da'

} else {
    alert("?????? ?????????????????????.");
    return false;
}

});
});

</script>


      <script src="../resources/js/owl.carousel.js"></script>
      <!-- owl carousel -->
      <script>
         $('.owl-carousel').owlCarousel({
         loop:true,
         margin:30,
         nav:true,
         responsive:{
          0:{
              items:1
          },
          600:{
              items:3
          },
          1000:{
              items:4
          }
         }
         })
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
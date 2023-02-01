<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<style>
/* select box style */
select {
  width: 180px; /* 원하는 너비설정 */
  padding: 10px; /* 여백으로 높이 설정 */
  border: 2px solid #daa; 
  border-radius: 10px; /* iOS 둥근모서리 제거 */
}

/* on/off switch */
.wrapper {
  width: 50px;
  height: 50px;
  text-align: center;
  margin-left: 100px;
}

body {
  margin: 0;
}

#over img {
  margin-left: auto;
  margin-right: auto;
  display: block;
  width: 50%;
    width:  500px;
    height: 500px;
    object-fit: cover;
}

input[type=text], select {
  width: 70%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 70%;
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

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

</style>

<title>CoffeeDao</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
	<div id="product-container" style="display: flex; flex-direction: column;">
		<!-- product detail start -->
		<form style="display:flex; flex-direction:row; padding-top: 50px;" id="itemForm" name="itemForm" method="POST" action="putCart.da">
		<input type="hidden" name="ITEM_IMAGE" id="ITEM_IMAGE"  value="${product[0].FILE_STD}" />
			<!-- product info start -->
			<div style="height: auto; width: auto; min-width: 900px; min-height: 1200px;">
				<div id="over">
                
			
					<!-- product image -->
					<img class="detail_img" src="resources/img/${product[0].FILE_STD}" alt="image" /><br/><br/>
					<!-- product content -->
					<div style="text-align: center;">
						<h1>${product[0].ITEM_CONT}</h1><br/>
						<!-- ITEM_ID를 CART_ID로 입력 -->
						<input type="hidden" id="CART_ID" name="CART_ID" value="${product[0].ITEM_ID}">
						<!-- 세션으로부터 MEM_ID를 받아 CART_MEM으로 입력 -->
						<input type="hidden" id="CART_MEM" name="CART_MEM" value='<%=session.getAttribute("MEM_ID") %>'>
					</div>
					<!-- product seller -->
					
					<h1><a href="sellerDetail.da?SELL_ID=${product[0].ITEM_SELLER}" style="display: flex; justify-content: center; align-items: center;">
						<img style="width: 50px; height: 50px; border-radius: 50%;" src="resources/img/${product[0].SELL_PROF}" alt="image" />
						&nbsp;&nbsp;<span>${product[0].ITEM_SELLER }</span></a></h1>
				</div>
				<div>
				<ul style="padding: 50px 150px 0 100px; ">
					<li style="border-bottom: solid 1px #ded3c3;">
						<span style="display: flex; align-items: center;">
							<img style="width: 80px; height: 80px; margin-right: 20px;" src="resources/images/earth.png" alt="image" />
							<h2>원산지: ${product[0].ITEM_LOC }</h2>
						</span>
					</li>
					<li style="border-bottom: solid 1px #ded3c3;">
						<span style="display: flex; align-items: center;">
							<img style="width: 80px; height: 80px; margin-right: 20px;" src="resources/images/aroma.png" alt="image" />
							<h2>맛과향: ${product[0].ITEM_TASTE }</h2>
						</span>
					</li>
					<li style="border-bottom: solid 1px #ded3c3;">
						<span style="display: flex; align-items: center;">
							<img style="width: 80px; height: 80px; margin-right: 20px;" src="resources/images/blend.png" alt="image" />
							<h2>상품타입: ${product[0].ITEM_TYPE }</h2>
						</span>	
					</li>
				</ul>
				<br><br>
				
				
				</div>
			</div>
			<!-- product info end -->
			
			<!-- purchase insert info start -->
			<div style="width:1500px;">
				<!-- 상품 이름 & 맛과향 -->
				<div>
					<div style="font-size: 40px; font-weight: 400; line-height: 35px;">
						<input type="hidden" id="CART_NAME" name="CART_NAME" value="${product[0].ITEM_NAME}">
						${product[0].ITEM_NAME}
					</div>
					<div style="font-size: 20px; font-weight: 200; color: gray;">
						${product[0].ITEM_TASTE }
					</div>
					<!-- 찜하기 -->
				<br>
				
				<c:choose>
				<c:when test="${productBean.like == '1'}">
				<div >
				<div style="height: 70px; padding: 16px 0px; display: inline-block; float:left; vertical-align: middle;">
				<img style="weight: 40px; height: 40px;"src="resources/images/like_yes.png" onclick="deleteLike()"/></div>
				 <c:if test="${product[0].count != 0}">
				 <div style=" margin: 0px; padding: 0px; display: inline-block; 
				 font-size: 40px; text-align: top;">&nbsp;&nbsp;${productBean.count}</div>
				 </c:if>
				 <c:if test="${productBean.count == 0}">
				 <br>
				 </c:if>
				</div>
				</c:when>
				<c:when test="${productBean.like == '2'}">
				<div >
				<div style="height: 70px; padding: 16px 0px; display: inline-block; float:left; vertical-align: middle;">
				<img style="weight: 40px; height: 40px;"src="resources/images/heart2.png" onclick="putLike()"/></div>
				 <c:if test="${productBean.count != 0}">
				 <div style=" margin: 0px; padding: 0px; display: inline-block; 
				 font-size: 40px; text-align: top;">&nbsp;&nbsp;${productBean.count}</div>
				 </c:if>
				 <c:if test="${productBean.count == 0}">
				 <br>
				 </c:if>
				</div>
				</c:when>
				<c:otherwise>
				<div >
				<div style="height: 70px; padding: 16px 0px; display: inline-block; float:left; vertical-align: middle;">
				<img style="weight: 40px; height: 40px;"src="resources/images/heart2.png" onclick="loginLike()"/></div>
				 <c:if test="${productBean.count != 0}">
				 <div style=" margin: 0px; padding: 0px; display: inline-block; 
				 font-size: 40px; text-align: top;">&nbsp;&nbsp;${productBean.count}</div>
				 </c:if>
				 <c:if test="${productBean.count == 0}">
				 <br>
				 </c:if>
				</div>
				</c:otherwise>
				</c:choose>
				</div>
				<!-- 가격, 분쇄도, 수량 선택 -->
				<div style="margin-top: 50px;">
					<div>
						<h3>용량 & 가격</h3>
						<div style="margin-left: 50px;">
							<select id="CART_PRICE" name="CART_PRICE">
								<option value="1" selected="selected">200g - ${product[0].ITEM_200 }원</option>
								<option value="2">500g - ${product[0].ITEM_500 }원</option>
							</select>
						</div>
						<br/>
					</div>
		
					<div>
						<h3>분쇄도</h3>
						<div style="margin-left: 50px;">
						
							<select id="CART_GRIND" name="CART_GRIND">
								<option value="분쇄하지 않음" selected>분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립">핸드 드립</option>
                                <option value="모카포트">모카포트</option>
							</select>
						</div>
						<br/>
					</div>
					<div style="display: flex; flex-direction: row; align-items: center;">
						<h3 style="padding: 0px;">구매 수량</h3>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<div style="margin-left: 50px;">
							<select style="width: 90px;" name="CART_COUNT" id="CART_COUNT">
								<option value="1" selected="selected">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
					</div>
					<br/>
					<div>
						<!-- 배송비는 고정값 -->
						<h3>배송비        2500원</h3>
					</div>
					<div style="font-size: 15px; font-weight: 200; color: gray;">
						배송비는 상품의 종류, 개수에 상관없이<br/>
						결제 시 2500원으로 계산됩니다.
					</div>
					<br/>
					<!-- 구독 스위치 -->
					<!-- <div style="display: flex; flex-direction: row; align-items: center;">
						<div>
							<h3>정기구독</h3>
						</div>
						<div class="wrapper">
							
							<label for="switch" class="switch">
							<input type="checkbox" id="switch">
								<span class="slider round"></span>
							</label>
						</div>
					</div> -->
					<!-- <div style="font-size: 15px; font-weight: 200; color: gray;">
						구독한 요일을 기준으로<br/>
						매 주 같은 요일에 배송됩니다.
					</div> -->
					<br/>
					<!-- 관리자,판매자로 접속 시 '구매하기','장바구니'버튼 안보임 -->
					<c:if test="${(MEM_ID == 'admin') || (!empty SELL_ID)}">
						<div style="display: flex; flex-direction: row; align-items: center;">
						</div>
					</c:if>
					<!-- 비회원,일반회원으로 접속 시 -->
					<c:if test="${MEM_ID != 'admin' && empty SELL_ID }">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<!-- 장바구니 담기 -->
							<input type="button" onClick="putCart()" value="장바구니">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<!-- 구매하기 -->
							<input type="button" onClick="Order()" value="구매하기">
							
						</div>
					</c:if>	
				</div>
			</div>
			<!-- purchase insert info end -->
		</form>
		<!-- product detail end -->	
			
		<!-- review start -->
		<!-- review list start-->
		<div style="margin-left: 100px;">	
			<c:if test="${fn:length(review) != 0}">
			            
				<div style="height: auto; width: 650px;">
					<h3>구매후기</h3>
					<c:forEach var="re" items="${review}">
						<table style="width: 650px; display: inline-block; ">
							<c:choose>
								<c:when test="${re.RE_STEP == '1'}">
									<tr>
										<td style="width:300px;">
											<img style="width: 20px; height: 20px; margin-right: 20px;" src="resources/images/reply.png"/>
											${re.RE_SELLER}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td style="text-align:right; width:350px;">
											리뷰 답변일| ${re.RE_DATE}
										</td>
									</tr>
									<tr>
										<td>
											<br>
											${re.RE_CONTENT}
										</td>
									</tr>
								<hr/>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="width:300px;">
											작성자| ${re.RE_MEM}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</td>
										<td style="text-align:right; width:350px;">
											리뷰 작성일| <fmt:formatDate value="${re.RE_DATE}" pattern="yyyy.MM.dd"/>
										</td>
									</tr>
									<tr>
										<td>
										<br>
											${re.RE_CONTENT}
										</td>
									</tr>
									<hr/>
								</c:otherwise>
							</c:choose>
						</table>
					</c:forEach>
				</div>
			</c:if>
			<!-- review list end-->
			<!-- review write start -->
			<!-- 로그인한 회원의 상품 구매 상태가 '구매확정'이면 댓글작성 가능 -->
			<c:if test='${stateNum >= 1}'>
				<div>
					<form id="reviewWrite" name="reviewWrite" method="post" action="reviewWrite.da">
						<input style="width: 650px; height: 70px;" type="text" id="RE_CONTENT" name="RE_CONTENT"/>
						&nbsp;&nbsp;
						<input type="button" onClick="insertReview()" value="등록">
						<input type="hidden" id="RE_ITEM" name="RE_ITEM" value="${productBean.ITEM_ID}"/>
						<input type="hidden" id="RE_MEM" name="RE_MEM" value='<%=session.getAttribute("MEM_ID") %>'/>
						<input type="hidden" id="RE_SELLER" name="RE_SELLER" value="${productBean.ITEM_SELLER}"/>
						<!-- RE_REF,RE_STEP은 DEFAULT으로 0이 들어가므로, NULL 허용으로 바꾸는게 낫지않은지? -->
						<input type="hidden" id="RE_REF" name="RE_REF" value="0"/>
						<input type="hidden" id="RE_STEP" name="RE_STEP" value="0"/>
					</form>
				</div>
			</c:if>
		</div>	
		<!-- review write end -->
		<br><br><br><br><br>
	</div>
		<!-- review end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <!-- javascript --> 
      <script src="js/owl.carousel.js"></script>
      <!-- owl carousel -->
      
      <script>
	/* 리뷰 작성하기 */
	function insertReview() {
		if(confirm("리뷰를 등록하시겠습니까?") == true){
			document.reviewWrite.submit();
		}else {
			return;
		}
	}
</script>	

<script>
/* 장바구니 담기 */
function putCart() {
	/* session으로부터 로그인여부 확인 */
	if(<%=session.getAttribute("MEM_ID")%> != null) {
		
		/* 로그인상태일 경우 */
		if(confirm("장바구니에 넣으시겠습니까?") == true) {
			
			document.itemForm.submit();
		} else {
			return;
		}
		/* 비회원일 때 */
	}else {
			alert("상품을 구매하시려면 로그인을 해주세요.");
			location.href="loginForm.da";
			}
}

</script>

<script type="text/javascript">

//바로주문

function Order() {
	/* session으로부터 로그인여부 확인 */
	if(<%=session.getAttribute("MEM_ID")%> != null) {
		
		/* 로그인상태일 경우 */
		if(confirm("구매하시겠습니까?") == true) {
			
			let name = document.getElementById('CART_NAME').value;
			let id = document.getElementById('CART_ID').value; 
			let price = document.getElementById('CART_PRICE').value; 
			let mem = document.getElementById('CART_MEM').value; 
			let count = document.getElementById('CART_COUNT').value; 
			let grind = document.getElementById('CART_GRIND').value; 
			
			
			
			   var comSubmit = new ComSubmit();
			   comSubmit.setUrl("<c:url value='/putOrder.da' />");
			   comSubmit.addParam("CART_NAME", name);
			   comSubmit.addParam("CART_ID", id);
			   comSubmit.addParam("CART_PRICE", price);
			   comSubmit.addParam("CART_MEM", mem);
			   comSubmit.addParam("CART_COUNT", count);
			   comSubmit.addParam("CART_GRIND", grind);
			   comSubmit.submit();
			   
		} else {
			return;
		}
		/* 비회원일 때 */
	}else {
			alert("상품을 구매하시려면 로그인을 해주세요.");
			location.href="loginForm.da";
			}
}

function putLike(){
	
	var UP_ID = document.getElementById("CART_ID").value;

	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/putLike.da' />");
	   comSubmit.addParam("UP_ID", UP_ID);
	   comSubmit.addParam("UP_COUNT", 1);
	   comSubmit.addParam("ITEM_ID", UP_ID);
	   

	   comSubmit.submit();
	   
}

function deleteLike(){
	
	var UP_ID = document.getElementById("CART_ID").value;
	

	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/deleteLike.da' />");
	   comSubmit.addParam("UP_ID", UP_ID);
	   comSubmit.addParam("ITEM_ID", UP_ID);
	   
	   comSubmit.submit();
	   
}

function loginLike(){
	confirm("로그인 후 이용하실 수 있습니다");
	
	var UP_ID = document.getElementById("CART_ID").value;
	

	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/productDetail.da' />");
	   comSubmit.addParam("UP_ID", UP_ID);
	   
	   comSubmit.submit();
	
	
}
</script>

</body>
<footer>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</footer>
</html>
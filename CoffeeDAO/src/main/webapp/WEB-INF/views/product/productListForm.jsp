<%@page import="org.springframework.ui.Model"%>
<%@page import="coffeeDao.model.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/include/header.jsp" %>
<html>
<head>

<style>

.product-collapsible {
	background-color: transparent;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
}

.img_item {
  border: 1px solid #CC9977;
}

.collapsible_item {
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

.active, .collapsible_item:hover {
  background-color: #555;
}

.content_item {
  padding: 0 18px;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
  max-height: 0;
}

/* 태영 추가 */

.product-container{
	display:flex;
	width:100%;
	height: auto; 
	min-width:1300px;
	max-width:1140px;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	
	overflow: auto;
}

.nav-background {
   display:flex;
   width:300px;
   height: auto;
}

.nav4 {
    float: left;
    width: 90%;
    height: calc(100% - 512px);
    position: sticky;
    top: 30px;
}

.product-content {
	display:flex;
	width: calc(100% - 300px);
	min-width: 1000px;	
	height: 100%;
	overflow: hidden;
}

.product-sidemenu {
    padding: 0 18px;
    overflow: hidden;
    color: black;
    background-color: transparent;
    transition: max-height 0.2s ease-out;
    max-height: 0;
}

.item_area{
	padding-top: 15px;
	padding-left: 15px;
	list-style-type: none;
	float: left;
}

.item_wrapper{
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 308px;
	border-radius: 4px;
	background-color: #fffdf9;
	border: 1px solid rgba(0,0,0,.05);
	box-sizing: border-box;
}

.item_img{
	width: 100%;
	aspect-ratio: 1;
}

.price_text {
    width: 150%;
    text-align: center;
    font-size: 20px;
    color: #363636;
    font-weight: bold;
    padding-top: 20px;
}

.menu_btn1{
cursor: pointer;
background-color: none;
}

</style>

<title>CoffeeDao</title>
</head>
<body>
	<!-- content section start -->
	<div class="product-container">
		<!-- side menu background start -->		
		<div class="nav-background" style="min-height: 100vh;">
			<!-- side menu body start -->       
			<div class="nav4">
				<ul>
					<li><h1>상품</h1></li>
					<li><hr width="100%;" ></li>
					<li><button type="button" class="collapsible_item">카페인</button>
							<div class="content_item">
								<c:forEach items="${hsCaf}" var="item" varStatus="i">
									<p><a class="menu_btn1" data-id="${item}" data-name="caf">${item}</a></p>
								</c:forEach>
							</div> 
					</li>
					<li><button type="button" class="collapsible_item">원두종류</button>
							<div class="content_item">
								<c:forEach items="${hsType}" var="item" varStatus="status">
									<p><a class="menu_btn1" data-id="${item}" data-name="type">${item}</a><p>
								</c:forEach>
							</div> 
				      </li>
				      <li>
				         <button type="button" class="collapsible_item">맛과 향</button>
				         <div class="content_item">
				           <c:forEach items="${hsTaste}" var="item" varStatus="status">
									<p><a class="menu_btn1" data-id="${item}" data-name="taste">${item}</a><p>
				           </c:forEach>
				         </div> 
				      </li>
				      <li><button type="button" class="collapsible_item">원산지</button>
						<div class="content_item">
				           <c:forEach items="${hsLoc}" var="item">
									<p><a class="menu_btn1" data-id="${item}" data-name="loc">${item}</a><p>
				           </c:forEach>
						</div> 
					</li>
				</ul>
			</div>
		</div>
		<!-- side menu background ebd -->
	
		<!-- product area start -->
		<div class="product-content">
			<div>
			
				<c:forEach var="product" items="${productBeanList}" varStatus="i">
				<li class="item_area">
					
						<div class="item_wrapper">
							<a href="productDetail.da?ITEM_ID=${product.ITEM_ID}"><img class="item_img" src="resources/img/${product.FILE_STD}" alt="image" /></a>
						<input type="hidden" id="ITEM_ID" name="ITEM_ID" value="${product.ITEM_ID}"/>
                        <input type="hidden" id="LIKE" name="LIKE" value="${product.like}"/>
                        <div>                 
                        <c:choose>
                        <c:when test="${product.like == '1'}">
                         <!-- 로그인 찜 -->
                         
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart3.png" /></div>
                        </c:when>
                        <c:when test="${product.like == '2'}"> <!-- 로그인 -->
                       
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart1.png" /></div>
                        </c:when>
                        <c:otherwise> <!-- -->
                       
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart1.png" /></div>
                        </c:otherwise>
                        </c:choose>
							<h6 class="price_text"><a href="productDetail.da?ITEM_ID=${product.ITEM_ID}">${product.ITEM_NAME} <br><span style="color: #f75261;">${product.ITEM_200}원</span></a></h6>
							<input type="hidden" id="itemName${i.count}" value="${product.ITEM_NAME}"/>
							<input type="hidden" id="itemCaf${i.count}" value="${product.ITEM_CAF}"/>
							<input type="hidden" id="itemType${i.count}" value="${product.ITEM_TYPE}"/>
							<input type="hidden" id="itemTaste${i.count}" value="${product.ITEM_TASTE}"/>
							<input type="hidden" id="itemLoc${i.count}" value="${product.ITEM_LOC}"/>
						</div>
						
					
				</li>
					
				</c:forEach>
				
			
			</div>
			
		</div>
		
		<!-- product area end -->
	
	<!-- content section end -->	
	</div>
	
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

<script>


	$(function() {

		let like = document.querySelectorAll('#ITEM_ID');
		let image = document.querySelectorAll('#IMAGE');
		let state = document.querySelectorAll('#LIKE');

		for (let i = 0; i < like.length; i++) {

			image[i].addEventListener("click", function() {
				if (state[i].value == '1') { //delete
					var id = like[i].value;

					console.log(like[i].value);
					/* alert(id); */
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/deleteLikeL.da' />");
					comSubmit.addParam("UP_ID", id);
					comSubmit.addParam("ITEM_ID", id);

					comSubmit.submit();
				} else if (state[i].value == '2') {

					var id = like[i].value;

					console.log(like[i].value);
					/* alert(id); */
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/putLikeL.da' />");
					comSubmit.addParam("UP_ID", id);
					comSubmit.addParam("UP_COUNT", 1);
					comSubmit.addParam("ITEM_ID", id);

					comSubmit.submit();

				} else {

					confirm("로그인 후 이용하실 수 있습니다");

					var id = like[i].value;

					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/productList.da' />");
					comSubmit.addParam("UP_ID", id);

					comSubmit.submit();
				}

			});
		}

	});
</script>

<script type="text/javascript">


function putLike(){

	
	let like = document.querySelectorAll('#ITEM_ID');
	let image = document.querySelectorAll('#IMAGE');

	
	for(let i=0; i<like.length;i++){
		
		
    image[i].addEventListener("click", function() {
       var id = like[i].value;
       
       console.log(like[i].value);
       /* alert(id); */
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/putLikeL.da' />");
	   comSubmit.addParam("UP_ID", id);
	   comSubmit.addParam("UP_COUNT", 1);
	   comSubmit.addParam("ITEM_ID", id);
	   

	   comSubmit.submit();
    });
	   
	}
	
}

function deleteLike(){
	
	
	let like = document.querySelectorAll('#ITEM_ID');
	let image = document.querySelectorAll('#IMAGE');

	
	for(let i=0; i<like.length;i++){
		
		
    image[i].addEventListener("click", function() {
       var id = like[i].value;
       
       console.log(like[i].value);
       /* alert(id); */
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/deleteLikeL.da' />");
	   comSubmit.addParam("UP_ID", id);
	   comSubmit.addParam("ITEM_ID", id);
	   

	   comSubmit.submit();
    });
	   
	}
	   
}

function loginLike(){
	confirm("로그인 후 이용하실 수 있습니다");
	
	var UP_ID = document.getElementById("ITEM_ID").value;
	

	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/productList.da' />");
	   comSubmit.addParam("UP_ID", UP_ID);
	   
	   comSubmit.submit();
	
	
}


</script>

<script>
$(window).load(function (){
	//해당 클래스명을 갖고있는 요소들을 변수로 지정.
    const btn = document.querySelectorAll('.menu_btn1')
    const storeItems = document.querySelectorAll('.item_area')
    var menuFilter = [];//활성화된 메뉴의 이름을 모아두는 set.
	var n = 9; //storeItems중 처음에 보여줄 상품의 개수.
	var itemCount3 = 1;
	
	//처음 실행시 아이템 9개만 불러오기.
	storeItems.forEach(i=>{
		if(itemCount3 <= n){
			i.style.display = 'block';
			itemCount3 ++;
		}else{
			i.style.display = 'none';
		}
	})
	
/* 무한 스크롤 함수 */
    window.onscroll = function(){
    	//innerHeight: 사용자가 실제로 보는 영역의 높이.
    	//scrollY: 처음부터 scroll로 내려간 거리.
    	//body.offsetHeight: 가려진 부분을 포함한 전체 높이.
    	if((window.innerHeight + window.scrollY - 300) >= document.body.offsetHeight){
    		var itemCount2 = 1;
    		var a = 1;
    		n = n + 9;
    		console.log(n);
    		console.log(menuFilter);
    		
    		if(menuFilter == ''){
    			storeItems.forEach(i=>{
    				if(itemCount2 <= n){
    					i.style.display = 'block';
    					itemCount2 ++;
    				}else{
    					i.style.display = 'none';
    				}
    			})
    		}else{
				storeItems.forEach(i=>{
					if(itemCount2 <= n){
						var itemCaf = "itemCaf" + a;
						var itemType = "itemType" + a;
						var itemTaste = "itemTaste" + a;
						var itemLoc = "itemLoc" + a;
						
						if(menuFilter.indexOf(document.getElementById(itemCaf).value) >= 0
								|| menuFilter.indexOf(document.getElementById(itemType).value) >= 0
									|| menuFilter.indexOf(document.getElementById(itemTaste).value) >= 0
										|| menuFilter.indexOf(document.getElementById(itemLoc).value) >= 0) {
							i.style.display = 'block';
						}else{
							i.style.display = 'none';
						}
						a ++;
						itemCount2 ++;
					}else{
						i.style.display = 'none';
					}
				})
			}
    	}
    }
/* 무한 스크롤 함수 */

    // 1.버튼 배열.버튼의 클릭유무를 확인해서 menuFilter 배열에 추가or제거.
    $(btn).click(function(e){
    	n=9;
		e.preventDefault()
		const btnId = e.target.dataset.id
		const btnName = e.target.dataset.name
		var a = 1;//상품의 id값을 증가시키기 위한 변수.
		var itemCount = 1; //storeItems의 forEach실행 시 반복횟수.

		// 1-1-1. 버튼 활성
		if(this.style.backgroundColor != 'skyblue'){
			this.style.backgroundColor = 'skyblue';//하늘색으로 변경.
			menuFilter.push(btnId); //해당 버튼의 Id를 배열에 추가.
		// 1-1-2. 버튼 비활성
		}else{
			this.style.backgroundColor = 'transparent';//흰색으로 변경.
			var menuFilter2 = menuFilter.filter((element) => element !== btnId);//해당 버튼의 Id를 배열에서 제거하고 menuFilter2에 넣는다.
			menuFilter = menuFilter2;
		}
		
		// 1-2-1. 배열이 비어있으면(=눌린버튼이 하나도 없으면) 모든 상품이 보이게.
		if(menuFilter == ''){
			storeItems.forEach(i=>{
				//itemCount가 n이하인 상품들은 blcok.
				if(itemCount <= n){
					i.style.display = 'block';
					itemCount ++;
				//itemCount가 n을 넘는 나머지 상품들은 none.
				}else{
					i.style.display = 'none';
				}
			})
		// 1-2-2. 배열에 값이 하나라도 있으면.
		}else{
			//상품 배열
			storeItems.forEach(i=>{
				
				//itemCount가 n이하인 상품들은 block, none 결정과정을 진행.
				if(itemCount <= n){
					//상품의 각 메뉴별 id값.
					var itemCaf = "itemCaf" + a;
					var itemType = "itemType" + a;
					var itemTaste = "itemTaste" + a;
					var itemLoc = "itemLoc" + a;
					
					// Item의 itemCaf, itemType, itemTaste, itemLoc의 값이 배열에 포함되어있는지 확인.
					// 1-2-2-1. 4가지중 하나라도 포함하면 보이게 수정.
					if(menuFilter.indexOf(document.getElementById(itemCaf).value) >= 0
							|| menuFilter.indexOf(document.getElementById(itemType).value) >= 0
								|| menuFilter.indexOf(document.getElementById(itemTaste).value) >= 0
									|| menuFilter.indexOf(document.getElementById(itemLoc).value) >= 0) {
						i.style.display = 'block';
					// 1-2-2-2. 하나도 없으면 안보이게 수정.
					}else{
						i.style.display = 'none';
					}
					a ++; //상품의 id값을 증가시킨다.
					itemCount ++;
				//itemCount가 n을 넘는 나머지 상품들은 none.
				}else{
					i.style.display = 'none';
				}
			})
		}							
	});
});
</script>
	 
<script>
//메뉴 드롭다운
var coll = document.getElementsByClassName("collapsible_item");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content_item = this.nextElementSibling;
    if (content_item.style.maxHeight){
      content_item.style.maxHeight = null;
    } else {
      content_item.style.maxHeight = content_item.scrollHeight + "px";
    } 
  });
}
</script>

<script>

 // 'send'라는 id를 가진 버튼 클릭 시 실행.
    $("#send").click(function(){
 
            // json 형식으로 데이터 set
            var params = {
                      caf      : $("#caf").val()
                    , types       : $("#type").val()
					, taste		  : $("#taste").val()
                    , grind       : $("#grind").val()
                    , location    : $("#location").val()
            }
                
            // ajax 통신
            $.ajax({
                type : "GET",            // HTTP method type(GET, POST) 형식이다.
                url : "/productList.da",      // 컨트롤러에서 대기중인 URL 주소이다.
                data : params,            // Json 형식의 데이터이다.
                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                    // 응답코드 > 0000
                    alert(res.code);
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.")
                }
            });
        });

</script>
</body>
<footer>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</footer>
</html>
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

/* νμ μΆκ° */

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
					<li><h1>μν</h1></li>
					<li><hr width="100%;" ></li>
					<li><button type="button" class="collapsible_item">μΉ΄νμΈ</button>
							<div class="content_item">
								<c:forEach items="${hsCaf}" var="item" varStatus="i">
									<p><a class="menu_btn1" data-id="${item}" data-name="caf">${item}</a></p>
								</c:forEach>
							</div> 
					</li>
					<li><button type="button" class="collapsible_item">μλμ’λ₯</button>
							<div class="content_item">
								<c:forEach items="${hsType}" var="item" varStatus="status">
									<p><a class="menu_btn1" data-id="${item}" data-name="type">${item}</a><p>
								</c:forEach>
							</div> 
				      </li>
				      <li>
				         <button type="button" class="collapsible_item">λ§κ³Ό ν₯</button>
				         <div class="content_item">
				           <c:forEach items="${hsTaste}" var="item" varStatus="status">
									<p><a class="menu_btn1" data-id="${item}" data-name="taste">${item}</a><p>
				           </c:forEach>
				         </div> 
				      </li>
				      <li><button type="button" class="collapsible_item">μμ°μ§</button>
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
                         <!-- λ‘κ·ΈμΈ μ° -->
                         
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart3.png" /></div>
                        </c:when>
                        <c:when test="${product.like == '2'}"> <!-- λ‘κ·ΈμΈ -->
                       
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart1.png" /></div>
                        </c:when>
                        <c:otherwise> <!-- -->
                       
                        <img style="height: 30px; weight: 30px;" id="IMAGE" name="IMAGE" src="resources/images/heart1.png" /></div>
                        </c:otherwise>
                        </c:choose>
							<h6 class="price_text"><a href="productDetail.da?ITEM_ID=${product.ITEM_ID}">${product.ITEM_NAME} <br><span style="color: #f75261;">${product.ITEM_200}μ</span></a></h6>
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

					confirm("λ‘κ·ΈμΈ ν μ΄μ©νμ€ μ μμ΅λλ€");

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
	confirm("λ‘κ·ΈμΈ ν μ΄μ©νμ€ μ μμ΅λλ€");
	
	var UP_ID = document.getElementById("ITEM_ID").value;
	

	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/productList.da' />");
	   comSubmit.addParam("UP_ID", UP_ID);
	   
	   comSubmit.submit();
	
	
}


</script>

<script>
$(window).load(function (){
	//ν΄λΉ ν΄λμ€λͺμ κ°κ³ μλ μμλ€μ λ³μλ‘ μ§μ .
    const btn = document.querySelectorAll('.menu_btn1')
    const storeItems = document.querySelectorAll('.item_area')
    var menuFilter = [];//νμ±νλ λ©λ΄μ μ΄λ¦μ λͺ¨μλλ set.
	var n = 9; //storeItemsμ€ μ²μμ λ³΄μ¬μ€ μνμ κ°μ.
	var itemCount3 = 1;
	
	//μ²μ μ€νμ μμ΄ν 9κ°λ§ λΆλ¬μ€κΈ°.
	storeItems.forEach(i=>{
		if(itemCount3 <= n){
			i.style.display = 'block';
			itemCount3 ++;
		}else{
			i.style.display = 'none';
		}
	})
	
/* λ¬΄ν μ€ν¬λ‘€ ν¨μ */
    window.onscroll = function(){
    	//innerHeight: μ¬μ©μκ° μ€μ λ‘ λ³΄λ μμ­μ λμ΄.
    	//scrollY: μ²μλΆν° scrollλ‘ λ΄λ €κ° κ±°λ¦¬.
    	//body.offsetHeight: κ°λ €μ§ λΆλΆμ ν¬ν¨ν μ μ²΄ λμ΄.
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
/* λ¬΄ν μ€ν¬λ‘€ ν¨μ */

    // 1.λ²νΌ λ°°μ΄.λ²νΌμ ν΄λ¦­μ λ¬΄λ₯Ό νμΈν΄μ menuFilter λ°°μ΄μ μΆκ°orμ κ±°.
    $(btn).click(function(e){
    	n=9;
		e.preventDefault()
		const btnId = e.target.dataset.id
		const btnName = e.target.dataset.name
		var a = 1;//μνμ idκ°μ μ¦κ°μν€κΈ° μν λ³μ.
		var itemCount = 1; //storeItemsμ forEachμ€ν μ λ°λ³΅νμ.

		// 1-1-1. λ²νΌ νμ±
		if(this.style.backgroundColor != 'skyblue'){
			this.style.backgroundColor = 'skyblue';//νλμμΌλ‘ λ³κ²½.
			menuFilter.push(btnId); //ν΄λΉ λ²νΌμ Idλ₯Ό λ°°μ΄μ μΆκ°.
		// 1-1-2. λ²νΌ λΉνμ±
		}else{
			this.style.backgroundColor = 'transparent';//ν°μμΌλ‘ λ³κ²½.
			var menuFilter2 = menuFilter.filter((element) => element !== btnId);//ν΄λΉ λ²νΌμ Idλ₯Ό λ°°μ΄μμ μ κ±°νκ³  menuFilter2μ λ£λλ€.
			menuFilter = menuFilter2;
		}
		
		// 1-2-1. λ°°μ΄μ΄ λΉμ΄μμΌλ©΄(=λλ¦°λ²νΌμ΄ νλλ μμΌλ©΄) λͺ¨λ  μνμ΄ λ³΄μ΄κ².
		if(menuFilter == ''){
			storeItems.forEach(i=>{
				//itemCountκ° nμ΄νμΈ μνλ€μ blcok.
				if(itemCount <= n){
					i.style.display = 'block';
					itemCount ++;
				//itemCountκ° nμ λλ λλ¨Έμ§ μνλ€μ none.
				}else{
					i.style.display = 'none';
				}
			})
		// 1-2-2. λ°°μ΄μ κ°μ΄ νλλΌλ μμΌλ©΄.
		}else{
			//μν λ°°μ΄
			storeItems.forEach(i=>{
				
				//itemCountκ° nμ΄νμΈ μνλ€μ block, none κ²°μ κ³Όμ μ μ§ν.
				if(itemCount <= n){
					//μνμ κ° λ©λ΄λ³ idκ°.
					var itemCaf = "itemCaf" + a;
					var itemType = "itemType" + a;
					var itemTaste = "itemTaste" + a;
					var itemLoc = "itemLoc" + a;
					
					// Itemμ itemCaf, itemType, itemTaste, itemLocμ κ°μ΄ λ°°μ΄μ ν¬ν¨λμ΄μλμ§ νμΈ.
					// 1-2-2-1. 4κ°μ§μ€ νλλΌλ ν¬ν¨νλ©΄ λ³΄μ΄κ² μμ .
					if(menuFilter.indexOf(document.getElementById(itemCaf).value) >= 0
							|| menuFilter.indexOf(document.getElementById(itemType).value) >= 0
								|| menuFilter.indexOf(document.getElementById(itemTaste).value) >= 0
									|| menuFilter.indexOf(document.getElementById(itemLoc).value) >= 0) {
						i.style.display = 'block';
					// 1-2-2-2. νλλ μμΌλ©΄ μλ³΄μ΄κ² μμ .
					}else{
						i.style.display = 'none';
					}
					a ++; //μνμ idκ°μ μ¦κ°μν¨λ€.
					itemCount ++;
				//itemCountκ° nμ λλ λλ¨Έμ§ μνλ€μ none.
				}else{
					i.style.display = 'none';
				}
			})
		}							
	});
});
</script>
	 
<script>
//λ©λ΄ λλ‘­λ€μ΄
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

Β //Β 'send'λΌλΒ idλ₯ΌΒ κ°μ§Β λ²νΌΒ ν΄λ¦­Β μΒ μ€ν.
Β Β Β Β $("#send").click(function(){
Β 
Β Β Β Β Β Β Β Β Β Β Β Β //Β jsonΒ νμμΌλ‘Β λ°μ΄ν°Β set
Β Β Β Β Β Β Β Β Β Β Β Β varΒ paramsΒ =Β {
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β cafΒ Β Β Β Β Β :Β $("#caf").val()
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β ,Β typesΒ Β Β Β Β Β Β :Β $("#type").val()
					, taste		  : $("#taste").val()
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β ,Β grindΒ Β Β Β Β Β Β :Β $("#grind").val()
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β ,Β locationΒ Β Β Β :Β $("#location").val()
Β Β Β Β Β Β Β Β Β Β Β Β }
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β 
Β Β Β Β Β Β Β Β Β Β Β Β //Β ajaxΒ ν΅μ 
Β Β Β Β Β Β Β Β Β Β Β Β $.ajax({
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β typeΒ :Β "GET",Β Β Β Β Β Β Β Β Β Β Β Β // HTTP method type(GET, POST) νμμ΄λ€.
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β urlΒ :Β "/productList.da",      //Β μ»¨νΈλ‘€λ¬μμΒ λκΈ°μ€μΈΒ URLΒ μ£Όμμ΄λ€.
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β dataΒ :Β params,Β Β Β Β Β Β Β Β Β Β Β Β //Β JsonΒ νμμΒ λ°μ΄ν°μ΄λ€.
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β successΒ :Β function(res){Β //Β λΉλκΈ°ν΅μ μΒ μ±κ³΅μΌκ²½μ°Β successμ½λ°±μΌλ‘Β λ€μ΄μ΅λλ€.Β 'res'λΒ μλ΅λ°μΒ λ°μ΄ν°μ΄λ€.
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β //Β μλ΅μ½λΒ >Β 0000
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β alert(res.code);
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β },
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β errorΒ :Β function(XMLHttpRequest,Β textStatus,Β errorThrown){Β //Β λΉλκΈ°Β ν΅μ μ΄Β μ€ν¨ν κ²½μ°Β errorΒ μ½λ°±μΌλ‘Β λ€μ΄μ΅λλ€.
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β alert("ν΅μ Β μ€ν¨.")
Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β Β }
Β Β Β Β Β Β Β Β Β Β Β Β });
Β Β Β Β Β Β Β Β });

</script>
</body>
<footer>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</footer>
</html>
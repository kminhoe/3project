<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html>
<head>

<style>

.div1 {
  display: flex;
  align-items: center; /* 수직 정렬 */
  flex-direction: row; /* default: row */
  justify-content: center; /* flex direction에 대해서 정렬방식 선택 */
}

.cart_btn {
    display: inline-block;
    padding: 4px 15px;
    font-size: 14px;
    font-family: 'NotoSansKR-Regular';
    border-radius: 5px;
    background-color: D3D3D3;
    border-color: D3D3D3;
    border: 2px;

}



</style>

   	  <!-- include 부분 -->
	  <%@include file="/WEB-INF/include/header.jsp" %>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <body>
 
 <!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 

      
        <!-- product in cart-->
        <div class="container">
            <div class="row">
                <h1 class="order_title"><br>장바구니</h1>
                <div class="jb-division-line2"></div>
            </div>
            <br>
            <table>
            <form id="orderForm" action="/coffeedao/pOrderForm.da" modelAttribute="cartBean">
            <input type="hidden" name="chk[]" id="chk" value="" />
            <input type="hidden" name="no_chk[]" id="no_chk" value="" />
             
                <colgroup>
                    <col width="50">
                    <col width="100">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                    <col width="100">   
                </colgroup>
                <thead align="center" style="border-bottom: 1px solid #ded3c3;" >
                    <tr>
                        <th></th>
                        <th colspan="2">상품정보</th>
                        <th>분쇄도</th>
                        <th>용량</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th colspan="2">총금액</th>
                    </tr>              
                </thead>
                <tbody height="100" align="center">
                

                        
                   
                    <c:choose>
                    <c:when test="${fn:length(cartList) != 0}"> 
                        <c:forEach var="i" begin="0" end="${fn:length(cartList)-1}">       
                        <input type="hidden" name="cartBeanList[${i}].CART_NAME"  value="${cartList[i].CART_NAME}" />
                        <input type="hidden" name="cartBeanList[${i}].CART_IDX"  value="${cartList[i].CART_IDX}" />
                        <input type="hidden" name="cartBeanList[${i}].CART_ID"  value="${cartList[i].CART_ID}" />  
                        <input type="hidden" name="cartBeanList[${i}].ITEM_SELLER"  value="${cartList[i].SELL_ID}" />
                        <input type="hidden" name="cartBeanList[${i}].ITEM_IMAGE"  value="${cartList[i].ITEM_IMAGE}" />             
                       
                       
                       <div class="cart"><div class="cart${i}">
                        <tr>
                       
                        <td col width="50">
                        <input type="checkbox" id="CHECKBOX" name="CHECKBOX" class="CHECKBOX" 
                        onclick="checkBox()" data-cartNum="${cartList[i].CART_IDX}" checked>
                       
                        </td>
                      
                        <td ><img src="resources/img/${cartList[i].ITEM_IMAGE}" style="width: 150px;
							height:150px; margin: 10px;" >
							</td>
							
                        <td align="left">
                            <div class="product_name_part">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cartList[i].CART_NAME} </div>
                            
                            <br>
                            <div class="product_subscribe_option"></div>
                        </td>
                        <td>
                        <!-- 분쇄도 선택 -->
                        <c:choose>
                        <c:when test="${cartList[i].CART_GRIND == '분쇄하지 않음'}">
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음" selected>분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립">핸드 드립</option>
                                <option value="모카포트">모카포트</option>
                            </select>
                         </c:when>
                         
                         <c:when test="${cartList[i].CART_GRIND == '커피메이커'}">
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음" >분쇄하지 않음</option>
                                <option value="커피메이커" selected>커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립">핸드 드립</option>
                                <option value="모카포트">모카포트</option>
                            </select>
                         </c:when>
                         
                         <c:when test="${cartList[i].CART_GRIND == '에스프레소 머신'}">
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음" >분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신" selected>에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립">핸드 드립</option>
                                <option value="모카포트">모카포트</option>
                            </select>
                         </c:when>
                         
                         <c:when test="${cartList[i].CART_GRIND == '프렌치 프레스'}">
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음" >분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스" selected>프렌치 프레스</option>
                                <option value="핸드 드립" >핸드 드립</option>
                                <option value="모카포트">모카포트</option>
                            </select>
                         </c:when>
                         
                         <c:when test="${cartList[i].CART_GRIND == '핸드 드립'}">
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음">분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립" selected>핸드 드립</option>
                                <option value="모카포트" >모카포트</option>
                            </select>
                         </c:when>
                         
                         <c:otherwise>
                            <select style="width: 80%;" id="CART_GRIND" name="cartBeanList[${i}].CART_GRIND">
                                <option value="분쇄하지 않음" >분쇄하지 않음</option>
                                <option value="커피메이커">커피메이커</option>
                                <option value="에스프레소 머신">에스프레소 머신</option>
                                <option value="프렌치 프레스">프렌치 프레스</option>
                                <option value="핸드 드립">핸드 드립</option>
                                <option value="모카포트" selected>모카포트</option>
                            </select>
                         </c:otherwise>
                         </c:choose>
                        </td>
                        
                        <!-- 용량 200g은 cart_price에 1로 담기고, 500g은 2로 담긴다 -->
                        <c:choose>
                        <c:when test="${cartList[i].CART_PRICE == '1'}">
                        <td>
                            <select style="width: 80%;" id="CART_PRICE" name="cartBeanList[${i}].CART_PRICE" onchange="changeNum()">
                                <option value="1" selected>200g</option>
                                <option value="2">500g</option>                           
                            </select>
                            
                        </td>
                        </c:when>
                        
                        <c:otherwise>
                        <td>
                            <select style="width: 80%;" id="CART_PRICE" name="cartBeanList[${i}].CART_PRICE" onchange="changeNum()">
                                <option value="1">200g</option>
                                <option value="2" selected>500g</option>
                            </select>
                            
                        </td>
                        </c:otherwise>
                        
                        </c:choose>
                        <td >
                        
                  
                       <input type="number" id="CART_COUNT" name="cartBeanList[${i}].CART_COUNT" style="width: 3em;" 
                       value="${cartList[i].CART_COUNT}" maxlength="2" > 
                        
                        </td>
                        <!-- 개별 금액 -->
                        <c:if test="${cartList[i].CART_PRICE == '1'}">
                       <input type="hidden" id="ITEM_200" name="cartBeanList[${i}].ITEM_200" value="${cartList[i].ITEM_200}"/>
                       <input type="hidden" id="ITEM_500" name="cartBeanList[${i}].ITEM_500" value="${cartList[i].ITEM_500}"/>
                       <td><div id="ITEM${i}">${cartList[i].ITEM_200} 원</div></td>
                        </c:if>
                        
                        <c:if test="${cartList[i].CART_PRICE == '2'}">
                        <input type="hidden" id="ITEM_500" name="cartBeanList[${i}].ITEM_500" value="${cartList[i].ITEM_500}"/>
                        <input type="hidden" id="ITEM_200" name="cartBeanList[${i}].ITEM_200" value="${cartList[i].ITEM_200}"/>
                        <td><div id="ITEM${i}">${cartList[i].ITEM_500} 원</div></td>
                        </c:if> 
                        
                        
                        
                        <!-- 총금액 -->
                         <c:if test="${cartList[i].CART_PRICE == '1'}">
                         <input type="hidden" id="CART_TOT" name="CART_TOT" value="${cartList[i].ITEM_200 * cartList[i].CART_COUNT}"/>
                        <td colspan="2" ><div id="tot${i}">${cartList[i].ITEM_200 * cartList[i].CART_COUNT} 원</div></td>
                        </c:if>
                        
                        <c:if test="${cartList[i].CART_PRICE == '2'}">
                        <input type="hidden" id="CART_TOT" name="CART_TOT" value="${cartList[i].ITEM_500 * cartList[i].CART_COUNT}" />
                        <td colspan="2"><div id="tot${i}">${cartList[i].ITEM_500 * cartList[i].CART_COUNT} 원</div></td>
                        </c:if>
                        
                        
                        <td>                            
                            <div>
                            <input type="hidden" id="CART_IDX" name= "CART_IDX" value="${cartList[i].CART_IDX}">
                            <input class="cart_btn" type="button" value="삭  제" onclick="cartDelete()">
                           </div>
                        </td>
                        <!-- div 끝 -->
                        </div></div>
                        </c:forEach>
                        
                        </c:when>
                        
                       <c:otherwise>
                    
							<tr>						
								<td style="text-align: center;" colspan="10">등록된 상품이 없습니다</td>
								
							</tr>
						</c:otherwise>
						
                        </c:choose>
                    
                    <tfoot>
                        <td height="100px" align="right" colspan="9">
                            <input class="cart_btn" type="button" value="쇼핑계속하기">
                        </td>
                        
                        
                    </tfoot>
                </tbody>
                
            </table>
            <!-- product in cart-->

            <!-- payment info-->
            <table>
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="150">
                    <col width="100">
                    <col width="100">
                    <col width="250">
                </colgroup>
                <thead align="center" style="border-top: 1px solid #ded3c3;">
                    <tr><th colspan="8"><br></th></tr>
                    <<c:choose>
                    <c:when test="${cartList[0].CART_IDX != null}"> 
                    <tr>
                        <th>총 구매수량</th>
                        <th>총 상품금액</th>
                        <th>+</th>
                        <th>배송비</th>
                        <th>=</th>
                        <th colspan="2">총금액</th>
                    </tr>
                </thead>
                <tbody align="center" style="border-bottom: 1px solid #ded3c3;">
                    <tr height="100px">
                    <th><div id="check_length"></div></th>
                    <th><div id="total_price"></div></th>
                    <th></th>
                    <th>2,500 원</th>
                    <th></th>
                    <th colspan=2><div id="fee" ></div></th>
                    </tr>
                    <tfoot>
                    <td height="100px" align="right" colspan="9">
                        <input class="cart_button" type="button" onclick="order_select()" value="선택구매하기">
                        &nbsp;&nbsp;&nbsp;
                        <input class="cart_button" type="button" id="order_All" value="전체구매하기">
                    </td>
                   
                </tfoot>
                    </c:when>
                       <c:otherwise>
                       <tr>
							
						</tr>
						</c:otherwise>
                        </c:choose>
                </tbody>
</form> 
            </table>
            <!-- payment info-->
        </div>
   </body>

<!-- 원두 용량 변경 시 상품 금액 변경 -->
<script>


	function changeNum() {


		let divcart = document.querySelectorAll('.cart');
		let cart_count = document.querySelectorAll('#CART_COUNT', '.cart');
		let cart_price = document.querySelectorAll('#CART_PRICE', '.cart');
		let item_200 = document.querySelectorAll('#ITEM_200', '.cart');
		let item_500 = document.querySelectorAll('#ITEM_500', '.cart');
		let cart_tot = document.querySelectorAll('#CART_TOT', '.cart');
		let checkbox = document.querySelectorAll('#CHECKBOX', '.cart');
		
		var item_price = new Array();
		var tot = new Array();
		var total = new Array();
		
	

		for (let i = 0; i < divcart.length; i++) {
			
			
				
				if (cart_price[i].options[cart_price[i].selectedIndex].value == '1') {
					//개별 금액 변경
					item_price[i] = item_200[i].value;
					$("#ITEM"+i).html(item_price[i]+' 원');
					
					//총 금액 변경	 
					 tot[i] = cart_count[i].value * item_price[i];
					 console.log("값 : " + tot[i]);
					 $("#tot"+i).html(tot[i]+' 원');
					 
					 
					 checkbox[i].value = tot[i];
						
					 checkBox();
					 
						//수량 변경 시 총 금액 변경	
					 cart_count[i].addEventListener("change", function() {
						 tot[i] = cart_count[i].value * item_price[i];
						 //console.log("값 : " + a[i]);
						 $("#tot"+i).html(tot[i]+' 원');
						 
						//checkbox에 값을 넣기 위해 total 배열 사용
						 total[i] = tot[i];
							
							
							//total 배열 비어있을 경우 원래 값 넣기
							for (let i = 0; i < divcart.length; i++) {
								if (total[i] == null) {
									total[i] = cart_tot[i].value;
								}
							}//checkbox for
							
							//checkbox에 값 넣기
							checkbox[i].value = total[i];
							
							checkBox();
					 });
				   
				} else {
					
					//개별 금액 변경
					item_price[i] = item_500[i].value;
					$("#ITEM"+i).html(item_price[i]+' 원');
					
					tot[i] = cart_count[i].value * item_price[i];
					 console.log("값 : " + tot[i]);

					 $("#tot"+i).html(tot[i]+' 원');
					 
					 checkbox[i].value = tot[i];
						
					checkBox();
					 
						//수량 변경 시 총 금액 변경	
					 cart_count[i].addEventListener("change", function() {
						 tot[i] = cart_count[i].value * item_price[i];
						 //console.log("값 : " + a[i]);
						 $("#tot"+i).html(tot[i]+' 원');
						 
						//checkbox에 값을 넣기 위해 total 배열 사용
						 total[i] = tot[i];
							
							
							//total 배열 비어있을 경우 원래 값 넣기
							for (let i = 0; i < divcart.length; i++) {
								if (total[i] == null) {
									total[i] = cart_tot[i].value;
								}
							}//checkbox for

							
							//checkbox에 값 넣기
							checkbox[i].value = total[i];
							
							checkBox();
					 });

				} //else
			
		} //for

	}; //function
	
</script>








<!-- 수량에 따른 총 금액 계산 -->
<script>
	$(function() {
		
		//renameForModelAttribute();
		
		//기본 정보 불러오기
		let divcart = document.querySelectorAll('.cart');
		let cart_count = document.querySelectorAll('#CART_COUNT', '.cart');
		let item_200 = document.querySelectorAll('#ITEM_200', '.cart');
		let item_500 = document.querySelectorAll('#ITEM_500', '.cart');
		let cart_price = document.querySelectorAll('#CART_PRICE', '.cart');
		let checkbox = document.querySelectorAll('#CHECKBOX', '.cart');
		let cart_tot = document.querySelectorAll('#CART_TOT', '.cart');
		let chekObj = document.getElementsByName("CHECKBOX");
		var check_length = document.querySelectorAll('input[name="CHECKBOX"]:checked').length;
		
		var item_price = new Array(); //
		var tot = new Array();
		var total = new Array();
		let total_price = 0;
		

		
		
		//용량에 따른 가격 계산
		for (let i = 0; i < divcart.length; i++) {
			
			console.log("cart_price : " + cart_price[i].value);
			
			if (cart_price[i].value == '1') {
				item_price[i] = item_200[i].value;
				
			} else {
				item_price[i] = item_500[i].value;
				
			}

	//========처음 로딩=========
			//총 상품 금액 표시
			checkbox[i].value = cart_count[i].value * item_price[i];
			total_price += cart_count[i].value * item_price[i];
			$("#total_price").html(total_price+' 원');
			
			fee = total_price + Number(2500);
			 $("#fee").html(fee+' 원');
			 
			 $("#check_length").html(check_length);
			 
			 
			 
			 
	//=======================
			
		//수량 변경 시 총 금액 변경	
		 cart_count[i].addEventListener("change", function() {
			 tot[i] = cart_count[i].value * item_price[i];
			 //console.log("값 : " + a[i]);
			 $("#tot"+i).html(tot[i]+' 원');
			 
			//checkbox에 값을 넣기 위해 total 배열 사용
			 total[i] = tot[i];

			 //console.log(" total : " + total); //확인용
				
				
				//total 배열 비어있을 경우 원래 값 넣기
				for (let i = 0; i < divcart.length; i++) {
					if (total[i] == null) {
						total[i] = cart_tot[i].value;
					}
				}//checkbox for

				
				//checkbox에 값 넣기
				checkbox[i].value = total[i];
				
				checkBox();
				
				
		 });
		
		 
		} //for

	});

</script>


<script>
    //총금액 계산
	function checkBox() {
		
		var check_length = document.querySelectorAll('input[name="CHECKBOX"]:checked').length;
		var check = document.querySelectorAll('input[name="CHECKBOX"]:checked');
		let total_price = 0;
		let fee = 0;
		
		
		 for (i = 0; i < check_length; i++) {
			 
			 total_price += Number(check[i].value);
			$("#total_price").html(total_price+' 원');
			
			fee = total_price + Number(2500);
			 $("#fee").html(fee+' 원');
			 
			 $("#check_length").html(check_length);
			
		 }
		
	}
	

	
</script>

<script src="<c:url value='resources/js/common.js'/>" charset="utf-8"></script>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>

//카트 삭제
function cartDelete(){
	
	let cart_idx = document.querySelectorAll('#CART_IDX', '.cart');
	let divcart = document.querySelectorAll('.cart');
	
	for (let i = 0; i < divcart.length; i++) {
	   var idx = cart_idx[i].value;
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/cartDelete.da' />");
	   comSubmit.addParam("CART_IDX", idx);
	   comSubmit.submit();
	   
	}
	   
}

function putLike(){
	
	let cart_id = document.querySelectorAll('#CART_ID', '.cart');
	let divcart = document.querySelectorAll('.cart');
	
	for (let i = 0; i < divcart.length; i++) {
	   var id = cart_id[i].value;
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/putLike.da' />");
	   comSubmit.addParam("UP_ID", cart_id[i].value);
	   comSubmit.addParam("UP_COUNT", 1);
	   comSubmit.submit();
	   
	}
	   
}


</script>

<!-- 선택 주문하기 -->
<script>


	
	function order_select(){

	 
    var checkArr = new Array();
    var NOTcheckArr = new Array();
    
    //인덱스 값 받을 때 사용
    $("input[class='CHECKBOX']:checked").each(function () {
        checkArr.push($("input[name=CHECKBOX]").index(this)); //인덱스 값 받을 때 사용
        //IDX.push($(this).attr("data-cartNum")); //IDX 값 받을 때 사용
        
    });
    console.log(checkArr);
    $("#chk").val(checkArr);
    
    //선택되지 않은 체크박스의 IDX 구하기
    $("input[class='CHECKBOX']:not(:checked)").each(function () {
    	NOTcheckArr.push($(this).attr("data-cartNum")); 
        
    });
    console.log(NOTcheckArr);
    $("#no_chk").val(NOTcheckArr);


    confirm("주문완료 하시겠습니까?");
        
      
     $("#orderForm").submit();
    

	}

</script>

<!-- 전체 주문하기 -->
<script type="text/javascript">

$("#order_All").click(function () {
	
	const checkboxes = document.getElementsByName('CHECKBOX');
	
	checkboxes.forEach((checkbox) => {
		$(":checkbox").prop("checked",true);
		});
	
	order_select();

	
});

</script>


</html>
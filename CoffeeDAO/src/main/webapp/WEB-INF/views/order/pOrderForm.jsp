<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<style>
.tab {
	margin-left: auto;
	margin-right: auto;
	width: 600px;
	height: 80px;
}

.col1 {
	padding: 10px;
	text-align: right;
	font-weight: bold;
	font-size: 15px;
}

.col2 {
	text-align: left;
	padding: 5px;
}

.td1 {
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 25px;
	padding-bottom: 25px;
	font-weight: bold;
	font-size: 27px;
}

.cart-total-price {
	width: 60%;
	height: 80px;
	clear: both;
	border: 4px solid #c8c8c8;
	text-align: right;
	align: center;
	margin: 0 auto;
	display: block;

}

.cart-total-price__inner {
	display: inline-block;
	margin: 0 auto;
	line-height : 80px;
	font-weight: bold;
	font-size: 25px;
	text-align: right;
	
}

.order{
width: 100px;
text-align: left;
display: inline-block;
line-height : 80px;

}

.button2{
    font-size: 12px;
    color:rgb(255, 250, 250);
    text-align: center;
    border: 10px;
    background-color: lightgrey;
    border-radius: 10px;
    width: 100px;
	height: 30px;
	
}
</style>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<!-- 주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ORDER_ADDR2").value = extraAddr;
                
                } else {
                    document.getElementById("ORDER_ADDR2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ORDER_ZP').value = data.zonecode;
                document.getElementById("ORDER_ADDR1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ORDER_ADDR2").focus();
            }
        }).open();
    }
</script>


<meta charset="UTF-8">
<!-- include 부분 -->
<%@include file="/WEB-INF/include/header.jsp" %>	
<title>Insert title here</title>
</head>
<body>

<!-- product in cart-->
        <div class="container">
            <div class="row">
                <h1 class="order_title"><br>주문서/결제</h1>
                <div class="jb-division-line2"></div>
            </div>
            <br>
            <table >
            <form id="orderForm" action="/coffeedao/pOrder.da" >
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
                    <tr><th colspan="2" style="font-size: 22px;">주문상세내역<br></th></tr>
                    
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
                    <c:when test="${fn:length(list) != null}"> 
                        <c:forEach var="i" begin="0" end="${fn:length(list)-1}">       
                        
                        <input type="hidden" name="orderBeanList[${i}].ORDER_CART"  value="${list[i].ORDER_CART}" />   
                        <input type="hidden" name="ORDER_MEM" id="ORDER_MEM" value="${list[i].ORDER_MEM}">
                        <input type="hidden" name="PHONE" id="PHONE" value="${list[i].ORDER_PHONE}"> 
                        <input type="hidden" name="ZP" id="ZP" value="${list[i].ORDER_ZP}"> 
                        <input type="hidden" name="ADDR1" id="ADDR1" value="${list[i].ORDER_ADDR1}"> 
                        <input type="hidden" name="ADDR2" id="ADDR2" value="${list[i].ORDER_ADDR2}"> 
                        <input type="hidden" name="orderBeanList[${i}].ORDER_IMAGE" id="ORDER_IMAGE" value="${list[i].ORDER_IMAGE}"> 
                        <input type="hidden" name="orderBeanList[${i}].ORDER_NO" id="ORDER_NO" value="${list[i].ORDER_NO}"> 
                        <input type="hidden" name="orderBeanList[${i}].ORDER_SELLER" id="ORDER_SELLER" value="${list[i].ORDER_SELLER}"> 
                        <input type="hidden" name="SIZE" id="SIZE" value="${fn:length(list)}"> 
                        
                        
                       
                       <div class="cart">
                        <tr>
                       
                        <td col width="50">

                        </td>
                     
                        <td ><img src="resources/img/${list[i].ORDER_IMAGE}" width=150px,
							height=150px></td>
                        <td align="left">
                            <div class="product_name_part">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list[i].ORDER_ITEM}</div>
                      <input type="hidden" name="orderBeanList[${i}].ORDER_ITEM" id="ORDER_ITEM" value="${list[i].ORDER_ITEM}"> 
                            
                            <br>
                            <div class="product_subscribe_option"></div>
                        </td>
                        <td>
                        <input type="hidden" id="ORDER_GRIND" name="orderBeanList[${i}].ORDER_GRIND" value="${list[i].ORDER_GRIND}">
                        ${list[i].ORDER_GRIND}
                        </td>
                        
                        <!-- 용량-->
                        <c:choose>
                        <c:when test="${list[i].ORDER_PRICE == '1'}">
                        <td><input type="hidden" id="PRICE" name="orderBeanList[${i}].PRICE" value="1">            
                        200g                  
                        </td>
                        </c:when>
                        
                        <c:otherwise>
                        <td><input type="hidden" id="PRICE" name="orderBeanList[${i}].PRICE" value="2">  
                        500g 
                        </td>
                        </c:otherwise>
                        </c:choose>
                        
                       <!-- 수량 -->
                       <td >
                       <input type="hidden" id="ORDER_COUNT" name="orderBeanList[${i}].ORDER_COUNT" value="${list[i].ORDER_COUNT}" >
                       
                       ${list[i].ORDER_COUNT} 
                       </td>
                       
                        <!-- 금액 -->
                        <td>
                        <input type="hidden" id="ORDER_PRICE" name="orderBeanList[${i}].ORDER_PRICE" value="${list[i].PRICE}"  >
                        
                        ${list[i].PRICE} 원</td>
                        
                        
                        <!-- 수량 * 금액 -->
                         <td colspan=2>
                        <input type="hidden" id="ORDER_TOT" name="orderBeanList[${i}].ORDER_TOT" value="${list[i].PRICE * list[i].ORDER_COUNT}"  >
                        ${list[i].PRICE * list[i].ORDER_COUNT} 원</td>
                        
                       
                        <!-- div 끝 -->
                        </div>
                        </c:forEach>
                        <tr>
                        </c:when>
                        </c:choose>
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
                    <th>${fn:length(list)}</th>
                    <th><div id="order_price"></div></th>
                    <th></th>
                    <th>2,500 원</th>
                    <th></th>
                    <th colspan=2><div id="order_total" ></div></th>
                    </tr>
          
                </tbody>
            </table>
            
            <table class="tab">
            <thead align="center" style="border-top: 1px solid #ded3c3;">
            <tr><td class="td1">
            배송정보<tr><td>
            </thead>

            <tbody align="center" style="border-top: 1px solid #ded3c3;">
            
             <tr>
             <td class="col1">배송지확인</td>
             <td class="col2">
             <div>
             <input type="radio" id="a" name="delivery" value="기본배송지" checked>기본배송지
             <input type="radio" id="a" name="delivery" value="직접입력">직접입력
             </div>
             </td></tr>
             
             <tr>
             <td class="col1">* 받으실 분</td>
             <td class="col2">
             <input type="text" id="ORDER_NAME" name="ORDER_NAME" value="" placeholder="${list[i].ORDER_MEM}">
             </td>
             </tr>
             
             <tr>
             <td class="col1">* 받으실 곳</td>
             <td class="col2">
             <input type="text" id="ORDER_ZP" name="ORDER_ZP" value=""> <input type="button" class="button2" onclick="sample6_execDaumPostcode()" value="우편번호"/><br>
             <input type="text" id="ORDER_ADDR1" name="ORDER_ADDR1" value="${list[i].ORDER_ADDR1}"
             style="margin: 10px,7px,7px,0; width:400px; height:30px;"><br>
             <input type="text" id="ORDER_ADDR2" name="ORDER_ADDR2" value="${list[i].ORDER_ADDR2}"
             style="margin: 10px,5px,5px,0; width:400px; height:30px;">
             </td>
             </tr>
             
             <tr>
             <td class="col1">* 전화번호</td> 
             <td class="col2">
             <input type="text" id="ORDER_PHONE" name="ORDER_PHONE" value="${list[i].ORDER_PHONE}">
             </td>
             </tr>

             
             <tr>
             <td class="col1">배송시 요청사항</td>
             <td class="col2">
             <select style="width: 80%;" id="ORDER_MEMO" name="ORDER_MEMO" >
                                <option value="배송 입력사항(선택)" >배송 입력사항(선택)</option>
                                <option value="부재시 문 앞에 놓아주세요">부재시 문 앞에 놓아주세요</option>
                                <option value="경비실에 맡겨주세요">경비실에 맡겨주세요</option>
                                <option value="배송 전 미리 연락주세요">배송 전 미리 연락주세요</option>
                                <option value="부재시 문자나 전화 주세요">부재시 문자나 전화 주세요</option>
                                <option value="직접입력">직접입력</option>
             </select>
             <br>
             <textarea style=" width:400px; height:60px;" id="area"></textarea>
             </td>
             </tr>
            </tbody>
            </table>
            <br><br>
            
            <table class="tab">
            
            <thead align="center" style="border-top: 1px solid #ded3c3;">
            <tr><td class="td1">
            결제수단<tr><td>
            </thead>
            
            <tbody align="center" style="border-top: 1px solid #ded3c3;">
            
            <tr>
            <td class="col1">일반결제</td>
            <td class="col2">
            <div>
             <input type="radio" id="a" name="payment" value="계좌이체" checked>계좌이체
             <input type="radio" id="a" name="payment" value="신용카드">신용카드
             </div>
             </td>
             </tr>
             
             <tr>
             <td class="col1">* 입금자명</td>
             <td class="col2">
             <input type="text" id="ORDER_HOLDER" name="ORDER_HOLDER" >
             </td>
             </tr>
             
            
             <tr>
             <td class="col1">계좌</td>
             <td class="col2" style="font-size:17px">
             우리은행 1002-111-111111
            </td>
            </tr>
            
            <tr>
            <td class="col1">현금영수증 </td>
            <td class="col2">
            
             <input type="radio" id="cash" name="cash" value="신청안함" checked>신청안함
             <input type="radio" id="cash" name="cash" value="현금영수증">현금영수증
             
             <div id="radio_view" style="display:none;">
             <input type="text" id="ORDER_BILL" name="ORDER_BILL" style="width:200px; height:30px; font-size:10px;" placeholder="휴대폰번호를 입력해주세요" />
             </div>
             
             </td>
             </tr>
             </table>
            
             
             <td><br><div id="order_total"></div>
             <div class="cart-total-price">
             <div class="order" id="tot"></div><div class="cart-total-price__inner" id="order_tot"></div>
             </div></td>
             
             <br>
             </form>
             <input type="button" class="register_button2" style= "margin: auto; display: block; " onclick="check()" value="결 제"/>
             
            </tbody>
            
            <!-- payment info-->
            <br><br><br><br><br>
        </div>


<script type="text/javascript">


	$(function() {

		let cart = document.querySelectorAll('.cart');
		let count = document.querySelectorAll('#ORDER_COUNT', '.cart');
		let price = document.querySelectorAll('#ORDER_PRICE', '.cart');
		let radio = document.querySelectorAll('#cash');

		let order_price = 0;
		let order_total = 0;
		let order_tot = 0;

		for (let i = 0; i < cart.length; i++) {
			order_price += (count[i].value * price[i].value);
			console.log(count[i].value);
			console.log(price[i].value);
		}

		console.log(order_price);
		$("#order_price").html(order_price + ' 원');

		order_total = order_price + 2500;
		$("#order_total").html(order_total + ' 원');

		order_tot = order_total;
		$("#order_tot").html(order_tot + ' 원 ');

		$("#tot").html('총 주문금액');

		//라디오버튼에 따른 현금영수증 활성화
		$("input[name='cash']").change(function() {
			if ($("input[name='cash']:checked").val() == '신청안함') {
				$('#radio_view').css('display', 'none');

			} else if ($("input[name='cash']:checked").val() == '현금영수증') {
				$('#radio_view').css('display', 'block');

			}

		});

		//기본적으로 작성
		$("#ORDER_NAME").val($("#ORDER_MEM").val());
		$("#ORDER_ZP").val($("#ZP").val());
		$("#ORDER_ADDR1").val($("#ADDR1").val());
		$("#ORDER_ADDR2").val($("#ADDR2").val());
		$("#ORDER_PHONE").val($("#PHONE").val());

		//배송지 불러오기 delivery
		$("input[name='delivery']").change(function() {
			if ($("input[name='delivery']:checked").val() == '직접입력') {
				$("#ORDER_NAME").val($("").val());
				$("#ORDER_ZP").val($("").val());
				$("#ORDER_ADDR1").val($("").val());
				$("#ORDER_ADDR2").val($("").val());
				$("#ORDER_PHONE").val($("").val());

			} else {
				$("#ORDER_NAME").val($("#ORDER_MEM").val());
				$("#ORDER_ZP").val($("#ZP").val());
				$("#ORDER_ADDR1").val($("#ADDR1").val());
				$("#ORDER_ADDR2").val($("#ADDR2").val());
				$("#ORDER_PHONE").val($("#PHONE").val());
			}

		});

	});
	
	
	
	
	

        //select		
		$('#ORDER_MEMO').change(function() {
			var state = $('#ORDER_MEMO option:selected').val();
			if ( state == '부재시 문 앞에 놓아주세요' ) {
				$("#area").val('부재시 문 앞에 놓아주세요');
			} else if (state == '경비실에 맡겨주세요'){
				$("#area").val('경비실에 맡겨주세요');
			} else if (state == '배송 전 미리 연락주세요'){
				$("#area").val('배송 전 미리 연락주세요');
			} else if (state == '부재시 문자나 전화 주세요'){
				$("#area").val('부재시 문자나 전화 주세요');
			} else if (state == '직접입력'){
				$("#area").val('');
			} else if (state == '배송 입력사항(선택)'){
				$("#area").val('');
			}
		});
		
		
        
        function send(){
        	$("#orderForm").submit();
        }
  

 
</script>

<script>
	function check() {
		var ORDER_NAME = document.getElementById("ORDER_NAME");
		var ORDER_ADDR1 = document.getElementById("ORDER_ADDR1");
		var ORDER_ADDR2 = document.getElementById("ORDER_ADDR2");
		var ORDER_PHONE = document.getElementById("ORDER_PHONE");
		var ORDER_ZP = document.getElementById("ORDER_ZP");	
		var ORDER_HOLDER = document.getElementById("ORDER_HOLDER");

	
		
		if(ORDER_NAME.value.trim() == "" || ORDER_NAME.value.trim()==null){
			alert("받으실분을 입력해주세요.");
			ORDER_NAME.focus();
			return false;
		}

		
		if(ORDER_ADDR1.value.trim() == "" || ORDER_ADDR1.value.trim()==null){
			alert("주소를 입력해주세요.");
			ORDER_ADDR1.focus();
			return false;
		}
		
		if(ORDER_ADDR2.value.trim() == "" || ORDER_ADDR2.value.trim()==null){
			alert("상세 주소를 입력해주세요.");
			ORDER_ADDR2.focus();
			return false;
		}
		
		if(ORDER_PHONE.value.trim() == "" || ORDER_PHONE.value.trim()==null) {
			alert("전화번호를 입력해주세요.");
			ORDER_PHONE.focus();
			return false;
		}
		
		if(ORDER_ZP.value.trim() == "" || ORDER_ZP.value.trim()==null){
			alert("우편번호를 입력해주세요.");
			ORDER_ZP.focus();
			return false;
		}
		
		
		if(ORDER_HOLDER.value.trim() == "" || ORDER_HOLDER.value.trim()==null){
			alert("입금자명을 입력해주세요.");
			ORDER_HOLDER.focus();
			return false;
		}

	
		$("#orderForm").submit();
	}
</script>


</body>
</html>
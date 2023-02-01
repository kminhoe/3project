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
 
 <!-- product in cart-->
        <div class="container">
            <div class="row">
                <h1 class="order_title"><br>주문완료</h1>
                <div class="jb-division-line2"></div>
            </div>
            <br>
            
            <div style="width: 80%; margin: 0 auto; text-align: center; font-size:17px; position:relative;">
          [주문번호 : ${ORDER_ID}]        주문이 완료되었습니다<br><br><br>
            </div>
            
            <div style="width: 80%; margin: 0 auto;">
            <table>
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
                    <tr><th colspan="2" style="font-size: 22px;">주문내용<br></th></tr>
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
                        <c:when test="${list[i].PRICE == '1'}">
                        <td>    
                        200g                  
                        </td>
                        </c:when>
                        
                        <c:otherwise>
                        <td>
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
                        
                        ${list[i].ORDER_PRICE} 원</td>
                        
                        
                        <!-- 수량 * 금액 -->
                         <td colspan=2>
                        <input type="hidden" id="ORDER_TOT" name="orderBeanList[${i}].ORDER_TOT" value="${list[i].PRICE * list[i].ORDER_COUNT}"  >
                        ${list[i].ORDER_TOT} 원</td>
                        
                       
                        <!-- div 끝 -->
                        </div>
                        </c:forEach>
                        <tr>
                        </c:when>
                        </c:choose>
                </tbody>
            </table> 
            </div>
            <br><br><br><br>
            
            
            <br><br><br><br>


   </body>




</html>
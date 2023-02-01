<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@include file="/WEB-INF/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .container_detail {
  display: flex;
  align-items: left;
  justify-content: left;
}

.img_detail {
  max-width: 30%;
  max-height:30%;
  margin-left: 1%;
  margin-right: 1%;
}

.text_detail {
  font-size: 20px;
  padding-left: 1px;
}

.img_place {
  display: block;
  margin-left: auto;
  margin-right: auto;
  max-width: 100%;
  height: auto;
}

.img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 1%;
  width: 50%;
}

.center {
  text-align: center;
  margin: auto;
  width: 100%;
  padding: 10px;
}
  </style>
</head>
<body>
<div class="product_section layout_padding">
            <div class="col-md-12">
               <h1 class="product_taital"><img class="img" style="border-radius:50%; width:10%" src="resources/img/${map.SELL_PROF}"><br><br>${map.SELL_NAME}</h1>
            </div>
            <div align="center">
                <div class="container">
                         <div class="center" class="row">
                         <div class="register_center">
                         	<p align="center">${map.SELL_CONT }</p>
                          </div>
                          <div>
                          <div>
                          <div class="img_place">
                          	<c:set var="items" value="${fn:split(map.SELL_IMAGE,',')}"/>
						<c:forEach var="i" begin="1" end="${fn:length(items)}">
							<img class="img" src="resources/img/${fn:split(map.SELL_IMAGE,',')[i-1]}"
								><br>
						</c:forEach>
						</div>
                          </div>
                          </div>
                          <div>
                         <div class="container_detail">
     						 <div class="img_detail">
       							 <img class="img" style="width:10%" src="resources/images/location-icon-map-png--1.png">
      						</div>
     						 <div class="text_detail">
        						<h1>주소</h1><br>
        						<h2>${map.SELL_ADDR1 }</h2>
        						<h2>${map.SELL_ADDR2 }</h2>
        						<h2>${map.SELL_ZP }</h2>
     						 </div>
     						 <div class="img_detail">
       							 <img class="img" style="width:10%" src="resources/images/instaicon.png">
      						</div>
     						 <div class="text_detail">
        						<h1><a href="http://instagram.com/${map.SELL_SNS}">@${map.SELL_SNS}</a></h1><br>
        						<p></p>
     						 </div>
   						 </div>
   						 <div class="register_center">
                         <div class="container_detail">
     						 
   						 </div>
   						 </div>
   			
                    </div>
              </div>
            </div>
      </div>
</body>
</html>
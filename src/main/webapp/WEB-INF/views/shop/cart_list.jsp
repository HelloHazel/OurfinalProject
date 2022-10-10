<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.table {
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
top: 50px;
}
</style>
<script type="text/javascript">
$(function() {
	$("#btnList").click(function(){
		//상품 목록으로 이동
		location.href="${path}/shop/product/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			//장바구니 전체 삭제
			location.href="${path}/shop/cart/deleteAll.do";
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<div class="text-center">
<h2 class="cart">Cart</h2>
<br>
<c:choose>
	<c:when test="${map.count == 0}">
		장바구니가 비었습니다.
	</c:when>
	<c:otherwise>
		<form name="form1" method="post"
		action="${path}/shop/cart/update.do">
		<table class="table">
		<thead>
			<tr style="font-weight:bold;">
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		 <c:forEach var="row" items="${map.list}">
		 	<tr>
		 		<td>${row.product_name}</td>
		 		<td>${row.price}</td>
		 		<td><input type="number" name="amount"
		 			value="${row.amount}">
		 			<input type="hidden" name="cart_no"
		 				value="${row.cart_no}"></td>
		 		<td>${row.money}</td>
		 		<td>
		 <c:if test="${sessionScope.userid != null}">
		 	<a href="${path}/shop/cart/delete.do?cart_no=${row.cart_no}">
		 	[삭제]</a>
		 	</c:if>
		 		</td>
		 		</tr>
		 		</c:forEach>
		 	<tr>
		 		<td colspan="5" align="right" style="font-weight:bold;">
		 			장바구니 금액 합계 : ${map.sumMoney}<br>
		 			배송료 : ${map.fee}<br>
		 			총합계 : ${map.sum}
		 		</td>
		 	</tr>	
		</table>
			<button id="btnUpdate" class="btn btn-outline-warning btn-sm">수정</button>
			<button type="button" id="btnDelete" class="btn btn-outline-warning btn-sm">장바구니 비우기</button>
			<button type="button" id="btnList" class="btn btn-outline-warning btn-sm">상품 목록</button>
			<button type="button" id="btnOrder" class="btn btn-outline-warning btn-sm" onclick="location.href='${path}/shipping/orderList.do' ">상품 주문</button>
		</form>
	</c:otherwise>
</c:choose>
<br>
</body>
</html>
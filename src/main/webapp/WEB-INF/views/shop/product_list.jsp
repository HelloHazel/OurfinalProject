<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product_list</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<h2>상품 목록</h2>
<table border="1" style="width: 100%";>
<tr>
<th>상품분류</th>
<th>상품코드</th>
<th>상품이미지</th>
<th>상품명</th>
<th>가격</th>
</tr>
<c:forEach var="row" items="${list}">
	<!-- 관리자에게 편집 버튼 표시 -->
<tr>
	<td>${row.product_kind}</td>
	<td>${row.product_id}</td>
	<td><img src="${path}/resources/images/${row.product_url}"
		width="100px" height="100px"></td>
		<td><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a>
		<c:if test="${sessionScope.userid=='admin'}">
		<br> 
		<a href="${path}/shop/product/edit/${row.product_id}">[편집]</a>		
		</c:if>
		</td>
		<td><fmt:formatNumber value="${row.price}"
					pattern="#,###"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>
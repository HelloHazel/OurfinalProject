<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<h2 style="text-align: center;">OrderList</h2>
	&nbsp;
<div class="container mt-3">
	<table class="table table-bordered" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">userid</th>
      <th scope="col">image</th>
      <th scope="col">order-id</th>
	  <th scope="col">price</th>
	  <th scope="col">수량</th>
	  <th scope="col">요청사항</th>
	  <th scope="col">배송상태</th>
    </tr>
  </thead>
  <tbody>
<c:forEach items="${list }" var="row">
    <tr class="dataRow">
    <td>${row.userid}</td>
	<td><img src="${path}/resources/images/${dto.product_url}" width="125px" height="150px"></td>
     <td>${row.order_id}</td>
	<td><fmt:formatNumber value="${row.price}" pattern="#,###원"/></td>
	<td>${row.amount}개</td>
	<td>${row.alert}</td>
	<td>${row.order_status}</td>
    </tr>
 </c:forEach>  
</tbody>
</table>
</div>
</body>
</html>
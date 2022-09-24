<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product_detail</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품 상세 정보</h2>
<table>
	<tr>
		<td><img src="{path}/images/${dto.picture_url}"
				width="300px" height="300px"></td>
				<td align="center">
				<table>
					<tr>
						<td>상품명</td>
						<td>${dto.product_name}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>${dto.price}</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>${dto.description}</td>		
					</tr>
				
				
				</table>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product_edit</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
//상품수정
function product_update(){
	
	
}


</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상품 정보 수정</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table>
  <tr>
  <td>상품명</td>
  <td><input name="product_name" id="product_name" value="$dto.product_name"></td>
  </tr>
  <tr>
  <td>가격</td>
  <td><input name="price" id="price" value="${dto.price}"></td>
  </tr>
  <tr>
  <td>상품설명</td>
  <td>
  <textarea rows="7" cols="70" name="product_desc" id="product_desc">${product_desc}</textarea>
  </td>
  </tr>
  <tr>
  	<td>상품이미지</td>
  	<td>
  	<img srd="${path}/images/${dto.product_url}" width="300px" height="300px"> <br>
  	<input type="file" name="file1" id="file1">
  	</td>
  	</tr>
  <tr>
  	<td colspan="2" align="center">
  	<!-- 수정, 삭제에 필요한 상품코드 값을 hidden 태그로 넘김 -->
  	<input type="hidden" name="product_id" value="${dto.product_id}">
  	<input type="button" value="수정" onclick="product_update()">
  	<input type="button" value="삭제" onclick="product_delete()">
  	<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'">
  	</td>
</tr>
</table>
</form>
</body>
</html>
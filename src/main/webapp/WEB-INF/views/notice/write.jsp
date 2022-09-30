<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.gongji {
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
top: 40px;
}
*{
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
}
</style>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<h2 class="gongji">Write</h2>
<form class="gongji" id="form1" name="form1" method="post" action="insert.do">
	<div class="mb-3" style="width:800px;">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" size="10" value="${dto.title}" placeholder="제목을 입력하세요">
</div>
<div class="mb-3" style="width:800px;">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
</div>
	<div style="width:700px; text-align:center;">
		<input type="submit" class="btn btn-outline-warning btn-sm" value="확인">
		
	</div>
	</form>
</body>
</html>

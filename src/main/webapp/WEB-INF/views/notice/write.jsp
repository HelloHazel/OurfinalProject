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
#gongji {
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
<form name="form1" method="post" action="insert.do">
	<div class="mb-3" style="width:800px;" id="gongji">
  <input type="text" style="text-align: center;" class="form-control" id="title" name="title" size="10" value="${dto.title}" placeholder="제목을 입력하세요">
</div>
<div class="mb-3" style="width:800px;" id="gongji">
  <textarea style="text-align: center;" class="form-control" id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
</div>
	<div style="width:700px; text-align:center;" class="gongji">
		<input type="submit" class="btn btn-outline-warning btn-sm" value="확인">
		
	</div>
	</form>
</body>
</html>

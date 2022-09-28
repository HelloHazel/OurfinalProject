<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<h2>글쓰기</h2>
<form id="form1" name="form1" method="post" action="insert.do">
	<div>제목 <input name="title" id="title" size="80" placeholder="제목을 입력하세요"></div>

	<div style="width:800px;">
		내용 <textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요"></textarea></div>
	
	<div style="width:700px; text-align:center;">
		<input type="submit" value="확인">
	</div>
	</form>
</body>
</html>

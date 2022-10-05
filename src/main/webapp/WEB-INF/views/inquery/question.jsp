<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="container">
	<h2 style="text-align: center;">질문하기</h2>
	&nbsp;
	<form method="post" action="question.do">
		<div class="form-group">
			<label>제목</label>
			<input name="title" required="required" class="form-control">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea rows="5" name="content" class="form-control"></textarea>
		</div>
		<input type="submit" class="btn btn-outline-warning btn-sm" value="등록">
		<input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/inquery/list.do'">
	</form>
</div>
</body>
</html>
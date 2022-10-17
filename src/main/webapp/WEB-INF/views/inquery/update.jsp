<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="container">
	<h2 style="text-align: center;">수정하기</h2>
	&nbsp;
	<form method="post" action="update.do">
	<input name="no" value="${ dto.no}" type="hidden">
		<div class="form-group">
			<label>번호</label>
			<input name="no" required="required" class="form-control" value="${dto.no }">
		</div>
		<div class="form-group">
			<label>제목</label>
			<input name="title" required="required" class="form-control" value="${dto.title }">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea rows="5" name="content" class="form-control">${dto.content }</textarea>
		</div>
		<input type="submit" class="btn btn-outline-warning btn-sm" value="수정">
		<input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/inquery/list.do'">
	</form>
</div>
</body>
</html>
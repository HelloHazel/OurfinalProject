<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변하기</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
	<h2>답변하기</h2>
	<form method="post" action="answer.do">
	<input name="no" value="${ dto.no}" type="hidden">
	<input name="refNo" value="${ dto.refNo}" type="hidden">
	<input name="ordNo" value="${ dto.ordNo}" type="hidden">
	<input name="levelNo" value="${ dto.levNo}" type="hidden">
		<div class="form-group">
			<label>제목</label>
			<input name="title" required="required" class="form-control" value="[답변]${dto.title }">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea rows="5" name="content" class="form-control">


------------------- 질문내용 -------------------
${dto.content }
			</textarea>
		</div>
		<input type="submit" class="btn btn-outline-warning btn-sm" value="등록">
		<input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/inquery/list.do'">
	</form>
</div>
</body>
</html>
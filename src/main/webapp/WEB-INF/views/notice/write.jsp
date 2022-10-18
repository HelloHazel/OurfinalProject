<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="container">
<h2 style="text-align: center;">Notice write</h2>
&nbsp;
<form method="post" action="write.do">
<div class="form-group">
	<label>title</label>
	<input name="title" id="title" class="form-control">
</div>
<div class="form-group">
	<label>content</label>
	<textarea name="content" id="content" class="form-control" rows="7"></textarea>
</div>
 <c:if test="${sessionScope.userid == 'admin' }">
 <div style="text-align: center;">
<input type="submit" class="btn btn-outline-warning btn-sm" value="등록">
<input type="reset" class="btn btn-outline-warning btn-sm" value="새로입력">
 <input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/notice/list.do'">
</div>
</c:if>
</form>
</div>
</body>
</html>
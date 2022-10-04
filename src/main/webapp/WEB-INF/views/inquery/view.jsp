<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#deleteBtn").click(function(){
		return confirm("정말 삭제하시겠습니까?");
	});
});
</script>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>질문&amp;답변보기</h2>
	<div class="list-group">
		<div class="list-group-item row">
			<div class="col-md-3">번호</div>
			<div class="col-md-9">${dto.no}</div>
		</div>
		<div class="list-group-item row">
			<div class="col-md-3">제목</div>
			<div class="col-md-9">${dto.title}</div>
		</div>
		<div class="list-group-item row">
			<div class="col-md-3">내용</div>
			<div class="col-md-9">${dto.content}</div>
		</div>
		<div class="list-group-item row">
			<div class="col-md-3">작성자</div>
			<div class="col-md-9">${dto.userid}</div>
		</div>
		<div class="list-group-item row">
			<div class="col-md-3">작성일</div>
			<div class="col-md-9"><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></div>
		</div>
		<div class="list-group-item row">
			<div class="col-md-3">조회수</div>
			<div class="col-md-9">${dto.hit}</div>
		</div>
	</div>
	<input type="button" class="btn btn-default" value="답변" onclick="location.href='${path}/inquery/answer.do?no=${dto.no}'">
	<input type="button" class="btn btn-default" value="수정" onclick="location.href='${path}/inquery/update.do?no=${dto.no}'">
	<input type="button" class="btn btn-default" id="deleteBtn" value="삭제" onclick="location.href='${path}/inquery/delete.do?no=${dto.no}'">
	<input type="button" class="btn btn-default" value="목록" onclick="location.href='${path}/inquery/list.do'">
</body>
</html>
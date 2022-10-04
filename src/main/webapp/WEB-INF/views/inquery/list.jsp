<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		location = "view.do?no="+no + "&inc=1"
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
<h2>1:1문의 게시판 리스트</h2>
<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr class="dataRow">
			<td class="no">${dto.no }</td>
			<td>
				<c:forEach begin="1" end="${dto.levNo * 3}">&nbsp;</c:forEach>
				<c:if test="${dto.levNo > 0}">
				▶
				</c:if>
				${dto.title }
			</td>
			<td>${dto.userid}</td>
			<td><fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd"/></td>
			<td>${dto.hit }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
				<input type="button" class="btn btn-default" value="질문하기" onclick="location.href='${path}/inquery/question.do'">
		</td>
	</tr>
</table>
</div>
</body>
</html>
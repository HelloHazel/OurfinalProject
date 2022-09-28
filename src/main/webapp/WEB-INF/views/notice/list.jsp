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
<h2>게시판</h2>
<input type="button" value="글쓰기" onclick="location.href='${path}/notice/write.do'">
${map.count}개의 게시물이 있습니다.
<table border="1">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>이름</th>
	<th>내용</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
<c:forEach var="row" items="${map.list}">
<tr>
	<td>${row.bno}</td>
	<td><a href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a></td>
	<td>${row.name}</td>
	<td>${row.content}</td>
	<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	<td>${row.viewcnt}</td>
</tr>
</c:forEach>
</table>
</body>
</html>
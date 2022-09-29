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
<h2>공지사항</h2>
<!-- 검색폼 -->
<form name="form1" method="post"
	action="${path}/board/list.do">
	<select name="search_option">
		<option value="name"
<c:if test="${map.search_option == 'name'}">
selected</c:if>	>이름</option>
		<option value="title" 
<c:if test="${map.search_option == 'title'}">
selected</c:if>	>제목</option>
		<option value="content" 
<c:if test="${map.search_option == 'content'}">
selected</c:if>	>내용</option>
		<option value="all" 
<c:if test="${map.search_option == 'all'}">
selected</c:if>	>이름+내용+제목</option>
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
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
<c:choose>
 <c:when test="${row.pin == '1'}">
<tr>
	<td style="font-weight: bold;">${row.bno}</td>
	<td><a style="font-weight: bold;" href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a>     
    </td>
	<td style="font-weight: bold;">${row.name}</td>
	<td style="font-weight: bold;">${row.content}</td>
	<td style="font-weight: bold;"><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></td>
	<td style="font-weight: bold;">${row.viewcnt}</td>
</tr>
  </c:when>
<c:otherwise>
<tr>
	<td>${row.bno}</td>
	<td><a href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a>     
    </td>
	<td>${row.name}</td>
	<td>${row.content}</td>
	<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></td>
	<td>${row.viewcnt}</td>
</tr>
</c:otherwise>
 </c:choose>
 </c:forEach>  
</table>
<input type="button" value="글쓰기" onclick="location.href='${path}/notice/write.do'">
</body>
</html>
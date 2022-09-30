<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.gongji {
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
top: 40px;
}
.table {
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
top: 40px;
}
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
<br>
<h2 class="gongji">Notice</h2>
<%-- <!-- 검색폼 -->
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
</form> --%>
<div class="gongji">${map.count}개의 게시물이 있습니다.</div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">name</th>
      <th scope="col">writer</th>
	  <th scope="col">date</th>
	  <th scope="col">cnt</th>
    </tr>
  </thead>
  <tbody>
<c:forEach var="row" items="${map.list}">
<c:choose>
 <c:when test="${row.pin == '1'}">
    <tr>
      <td>${row.bno}</td>
	<td><a href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a></td>
	<td>${row.name}</td>
	<td>${row.content}</td>
	<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></td>
	<td>${row.viewcnt}</td>
    </tr>
	</c:when>
	<c:otherwise>
    <tr>
     <td>${row.bno}</td>
	<td><a href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a></td>
	<td>${row.name}</td>
	<td>${row.content}</td>
	<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/></td>
	<td>${row.viewcnt}</td>
    </tr>
   </c:otherwise>
 </c:choose>
 </c:forEach>  
  </tbody>
</table>
 <c:if test="${sessionScope.userid == 'admin' }">
 <input type="button" id="gongji" class="btn btn-outline-warning btn-sm" value="글쓰기" onclick="location.href='${path}/notice/write.do'">
</c:if>
</body>
</html>
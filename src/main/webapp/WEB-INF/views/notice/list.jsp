<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
.write {
	text-align: right;
	position: relative;
	right:200px;
}

</style>
<script type="text/javascript">
$(function(){
	$(".dataRow").click(function(){
		var no = $(this).find(".no").text();
		location="view.do?no="+no
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<h2 style="text-align: center;">Notice</h2>
	&nbsp;
<c:if test="${sessionScope.userid == 'admin' }">
 <div class="write">
 <input type="button" class="btn btn-outline-warning btn-sm" value="글쓰기" onclick="location.href='${path}/notice/write.do'">
</div>
</c:if>
<div class="container">
	<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
	  <th scope="col">date</th>
	  <th scope="col">cnt</th>
    </tr>
  </thead>
  <tbody>
<c:forEach items="${map.list }" var="row">
<c:choose>
 <c:when test="${row.pin == '1'}">
    <tr class="dataRow">
     <td class="no">${row.no}</td>
	<td>
	<i class="material-icons">notifications</i>
	${row.title }</td>
	<td>${row.userid}</td>
	<td><fmt:formatDate value="${row.writeDate}" pattern="yyyy-MM-dd"/></td>
	<td>${row.hit}</td>
    </tr>
	</c:when>
	<c:otherwise>
    <tr class="dataRow">
     <td class="no">${row.no}</td>
	<td>${row.title }</td>
	<td>${row.userid}</td>
	<td><fmt:formatDate value="${row.writeDate}" pattern="yyyy-MM-dd"/></td>
	<td>${row.hit}</td>
    </tr>
   </c:otherwise>
 </c:choose>
 </c:forEach>  
  </tbody>
</table>
	<!-- 검색폼 -->
	<form name="form1" method="post" action="${path}/notice/list.do" style="text-align: right;">
		<select name="search_option" style="width: 100px;">
			<option value="userid"
				<c:if test="${map.search_option == 'userid'}">selected</c:if>>이름</option>
			<option value="title"
				<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
			<option value="content"
				<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
			<option value="all"
				<c:if test="${map.search_option == 'all'}">selected</c:if>>이름+제목+내용</option>
		</select> 
		<input name="keyword" value="${map.keyword}">		
		<input type="submit" class="btn btn-outline-warning btn-sm" value="조회">
	</form>
</div>
</body>
</html>
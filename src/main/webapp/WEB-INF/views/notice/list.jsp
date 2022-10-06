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
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
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
<div class="container">
<h2 style="text-align: center;">Notice</h2>
&nbsp;
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
<c:forEach items="${list }" var="dto">
<c:choose>
 <c:when test="${dto.pin == '1'}">
    <tr class="dataRow">
     <td class="no">${dto.no}</td>
	<td>
	<i class="material-icons">notifications</i>
	${dto.title }</td>
	<td>${dto.userid}</td>
	<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>
	<td>${dto.hit}</td>
    </tr>
	</c:when>
	<c:otherwise>
    <tr class="dataRow">
     <td class="no">${dto.no}</td>
	<td>${dto.title }</td>
	<td>${dto.userid}</td>
	<td><fmt:formatDate value="${dto.writeDate}" pattern="yyyy-MM-dd"/></td>
	<td>${dto.hit}</td>
    </tr>
   </c:otherwise>
 </c:choose>
 </c:forEach>  
  </tbody>
</table>
 <c:if test="${sessionScope.userid == 'admin' }">
 <div style="text-align: center;">
 <input type="button" class="btn btn-outline-warning btn-sm" value="글쓰기" onclick="location.href='${path}/notice/write.do'">
</div>
</c:if>
</div>
</body>
</html>
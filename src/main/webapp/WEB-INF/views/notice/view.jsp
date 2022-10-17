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
<script type="text/javascript">
$(function() {
	$("#deleteBtn").click(function(){
		return confirm("정말 삭제하시겠습니까?");
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="container">
<h2 style="text-align: center;">Notice view</h2>
&nbsp;
<table class="table">
    <tr>
     	 <th scope="col">#</th>
    	  <td>${dto.no }</td>
    </tr>
    <tr>
     	 <th scope="col">title</th>
     	 <td>${dto.title }</td>
    </tr>
    <tr>
	      <th scope="col">content</th>
	      <td>${dto.content }</td>
    </tr>
    <tr>
	      <th scope="col">writer</th>
	      <td>${dto.userid }</td>
    </tr>
    <tr>
	      <th scope="col">date</th>
	      <td><fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd" /></td>
    </tr>
    <tr>
	      <th scope="col">cnt</th>
	      <td>${dto.hit }</td>
    </tr>
</table>
 <c:if test="${sessionScope.userid == 'admin' }">
 <div style="text-align: center;">
<input type="button" class="btn btn-outline-warning btn-sm" value="수정" onclick="location.href='${path}/notice/update.do?no=${dto.no}'">
<input type="button" class="btn btn-outline-warning btn-sm" id="deleteBtn" value="삭제" onclick="location.href='${path}/notice/delete.do?no=${dto.no}'">
 <input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/notice/list.do'">
</div>
</c:if>
</div>
</body>
</html>
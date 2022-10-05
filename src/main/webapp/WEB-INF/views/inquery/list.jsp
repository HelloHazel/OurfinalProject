<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 게시판</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="container">
<h2 style="text-align: center;">1:1문의</h2>
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
    <tr class="dataRow">
      <td class="no">${dto.no }</td>
			<td>
				<c:forEach begin="1" end="${dto.levNo * 3}">&nbsp;</c:forEach>
				<c:if test="${dto.levNo > 0}">
				<i class="material-icons">subdirectory_arrow_right</i>
				</c:if>
				${dto.title }
			</td>
			<td>${dto.userid}</td>
			<td><fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd"/></td>
			<td>${dto.hit }</td>
		</tr>
	</c:forEach>
  </tbody>
</table>
 <c:if test="${sessionScope.userid != null}">
 <div style="text-align: center;">
<input type="button" class="btn btn-outline-warning btn-sm" value="질문하기" onclick="location.href='${path}/inquery/question.do'">
</div>
</c:if>
</div>
</body>
</html>
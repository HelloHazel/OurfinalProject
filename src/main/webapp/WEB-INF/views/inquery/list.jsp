<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 게시판</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
		location = "view.do?no="+no
	});
});
function list(page){
	location.href="${path}/inquery/list.do?curPage="+page;
}
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
<c:forEach items="${map.list }" var="row">
    <tr class="dataRow">
      <td class="no">${row.no }</td>
			<td>
				<c:forEach begin="1" end="${row.levNo * 3}">&nbsp;</c:forEach>
				<c:if test="${row.levNo > 0}">
				<i class="material-icons">subdirectory_arrow_right</i>
				</c:if>
				${row.title }
			</td>
			<td>${row.userid}</td>
			<td><fmt:formatDate value="${row.writeDate }" pattern="yyyy-MM-dd"/></td>
			<td>${row.hit }</td>
		</tr>
	</c:forEach>
  <!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
 <c:if test="${sessionScope.userid != null}">
 <div style="text-align: center;">
<input type="button" class="btn btn-outline-warning btn-sm" value="질문하기" onclick="location.href='${path}/inquery/question.do'">
</div>
</c:if>
</div>
</body>
</html>
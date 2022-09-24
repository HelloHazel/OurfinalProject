<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/notice/write.do";
	});
});
function list(page){
	location.href="${path}/notice/list.do?curPage="+page;
} 

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시판</h2>
<button type="button" id="btnWrite">글쓰기</button>
${map.count}개의 게시물이 있습니다.
<table>
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
			<td>${row.notice_bno}</td>
			<td><a href="${path}/notice/view.do?bno=${row.notice_bno}">${row.notice_title}</a></td>
			<td>${row.notice_name}</td>
			<td>${row.notice_content}</td>
			<td><fmt:formatDate value="${row.notice_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${row.notice_viewcnt}</td>
		</tr>
	
	</c:forEach>
</table>
</body>
</html>
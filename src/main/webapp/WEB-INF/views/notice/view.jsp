<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function btnReply(){
	var form = document.form2;
	if(form.replytext != null) {
		alert("댓글을 입력했습니다.");
		form.action="${path}/reply/insert.do";
		form.submit();
	}
}

function btnDelete() {
	var form = document.form1;
	if(confirm("삭제하시겠습니까?")){
		form.action="${path}/notice/delete.do";
		form.submit();
	}
}

function btnUpdate() {
	var form = document.form1;
		form.action="${path}/notice/update.do";
		form.submit();
}

</script>
<style type="text/css">
.gongji {
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
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<h2 class="gongji">View</h2>
<form id="form1" name="form1" method="post">
<div class="gongji">
<div class="mb-3" style="width:800px;">
  <label for="exampleFormControlInput1" class="form-label">제목</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" size="10" value="${dto.title}" placeholder="제목을 입력하세요">
</div>
<div>조회수 : ${dto.viewcnt}</div>
<div class="mb-3" style="width:800px;">
  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
</div>
	<div style="width:700px; text-align:center;">
<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
		<input type="hidden" name="bno" value="${dto.bno}">
		
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == 'admin'}">
			<input type="button" class="btn btn-outline-warning btn-sm" value="수정" onclick="btnUpdate()">
			<input type="button" class="btn btn-outline-warning btn-sm" value="삭제" onclick="btnDelete()">
		</c:if>
		
		<input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/notice/list.do'">
	</div>
	</div>
</form>
<%-- <!-- 댓글 작성 -->
<form id="form2" name="form2" method="post">
<div style="width:700px; text-align:center;">
	 <c:if test="${sessionScope.userid == 'admin' }">
	 	<textarea rows="5" cols="80" id="replytext" name="replytext" placeholder="댓글을 작성하세요"></textarea>
	 	<br>
	 	<input type="button" value="댓글쓰기" onclick="btnReply()">
	 </c:if>
</div>
</form>
<!-- 댓글 목록 -->
<table style="width:700px" border="1">
<!-- fn: header.jsp의 jstl -->
<c:forEach var="row" items="${list}">   
<tr>
		<td>
			${row.replyer}
			( <fmt:formatDate value="${row.regdate}"
				 pattern="yyyy-MM-dd a HH:mm:ss" /> )<br>
				 ${row.replytext}
		</td>
	</tr>
</c:forEach>	
</table> --%>
</body>
</html>
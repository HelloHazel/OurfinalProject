<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
*{
margin-left: auto;
margin-right: auto;
margin-top: auto;
text-align: center;
}
</style>
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
<style>
.fileDrop {
width: 600px;
height: 100px;
border: 1px dotted gray;
background-color: gray;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>상세보기</h2>
<form id="form1" name="form1" method="post">
<div>제목 <input name="title" id="title" size="80"
				value="${dto.title}"
				placeholder="제목을 입력하세요">
</div>
<div>조회수 : ${dto.viewcnt}	</div>
<div style="width:800px;">
	내용 <textarea id="content" name="content"
rows="3" cols="80" 
placeholder="내용을 입력하세요">${dto.content}</textarea>
	</div>
	<div style="width:700px; text-align:center;">
<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
		<input type="hidden" name="bno" value="${dto.bno}">
		
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == 'admin'}">
			<input type="button" value="수정" onclick="btnUpdate()">
			<input type="button" value="삭제" onclick="btnDelete()">
		</c:if>
		
		<input type="button" value="목록" onclick="location.href='${path}/notice/list.do'">
	</div>
</form>
<!-- 댓글 작성 -->
<div style="width:700px; text-align:center;">
	 <c:if test="${sessionScope.userid == 'admin' }">
	 <form id="form2" name="form2" method="post">
	 	<textarea rows="5" cols="80" name="replytext" id="replytext" placeholder="댓글을 작성하세요"></textarea>
	 	<br>
	 	<input type="button" value="댓글쓰기" onclick="btnReply()">
	 	</form>
	</c:if>
</div>
<!-- 댓글 목록 -->
<div id="listReply"></div>
</body>
</html>
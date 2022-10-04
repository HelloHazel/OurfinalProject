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
#gongji {
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
<form id="form1" name="form1" method="post" class="gongji">
<div class="mb-3" style="width:800px;" id="gongji">
  <input type="text" style="text-align: center;" class="form-control" id="exampleFormControlInput1" name="title" size="10" value="${dto.title}" placeholder="제목을 입력하세요">
</div>
<%-- <div>조회수 : ${dto.viewcnt}</div> --%>
<div class="mb-3" style="width:800px;" id="gongji">
  <textarea style="text-align: center;" class="form-control" id="exampleFormControlTextarea1" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
</div>
	<div style="width:700px; text-align:center; position: relative; left: 400px;">
<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
		<input type="hidden" name="bno" value="${dto.bno}" class="gongji">
		
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == 'admin'}">
			<input type="button" class="btn btn-outline-warning btn-sm" value="수정" onclick="btnUpdate()">
			<input type="button" class="btn btn-outline-warning btn-sm" value="삭제" onclick="btnDelete()">
		</c:if>
		<input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/notice/list.do'">
	</div>
</form>
</body>
</html>
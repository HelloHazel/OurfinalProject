<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function faq_delete() { 
	if(confirm("삭제하시겠습니까?")){
	 	document.form1.action="${path}/faq/delete.do";
		document.form1.submit();
	} 
}
</script>




<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>

<br>
<div class="container">
<br>
<h2 style="text-align: center;">FAQ detail</h2>
<br>
<form name="form1" id="form1" method="post" enctype="multipart/form-data">
	<table class="table">
	    <tr>
	     	 <th scope="col">#</th>
	    	  <td>${dto.faq_no}</td>
	    </tr>
	    <tr>
	     	 <th scope="col">title</th>
	     	 <td>${dto.faq_title}</td>
	    </tr>
	    <tr>
		      <th scope="col">content</th>
		      <td>${dto.faq_content}</td>
	    </tr>
	    <tr>
		      <th scope="col">writer</th>
		      <td>${dto.userid}</td>
	    </tr>
	    
	</table>
	
	 <div style="text-align: center;">
	 	<input type="hidden" name="faq_no" value="${dto.faq_no}">
		<button type="button" class="btn btn-sm btn-outline-secondary" id="btnUpdate" onclick="location.href='${path}/faq/edit/${dto.faq_no}'">수정</button>
		<button type="button" class="btn btn-sm btn-outline-secondary" id="btnDelete" onclick="faq_delete()">삭제</button>
		<button type="button" class="btn btn-sm btn-outline-secondary" id="btnList" onclick="location.href='${path}/faq/list.do'">목록</button>
	</div>
</form>
</div>
</body>
</html>
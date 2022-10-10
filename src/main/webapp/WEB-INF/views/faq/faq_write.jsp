<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<style type="text/css">

.ck-editor__editable { 
	height: 400px; 
}

</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>

<!-- ckeditor의 라이브러리 -->
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>


<br>
<div class="container">
<h2 style="text-align: center;">FAQ write</h2>
<br> 
<form method="post" action="${path}/faq/create.do" enctype="multipart/form-data">
<div class="form-group">
	<label>title</label>
	<input name="faq_title" id="faq_title" class="form-control">
</div>
<div class="form-group">
	<label>content</label>
	<textarea name="faq_content" id="faq_content" class="form-control" rows="7" ></textarea>
	<script>
		ClassicEditor
			 .create( document.querySelector( '#faq_content' ))
			 .then( editor => {
			     window.ckeditor = editor ;
		 } )
			 .catch( error => {
			     console.error( error );
		 } );
	</script>
</div>
 <c:if test="${sessionScope.userid == 'admin' }">
 <br>
 <div style="text-align: center;">
<input type="submit" class="btn btn-outline-warning btn-sm" value="등록">
<input type="reset" class="btn btn-outline-warning btn-sm" value="새로입력">
 <input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/faq/list.do'">
</div>
</c:if>
</form>
</div>


</body>
</html>
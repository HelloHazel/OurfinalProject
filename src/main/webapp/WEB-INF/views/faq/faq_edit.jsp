<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

.ck-editor__editable { 
	height: 400px; 
}

</style>

<script type="text/javascript">

//post 수정
function faq_update(){
    //태그를 name으로 조회할 경우(계층구조로 접근)
	//var product_name=document.form1.product_name.value;
	//태그를 id로 조회할 경우
	var faq_title=$("#faq_title").val();
	var faq_content=$("#faq_content").val();
	if(faq_title==""){//빈값이면
		//문자열 비교 : java는 a.equals(b), javascript는 a==b
		alert("제목을 입력하세요");
		$("#faq_title").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	if(faq_content==""){
		alert("내용을 입력하세요");
		$("#faq_content").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	document.form1.action="${path}/faq/update.do";
	document.form1.submit();
}


</script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>


<!-- ckeditor의 라이브러리 -->
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>


<br>
<div class="container">
	<br>
	<h2 style="text-align: center;">FAQ Edit</h2>
	<br> 
	<form name="form1" id="form1" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label>title</label>
				<input name="faq_title" id="faq_title" class="form-control" value="${dto.faq_title}">
		</div>
		<div class="form-group">
			<label>content</label>
				<textarea name="faq_content" id="faq_content" class="form-control" rows="7" >${dto.faq_content}</textarea>
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
				<input type=hidden name="faq_no" value="${dto.faq_no}">
				<button type="button" class="btn btn-outline-warning btn-sm" id="btnUpdate" onclick="faq_update()">수정</button>
				<button type="button" class="btn btn-outline-warning btn-sm" id="btnList" onclick="location.href='${path}/faq/list.do'">목록</button>
			</div>
		</c:if>
	</form>
</div>

</body>
</html>
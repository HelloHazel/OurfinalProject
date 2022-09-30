<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<%@ include file="../include/header.jsp"%>

<!-- ckeditor의 라이브러리 -->
<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>

<style>
	body {
		background-color: white;
	}
	
	.form-control {
		border: none;
	}
	
	#title {
		font-size: 30px;
	}
	
	input::placeholder {
		color: grey;
		font-size: 30px;
		font-weight: bold;
	}
	
	textarea::placeholder {
		color: grey;
	}
	
	.ck-editor__editable { 
		height: 400px; 
		
	}
	
</style>


</head>
<body>
<%@ include file="../include/menu.jsp"%>
	<main>
		<article>
			<div class="py-5 text-center container" role="main">
				<form name="form1" id="form1" role="form" method="post"
					action="${path}/community/insert.do" enctype="multipart/form-data">
		
					<div class="mb-3">
						<input type="text" class="form-control" name="comm_title" id="comm_title"
							placeholder="제목" >
					</div>
					<div>
						<hr>
					</div>
					<div class="mb-3">
												
						<div>
							<textarea class="form-control" rows="5" name="comm_content" id="comm_content" placeholder="오늘의 댕댕이를 자랑해주세요~!"  "></textarea>
						</div>
						
						<script>
							ClassicEditor
								 .create( document.querySelector( '#comm_content' ))
								 .then( editor => {
								     window.ckeditor = editor ;
							 } )
								 .catch( error => {
								     console.error( error );
							 } );
						</script>
						  
						
					</div>
					
					<div>
						<input type="file" id="file1" name="file1">					
					</div>
					
					
					<div class="mb-3">
						<input type="hidden" class="form-control" name="userid" id="userid" value="${sessionScope.userid}">
					</div>
					
					<div>
						<button type="submit" class="btn btn-sm btn-outline-secondary" id="btnSave">등록</button>
						<button type="button" class="btn btn-sm btn-outline-secondary" id="btnList" onclick="location.href='${path}/community/list.do'">목록</button>
					</div>
					
				</form>
			</div>
		</article>
	</main>
</body>
</html>
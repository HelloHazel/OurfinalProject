<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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



<script type="text/javascript">

//post 수정
function post_update(){
    //태그를 name으로 조회할 경우(계층구조로 접근)
	//var product_name=document.form1.product_name.value;
	//태그를 id로 조회할 경우
	var comm_title=$("#comm_title").val();
	var comm_content=$("#comm_content").val();
	var comm_url=$("#comm_url").val();
	if(comm_title==""){//빈값이면
		//문자열 비교 : java는 a.equals(b), javascript는 a==b
		alert("제목을 입력하세요");
		$("#comm_title").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	if(comm_content==""){
		alert("내용을 입력하세요");
		$("#comm_content").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	document.form1.action="${path}/community/update.do";
	document.form1.submit();
}


//post 삭제
function post_delete() { 
	if(confirm("삭제하시겠습니까?")){
	 	document.form1.action="${path}/community/delete.do";
		document.form1.submit();
	} 
}
</script>

</head>
<body>
<%@ include file="../include/menu.jsp"%>
	<main>
		<article>
			<div class="py-5 text-center container" role="main">
				<form name="form1" id="form1" method="post" enctype="multipart/form-data">
		
					<div class="mb-3">
						<input type="text" class="form-control" name="comm_title" id="comm_title"
						value="${dto.comm_title}">
					</div>
					<div>
						<hr>
					</div>
					<div class="mb-3">
												
						<div>
							<textarea class="form-control" rows="5" name="comm_content" id="comm_content">${dto.comm_content}</textarea>
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
						<img src="${path}/images/community/${dto.comm_url}" width="300px" height="300px"> <br>
						<input type="file" name="file1" id="file1">			
					</div>
					
					
					<div class="mb-3">
						<input type="hidden" class="form-control" name="userid" id="userid" value="${sessionScope.userid}">
					</div>
					<div class="mb-3">
						<input type="hidden" class="form-control" name="comm_no" id="comm_no" value="${dto.comm_no}">
					</div>
					
					<div>
						<button type="button" class="btn btn-sm btn-outline-secondary" id="btnUpdate" onclick="post_update()">수정</button>
						<button type="button" class="btn btn-sm btn-outline-secondary" id="btnDelete" onclick="post_delete()">삭제</button>
						<button type="button" class="btn btn-sm btn-outline-secondary" id="btnList" onclick="location.href='${path}/community/list.do'">목록</button>
					</div>
					
				</form>
			</div>
		</article>
	</main>
</body>
</html>
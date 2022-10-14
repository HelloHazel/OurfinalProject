<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<style type="text/css">
#writerText {
	font-weight: bold;
	float: left;
	margin-right: 15px;
}

#contentText {
	float: left;
}

#cmtBox{
	width: 100%;
    height: 65px;
    padding: 0 25px;
    display: flex;
    justify-content: space-between;
}
#cmt_content {
	width: 90%;
    background-color: white;
    margin: auto 0;
    padding:10px;
    color: gray ;
    border: gray;
    border-radius: 3px;
}
#cmt_content::placeholder {
    color: #8e8e8e;
}

#btnComment{
	float:right;
	color: #0095f6;
    background-color: #fff;
    border-style: none;
    height: 40px;
    width: 10%;
    padding: 10px;
    font-size: 14px;
    font-weight: 600;
}
#btnComment:disabled {
    color: #B9DFFC;
}

</style>


<script>
	$(function() { //자동으로 실행되는 코드
		//댓글 목록 출력
		listComment();
		
		//댓글 쓰기
		$("#btnComment").click(function() {
			var cmt_content = $("#cmt_content").val(); //댓글 내용
			var comm_no = "${dto.comm_no}"; //게시물 번호
			var param = {
				"cmt_content" : cmt_content,
				"comm_no" : comm_no
			};
			
			//listComment();
			//var param="cmt_content="+cmt_content+"&comm_no="+comm_no;
			$.ajax({
				type : "post",
				url : "${path}/commCmt/insert.do",
				data : param,
				success : function() {
					alert("댓글이 등록되었습니다.");
					listComment();
				}
			});
		});
	});

	//댓글 목록 출력 함수
	function listComment() {
		$.ajax({
			type : "get",
			url : "${path}/commCmt/list.do?comm_no=${dto.comm_no}",
			success : function(result) {
				//result : responseText 응답텍스트(html)
				$("#listComment").html(result);
			}
		});
	}

	//타임스탬프값(숫자형)을 문자열 형식으로 변환
	function changeDate(date) {
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year + "-" + month + "-" + day + " " + hour + ":" + minute
				+ ":" + second;
		return strDate;
	}
</script>



</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<main>
		<section class="py-5 text-center container">
			<div class="row py-lg-1">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h2 class="fw-light">${dto.comm_title}</h2>
				</div>
			</div>
		</section>

		
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1">

					<div class="col">
						<div class="card shadow-sm">
							<img class="bd-placeholder-img card-img-top img-fluid"
								width="100%" height="100%"
								src="${path}/resources/images/community/${dto.comm_url}">
							<div class="card-body">

							<p class="card-text" id="writerText">${dto.writer}</p>
							<p class="card-text" id="contentText">${dto.comm_content}</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<c:if test="${sessionScope.userid == dto.writer || sessionScope.userid == 'admin' }">
											<button type="button" class="btn btn-sm btn-outline-secondary"
												onclick="location.href='${path}/community/list.do'">View</button>
											<button type="button"
												class="btn btn-sm btn-outline-secondary"
												onclick="location.href='${path}/community/edit/${dto.comm_no}'">Edit</button>
										</c:if>
									</div>
									<small class="text-muted">${dto.comm_regdate}</small>
								</div>

								<!-- 댓글 목록 -->
								<div id="listComment"></div>
								<hr>

								<!-- 댓글 작성 -->
								<c:if test="${sessionScope.userid != null }">
									<input type="text" id="cmt_content" name="cmt_content"
										placeholder="댓글 달기...">
									<button type="button" id="btnComment">게시</button>
								</c:if>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		


	</main>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="UTF-8">
<title>Product_detail</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	//리뷰 목록 출력
	listReview();
	
	//리뷰 쓰기
	$("#btnReview").click(function(){
		var review_content=$("#review_content").val(); //리뷰 내용
		var product_id="${dto.product_id}";//상품 번호
		var param={"review_content": review_content, "product_id": product_id};
		$.ajax({
			type: "post",
			url: "${path}/review/insert.do",
			data: param,
			success: function() {
				alert("리뷰가 작성되었습니다.");
				listReview();//리뷰 목록 출력
			}
		});
	});
});
//리뷰 목록 출력 함수
function listReview(){
		$.ajax({
			type: "get",
			url: "${path}/review/list.do?product_id=${dto.product_id}",
			success: function(result) {
				//result : responseText 응답텍스트(html)
			$("#listReview").html(result);
			}
		});
}
//타임스탬프값(숫자형)을 문자열 형식으로 변환
function changeDate(date){
	date = new Date(parseInt(date));
	year=date.getFullYear();
	month=date.getMonth();
	day=date.getDate();
	hour=date.getHours();
	minute=date.getMinutes();
	second=date.getSeconds();
	strDate =
		year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}
</script>
<style type="text/css">
.table {
margin-left: auto;
margin-right: auto;
margin-top: auto;
}
</style>
 <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles2.css" rel="stylesheet" />
</head>
<body>
<%@ include file="../include/menu.jsp" %>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${path}/resources/images/${dto.product_url}"
                     width="500px" height="550px" /></div>
                    <div class="col-md-6">
                        <h5 class="fw-bolder">${dto.product_id}  |  ${dto.product_kind}</h5> <br>
                        <h1 class="display-5 fw-bolder">${dto.product_name}</h1>
                        <div class="fs-4 mb-4">
							<fmt:formatNumber value="${dto.price}"
					pattern="#,###원"/>
                        </div>
                        <h6>${dto.product_desc}</h6><br><br>
                        <div class="d-flex">
                        <form name="form1" method="post"
							action="${path}/shop/cart/insert.do">
							<input type="hidden" name="product_id"
							value="${dto.product_id}">
							<select name="amount">
							<!-- 상품 개수 선택 (1~15개) -->
							<c:forEach begin="1" end="15" var="i">
							<option value="${i}"  class="form-control text-center me-3">${i}</option>
							</c:forEach>
							</select>
						<input type="submit" value="Add to cart" class="btn btn-outline-warning btn-sm">						
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 리뷰 작성 -->
        <div style="width:700px; text-align:center;" class="table">
        	<c:if test="${sessionScope.userid != null }">
        		<textarea rows="5" cols="100" id="review_content"
        				placeholder="댓글을 작성하세요"></textarea>
        				<br>
        				<button type="button" class="btn btn-outline-warning btn-sm" id="btnReview">리뷰 쓰기</button>
        				<br>
        				</c:if>    
        <!-- 리뷰 목록 -->
		<div id="listReview"></div> 
        </div>
        <br>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="..resources/js/scripts2.js"></script>
</body>
</html>
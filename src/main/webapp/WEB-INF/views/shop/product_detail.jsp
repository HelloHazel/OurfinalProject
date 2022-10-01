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
 <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles2.css" rel="stylesheet" />
</head>
<body>
<%@ include file="../include/menu.jsp" %>
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="${path}/resources/images/${dto.product_url}"
                     width="600px" height="630px" /></div>
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
						<input type="submit" value="Add to cart" class="btn btn-outline-dark flex-shrink-0">						
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
               <!-- Footer-->
        <footer class="py-5 bg-grey">
            <div class="container"><p class="m-0 text-center text-white">&nbsp</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="..resources/js/scripts2.js"></script>
</body>
</html>
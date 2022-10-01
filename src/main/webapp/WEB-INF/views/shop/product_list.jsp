<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Product_list</title>
  <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
         <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/assets/css/styles.css" rel="stylesheet" />
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<div class="text-center">
<h2>Product</h2>
<table style="width: 100%";>
<c:set var="i" value="0" /> 
<c:set var="j" value="3" /> 
<c:forEach items="${list}" var="row">     
<c:if test="{i%j == 0}">      
<tr>    
 </c:if>
<td>
<div class="container px-4 px-lg-5 mt-5">
<img src="${path}/resources/images/${row.product_url}"
		width="250px" height="300px"><br><br>

		<h6><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a></h6>
		<c:if test="${sessionScope.userid=='admin'}">
		<h6><a href="${path}/shop/product/edit/${row.product_id}">[편집]</a></h6>
		</c:if>
		<h5 class="fw-bolder"><fmt:formatNumber value="${row.price}"
					pattern="#,###원"/></h5>
					  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <a class="btn btn-outline-warning mt-auto" 
                                href="${path}/shop/product/detail/${row.product_id}">View More</a>
                                </div>
		</td>
		<td>
		</td>
		<td>
		</div>
		</td>   
 <c:if test="${i%j == j-1}"> 
 </tr>    
</c:if>    
<c:set var="i" value="${i+1}" />    
</c:forEach>     
</table>
</div>
<div class="container"><p class="m-0 text-center text-white">오독오독</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/assets/js/scripts.js"></script>
</body>
</html>
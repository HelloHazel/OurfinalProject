<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/js/common.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
                
      
    </style>
    

</head>
<body>
<%@ include file="../include/menu.jsp" %>

<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">Album example</h1>
        <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
        
        <c:choose>
           <c:when test="${sessionScope.userid == null}">
           	<!-- 로그인하지 않은 상태 -->
           	<p>
	          <button type="button" onclick="location.href='${path}/member/login.do'" class="btn btn-primary my-1">로그인</button>
	        </p>
           </c:when>
           <c:otherwise>
           <!-- 로그인한 상태 -->
	        <p>
	          <button type="button" onclick="location.href='${path}/community/write.do'" class="btn btn-primary my-1">글쓰기</button>
	        </p>
	       </c:otherwise>
        </c:choose>
        
      </div>
    </div>
  </section>
<c:forEach var="row" items="${list}">
 <form id="form1" name="form1" method="post" action="${path}/community/list.do">
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">   
        <div class="col">
          <div class="card shadow-sm">
            <svg  class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></svg>
            <div class="card-body">
              <p class="card-text">${row.comm_content}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">${comm_regdate}</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </form>
</c:forEach>
</main>

<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
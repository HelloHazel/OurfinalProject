<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@ include file="../include/header.jsp"%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    
    <title>Sidebars · Bootstrap v5.2</title>
	 	 <script src="${path}/include/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendors/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sidebars/">
	
   

    


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


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

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 0.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }


.nav > .nav-item > .nav-link {
  background-color: #FFE08C;
}
 
</style>

<!-- Custom styles for this template -->
<link href="sidebars.css" rel="stylesheet">
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="bi bi-cart4" viewBox="0 0 16 16">
  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="bi bi-question-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="bi bi-postcard" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4Zm7.5.5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7ZM2 5.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5ZM10.5 5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3ZM13 8h-2V6h2v2Z"/>
</svg>
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="bi bi-card-text" viewBox="0 0 16 16">
  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
</svg>

<section>
	<div class="bg-holder overlay overlay-light" style="background-color: #FFE08C; background-size: cover;"></div>

	<div class="container">
		<div class="row">
			<div class="col-3">
				<main class="d-flex flex-nowrap">
				  <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-light" style="width: 280px;">
				   
      				<span class="fs-4"><a href="${pageContext.request.contextPath}/mypage/mypagemain.do" class="nav-link active" aria-current="page">마이 페이지</a></span>
    
				    <hr>
				    <ul class="nav nav-pills flex-column mb-auto">
				      <li>
				        <a href="${pageContext.request.contextPath}/mypage/mypagemain.do" class="nav-link text-dark">
				          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#bi bi-cart4"/></svg>
				          나의 구매내역
				        </a>
				      </li>
				      <li>
				        <a href="${path}/inquery/question.do" class="nav-link text-dark">
				          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#bi bi-question-circle"/></svg>
				         문의하기
				        </a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/mypage/myquery.do" class="nav-link text-dark">
				          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#bi bi-exclamation-circle"/></svg>
				          나의 문의내역
				        </a>
				      </li>
				      <li class="nav-item">
				        <a href="${pageContext.request.contextPath}/mypage/myCmmList.do" class="nav-link active" aria-current="page">
				          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#bi bi-postcard""/></svg>
				          나의 게시글
				        </a>
				      </li>
				      <li>
				        <a href="${pageContext.request.contextPath}/mypage/myreview.do" class="nav-link text-dark">
				          <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#bi bi-card-text"/></svg>
				          나의 리뷰
				        </a>
				      </li>
				    </ul>
				    <hr>
				    <div class="dropdown">
				      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
				        <strong>회원정보</strong>
				      </a>
				      <ul class="dropdown-menu dropdown-menu text-small shadow">
				        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/myinfo.do?userid=${sessionScope.userid}">회원정보 확인/수정</a></li>
				      </ul>
				    </div>
				  </div>
				 
				 <div class="b-example-divider b-example-vr"></div> 
				
						
				</main>
			</div>
			<div class="col-9 text-bg-light">
				<h2 style="text-align: center;">나의 게시글</h2>
					 <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<c:forEach var="row" items="${map.list}">   
				        <div class="col">
				          <div class="card shadow-sm">
				            <a href="${path}/community/view.do?comm_no=${row.comm_no}"><img  class="bd-placeholder-img card-img-top" src="${path}/resources/images/community/${row.comm_url}" width="100%" height="225"></a>
				            <div class="card-body">
				              <p class="card-text" id="writerText"><a href="${path}/community/view.do?comm_no=${row.comm_no}">${row.writer}</a></p>
				              <p class="card-text" id="titleText"><a href="${path}/community/view.do?comm_no=${row.comm_no}">${row.comm_title}</a></p>
				              
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/view.do?comm_no=${row.comm_no}'">👀 ${row.comm_viewcnt}</button>
				                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/view.do?comm_no=${row.comm_no}'">💬</button>
				                </div>
				                <small class="text-muted">${row.comm_regdate}</small>
				              </div>
				            </div>
				          </div>
				        </div>
			      	    </c:forEach>
			          </div> 	
					      
			</div>
		</div>		
	</div>

</section>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="sidebars.js"></script>
</body>
</html>
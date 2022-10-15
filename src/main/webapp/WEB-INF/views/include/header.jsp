<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <script src="${path}/include/jquery-3.6.0.min.js"></script> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
	
	<style>
		.navbar-expand-lg{
			background: #FFE08C !important;
		}
		.navbar{
			background: #FFE08C !important; 
		}
	</style>
</head>
<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->


	<main class="main" id="top" >
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-1 d-block" style="background-color: #FFE08C; background-size: cover; position : fixed;
			top: 0; left: 0; right: 0;"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="${path}/"><img
					class="d-inline-block"
					src="${pageContext.request.contextPath}/resources/assets/img/gallery/logo.png"
					alt="logo" /><span class="text-1000 fs-0 fw-bold ms-2">오독오독</span></a>
				<button class="navbar-toggler collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<c:choose>
				<c:when test="${sessionScope.userid == null || sessionScope.userid != 'admin'}">
				<!-- 메뉴 부분 -->
				<div
					class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
					id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item px-2"><a
							class="nav-link fw-medium active" aria-current="page"
							href="${path}/notice/list.do">Notice</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/shop/product/list.do">Product</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/community/list.do">Community</a></li>
						<li class ="nav-item dropdown px-2">
							<a class="nav-link fw-medium dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Q&A</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
								<a class="dropdown-item" href="${path}/inquery/list.do">1:1 문의</a>
								<a class="dropdown-item" href="${path}/faq/list.do">FAQ</a>
							</ul>
						</li>
						
					</ul>
					<form class="d-flex">



						<!-- 우측 아이콘 메뉴 -->
						<!-- contact/Q&A 아이콘 -->
					

						<!-- 장바구니 아이콘 -->
						<a class="text-1000" href="${path}/shop/cart/list.do"> <svg
								class="feather feather-shopping-cart me-3 mt-4"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="9" cy="21" r="1"></circle>
                  <circle cx="20" cy="21" r="1"></circle>
                  <path
									d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg></a>


						<!-- 마이페이지 아이콘 -->
						<a class="text-1000"
							href="${pageContext.request.contextPath}/mypage/mypagemain.do">
							<svg class="feather feather-user me-3 mt-4"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
						</a>

						<!-- 로그인/회원가입 (추후 디자인 수정 예정) -->
						<c:choose>
							<c:when
								test="${sessionScope.userid == null}">
								<!-- 로그인하지 않은 상태 -->
								<a class="btn btn-lg btn-success btn-block mt-3"
									href="${pageContext.request.contextPath}/member/login.do">로그인</a>
								<a class="btn btn-lg btn-secondary btn-block mt-3"
									href="${pageContext.request.contextPath}/member/join.do">회원가입</a>
							</c:when>
							<c:otherwise>
								<!-- 로그인한 상태 -->
			 				<label class="mt-4">${sessionScope.name}님이 로그인 중입니다 | </label>
			 				<a class=" mt-4" href="${path}/member/logout.do">&nbsp;로그아웃</a>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				</c:when>
				<c:when test="${sessionScope.userid == 'admin'}">
				<div
					class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
					id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item px-2"><a
							class="nav-link fw-medium active" aria-current="page"
							href="${path}/notice/list.do">공지사항</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/community/list.do">커뮤니티</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/admin/list.do">회원관리</a></li>
							<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/admin/write.do">상품등록</a></li>
							<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/shop/product/list.do">상품목록</a></li>
							<li class="nav-item px-2"><a class="nav-link fw-medium"
							href="${path}/admin/list.do">주문관리</a></li>
							<li class ="nav-item dropdown px-2">
							<a class="nav-link fw-medium dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Q&A</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
								<a class="dropdown-item" href="${path}/inquery/list.do">1:1 문의</a>
								<a class="dropdown-item" href="${path}/faq/list.do">FAQ</a>
							</ul>
						</li>
					</ul>
					<form class="d-flex">
					</form>
					</div>
				
				<c:choose>
							<c:when
								test="${sessionScope.userid == null}">
								<!-- 로그인하지 않은 상태 -->
								<a class="btn btn-lg btn-success btn-block mt-3"
									href="${pageContext.request.contextPath}/member/login.do">로그인</a>
								<a class="btn btn-lg btn-secondary btn-block mt-3"
									href="${pageContext.request.contextPath}/member/join.do">회원가입</a>
							</c:when>
							<c:otherwise>
								<!-- 로그인한 상태 -->
			 				<label class="mt-4">${sessionScope.name}님이 로그인 중입니다 | </label>
			 				<a class=" mt-4" href="${path}/member/logout.do">&nbsp;로그아웃</a>
							</c:otherwise>
						</c:choose>
				</c:when>
				</c:choose>
			</div>
		</nav>
</main>
</body>
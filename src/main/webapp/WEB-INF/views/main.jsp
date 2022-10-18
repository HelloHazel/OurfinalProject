<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>   
<%@page import="java.sql.PreparedStatement" %> 
<%@page import= "java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오독오독 | 반려견을 위한 모든것!</title>
<%
	response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1")) {
	response.setHeader("Cache-Control", "no-cache");
}
%>
<%@ include file="./include/header.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
</head>
<body>
	<section
		class="py-10 bg-light-gradient border-bottom border-white border-5">
		<div class="bg-holder overlay overlay-light"
			style="background-color: #FFE08C; background-size: cover;"></div>
		<!--/.bg-holder-->
		<div class="container">
			<div class="row flex-center">
				<div class="col-11 mb-10">
					<div class="d-flex align-items-center flex-column">
						<img class="d-inline-block"
							style="display: block; margin: 0px auto;"
							src="${pageContext.request.contextPath}/resources/assets/img/gallery/logo3.png"
							alt="logo" />
						<h1 class="fw-normal">사랑스러운 내 반려견을 위한 모든 것</h1>
						<h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">오독오독</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ============================================-->
	<!-- <section> begin ============================-->
	<section class="py-0" id="header"
		style="margin-top: -23rem !important;">

		<div class="container">
			<div class="row g-0">
				<div class="col-md-6">
					<div class="card card-span h-100 text-white">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/assets/img/gallery/dog3.png"
							width="790" alt="..." />
						<div class="card-img-overlay d-flex flex-center">
							<a class="btn btn-lg btn-light"
								style="color: white; background-color: rgba(0, 0, 128, 0.1); backdrop-filter: blur(10px); box-shadow: 2px 7px 15px 8px rgba(0, 0, 0, 0.3);"
								href="${path}/shop/product/list.do">product</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-span h-100 text-white">
						<img class="img-fluid"
							src="${pageContext.request.contextPath}/resources/assets/img/gallery/dog2.png"
							width="790" alt="..." />
						<div class="card-img-overlay d-flex flex-center ">
							<a class="btn btn-lg btn-light"
								style="color: white; background-color: rgba(0, 0, 128, 0.1); backdrop-filter: blur(10px); box-shadow: 2px 7px 15px 8px rgba(0, 0, 0, 0.3);"
								href="${path}/community/list.do">Community </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->




	<!-- ============================================-->
	<!-- <section> begin ============================-->
	<section class="py-0">

		<div class="container">
			<div class="row h-90">
				<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
					<h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Best Deals</h5>
				</div>
				<div class="col-12">
					<div class="carousel slide" id="carouselBestDeals"
						data-bs-touch="false" data-bs-interval="false">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="10000">
								<div class="row h-100 align-items-center g-2">
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/1.jpg" alt="천연 피부 진정 허니 샴푸" />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">천연 피부 진정 허니
													샴푸</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">30,000원</span><span
														class="text-primary">26,500원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/1"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/2.jpg" alt="무독성 물림 방지 장난감 공" />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">무독성 물림 방지
													장난감 공</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">12.000원</span><span
														class="text-primary">9,770원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/2"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/3.jpg"
												alt="라텍스 러프(15.2cm) 장난감" />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">라텍스
													러프(15.2cm) 장난감</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">7,500원</span><span
														class="text-primary">5,860원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/3"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/4.jpg" alt="퀼트 강아지 패드 XL, 20팩" />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">퀼트 강아지 패드
													XL, 20팩</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">22,000원</span><span
														class="text-primary">18,070원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/4"></a>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<div class="row h-100 align-items-center g-2">
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/9.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">상품1</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">$200</span><span
														class="text-primary">$175</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/9"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/10.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">상품2</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">$200</span><span
														class="text-primary">$175</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/10"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/11.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">상품3</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">$200</span><span
														class="text-primary">$175</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/11"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/12.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">상품4</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">$200</span><span
														class="text-primary">$175</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/12"></a>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselBestDeals" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span><span
										class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselBestDeals" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span><span
										class="visually-hidden">Next </span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 d-flex justify-content-center ">
					<a class="btn btn-lg btn-dark" href="${path}/shop/product/list.do">View
						All </a>
				</div>
			</div>
		</div>
		<!-- end of .container-->

	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->


	<!-- <베스트셀러> close ============================-->
	<!-- ============================================-->

	<section>
		<div class="container">
			<div class="row h-90 mt-8">
				<div class="col-lg-7 mx-auto text-center mb-6 ">
					<h5 class="fw-bold fs-3 fs-lg-5 lh-sm mb-3">Best Sellers</h5>
				</div>
				<div class="col-12">
					<div class="carousel slide" id="carouselBestSellers"
						data-bs-touch="false" data-bs-interval="false">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="10000">
								<div class="row h-100 align-items-center g-2">
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/5.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">펫 프렌들리 워터리스
													샴푸(210ml)</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">23,500원</span><span
														class="text-danger">21,020원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/5"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/6.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">반려동물 그루밍 해먹</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">20,000원</span><span
														class="text-danger">17,210원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/6"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/7.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">컨디셔너 코코넛
													바닐라 98.2%</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">35,000원</span><span
														class="text-danger">31,000원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/7"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/8.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">반려동물용 울타리
													4패널 화이트</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">100,000원</span><span
														class="text-danger">84,680원</span>
												</div>
											</div>
											<a class="stretched-link"
												href="${path}/shop/product/detail/8"></a>
										</div>
									</div>
								</div>
							</div>

							<div class="carousel-item">
								<div class="row h-100 align-items-center g-2">
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/13.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">미끄럼 방지 방수 패드</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">33,500원</span><span
														class="text-danger">28,060원</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/13"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/14.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">부드러운 패딩 조끼 하네스 M</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">26,000원</span><span
														class="text-danger">19,460원</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/14"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/15.jpg"
												alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">강아지용 미니 칫솔 6개 세트</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">18,000원</span><span
														class="text-danger">14,860원원</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/15"></a>
										</div>
									</div>
									<div class="col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="img-fluid h-100"
												src="${path}/resources/images/16.jpg" alt="..." />
											<div class="card-img-overlay ps-0"></div>
											<div class="card-body ps-0 bg-200">
												<h5 class="fw-bold text-1000 text-truncate">반려동물용 브라이트닝 바디 워시</h5>
												<div class="fw-bold">
													<span class="text-600 me-2 text-decoration-line-through">90,000원</span><span
														class="text-danger">80,820원</span>
												</div>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/16"></a>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselBestSellers" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span><span
										class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselBestSellers" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span><span
										class="visually-hidden">Next </span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 d-flex justify-content-center ">
					<a class="btn btn-lg btn-dark" href="${path}/shop/product/list.do">View
						All </a>
				</div>
			</div>
		</div>
	</section>
	<!-- <베스트셀러> close ============================-->
	<!-- ============================================-->



	<!-- <애견 신상품 코너>  ============================-->
	<!-- ============================================-->

	<section class="py-5 mt-0">
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-7 mx-auto text-center mb-6">
					<h5 class="fs-3 fs-lg-5 lh-sm mb-3">신상품</h5>
				</div>
				<div class="col-12">
					<div class="carousel slide" id="carouselNewArrivals"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="10000">
								<div class="row h-100 align-items-center g-2">
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="card-img h-100"
												src="${path}/resources/images/17.jpg"
												alt="..." />
											<div
												class="card-img-overlay bg-dark-gradient d-flex flex-column-reverse">
												<h6 class="text-primary">34,370원</h6>
												<p class="text-400 fs-1">무자극 소재로 만들어져 예민한 피부에도  괜찮아요!</p>
												<h4 class="text-light">디즈니 펫 미키 하네스</h4>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/17"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="card-img h-100"
												src="${path}/resources/images/18.jpg"
												alt="..." />
											<div
												class="card-img-overlay bg-dark-gradient d-flex flex-column-reverse">
												<h6 class="text-primary">$175</h6>
												<p class="text-400 fs-1">우리 강아지, 밥을 너무 빨리 먹는다면?</p>
												<h4 class="text-light">슬로우 퍼즐 그릇 소형견용(그린)</h4>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/18"></a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="card-img h-100"
												src="${path}/resources/images/19.jpg"
												alt="..." />
											<div
												class="card-img-overlay bg-dark-gradient d-flex flex-column-reverse">
												<h6 class="text-primary">$175</h6>
												<p class="text-400 fs-1">추운 겨을 산책, 안심하고 다녀와요!</p>
												<h4 class="text-light">편안한 점프수트 강아지 파자마</h4>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/19"></a>
										</div> 
									</div>
									<div class="col-sm-6 col-md-3 mb-3 mb-md-0 h-100">
										<div class="card card-span h-100 text-white">
											<img class="card-img h-100"
												src="${path}/resources/images/20.jpg"
												alt="..." />
											<div
												class="card-img-overlay bg-dark-gradient d-flex flex-column-reverse">
												<h6 class="text-primary">$175</h6>
												<p class="text-400 fs-1">노즈워크, 간편하고 쉽게 할 수 있어요!</p>
												<h4 class="text-light">퍼즐 인터랙티브 간식 장난감</h4>
											</div>
											<a class="stretched-link" href="${path}/shop/product/detail/20"></a>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="row">
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselNewArrivals" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span><span
										class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselNewArrivals" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span><span
										class="visually-hidden">Next </span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- <애견 신상품 코너> close ============================-->
	<!-- ============================================-->
	
	<!-- ============================================-->
	<!-- <section> 커뮤니티 ============================-->
	<section class="py-0 pb-0">
		<div class="col-lg-7 mx-auto text-center mt-5 mb-5">
			<h5 class="fw-bold fs-3 fs-lg-5 lh-sm">커뮤니티</h5>
		</div>
		<div class="album py-5 bg-light">
		<%
		
		class Comm{
			int commNum;
			String commTitle;
			String commContent;
			String commRegdate;
			String commUrl;
			int commView;
			String commWriter;
			int commCount;
		}
		
		ArrayList<Comm> list = new ArrayList<Comm>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String uid = "final";
		String pwd = "1234";
		String url = "jdbc:oracle:thin:@175.202.196.211:1521:XE";
		String sql = "select * from community where rownum <= 3 order by comm_no desc";
		
		%>
		
		<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, uid, pwd);
		// 쿼리를 생성gkf 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);

		// 쿼리 수행 결과의 데이터를 읽어온다.
		while (rs.next()) {
			/*System.out.println(rs.getInt("COMM_NO"));
			System.out.println(rs.getString("COMM_TITLE"));
			System.out.println(rs.getString("COMM_CONTENT"));
			System.out.println(rs.getString("COMM_REGDATE"));
			System.out.println(rs.getString("COMM_URL"));
			System.out.println(rs.getInt("COMM_VIEWCNT"));
			System.out.println(rs.getString("WRITER"));
			System.out.println(rs.getInt("CNT"));
			System.out.println();*/
			
			Comm comm = new Comm();
			comm.commNum = rs.getInt("COMM_NO");
			comm.commTitle = rs.getString("COMM_TITLE");
			comm.commContent = rs.getString("COMM_CONTENT");
			comm.commRegdate = rs.getString("COMM_REGDATE");
			comm.commUrl = rs.getString("COMM_URL");
			comm.commView = rs.getInt("COMM_VIEWCNT");
			comm.commWriter = rs.getString("WRITER");
			comm.commCount = rs.getInt("CNT");
			list.add(comm);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) {
		rs.close();
			}
			if (stmt != null) {
		stmt.close();
			}
			if (conn != null) {
		conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	%>
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
       <% for(Comm item : list) {%>
        <div class="col">
          <div class="card shadow-sm">
            <a href="${path}/community/view.do?comm_no=<%=item.commNum%>"><img  class="bd-placeholder-img card-img-top" src="${path}/resources/images/community/<%= item.commUrl %>" width="100%" height="225"></a>
            <div class="card-body">
              <p class="card-text" id="writerText"><a href="${path}/community/view.do?comm_no=<%=item.commNum%>"><%=item.commWriter%></a></p>
              <p class="card-text" id="titleText"><a href="${path}/community/view.do?comm_no=<%=item.commNum%>"><%=item.commTitle%></a></p>
              
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/view.do?comm_no=<%=item.commNum%>'">👀 <%=item.commView%></button>
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/view.do?comm_no=<%=item.commNum%>'">💬</button>
                </div>
                <small class="text-muted"><%=item.commRegdate%></small>
              </div>
            </div>
          </div>
        </div>
        <% } %>
      </div>
    </div>     
  </div>
		<!-- end of .container-->

	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->



	<!-- ============================================-->
	<!-- <section> begin ============================-->
	<section class="py-0 pt-7">

	
			

				
			</div>
			<div class="border-bottom border-3"></div>
			<div class="row flex-center my-3">
				<div class="col-md-6 order-1 order-md-0">
					<p class="my-2 text-1000 text-center text-md-start">
						Made with&nbsp;
						<svg class="bi bi-suit-heart-fill"
							xmlns="http://www.w3.org/2000/svg" width="15" height="15"
							fill="#EB6453" viewBox="0 0 16 16">
                  <path
								d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"></path>
                </svg>
						&nbsp;by&nbsp;<a class="text-800" href="https://themewagon.com/"
							target="_blank">ThemeWagon </a>
					</p>
				</div>
				
			</div>
		</div>
		<!-- end of .container-->

	</section>
	<!-- <section> close ============================-->
	<!-- ============================================-->


	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->




	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/@popperjs/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/is/is.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/feather-icons/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/theme.js"></script>

	<link
		href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800;900&amp;display=swap"
		rel="stylesheet">
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- Custom fonts for this template-->
   <link
	href="${pageContext.request.contextPath}/resources/vendors/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link
	href="${pageContext.request.contextPath}/resources/assets/css/sb-admin-2.min.css"
	rel="stylesheet">
</head>
<body>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form class="user">
                            <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="이름">
								 </div>
								  <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="아이디">     
                                 </div>                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="이메일">
                                </div>
                                 <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="전화번호">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="주소">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="상세주소">
                                    </div>
                                </div>
                                <a href="login.html" class="btn btn-warning btn-user btn-block">
                                   회원가입
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                            <a class="small" href="${path}/member/findId.do">아이디 찾기</a> |
							<a class="small" href="${path}/member/findpw.do">비밀번호 찾기</a> |
                            <a class="small" href="${path}/member/login.do">로그인</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

  <!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/sb-admin-2.min.js"></script>
</body>
</html>
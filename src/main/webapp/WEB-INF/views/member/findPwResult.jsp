<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
body {
	text-align: center;
	background-color: #ffffff;
}
h3 {
	margin-top: 10%;
}

.id {
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<fieldset>
<h3>비밀번호 찾기 검색 결과</h3>
<div class="id">
	<h5>
		회원님의 비밀번호는 <strong style="color: red;">${passwd}</strong> 입니다.
	</h5>
</div>
		<input type="button" value="로그인" class="btn btn-outline-warning" onclick="location.href='${path}/member/login.do'">
		<input type="button" value="홈으로 가기" class="btn btn-outline-warning" onclick="location.href='${path}/'"> 
</fieldset>
</body>
</html>
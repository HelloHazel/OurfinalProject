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
}
h2{
	margin-top: 10%;
}
#name, #email{
	margin-bottom: 10px;
}

#inputGroup {
	text-align: center;
	align-content: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
<h2>아이디 찾기</h2>
<p style="margin-bottom: 20px;">아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다</p>
<form action="${path}/member/find_id.do" method="post" name="form1" id="form1">
<div class="col-lg-5" id="inputGroup">
<input id="name" name="name" class="form-control" placeholder="이름을 입력해주세요" ><br> 
<input id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" ><br>
<input type="submit" value="아이디 찾기" class="btn btn-warning"> 
</div>


</form>
</body>
</html>
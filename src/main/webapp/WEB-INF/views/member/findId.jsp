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

#find {
	margin-left: 50px;
}
</style>
<script type="text/javascript">
function findId() {
	var form = document.form1;
		 if (form.name.value.length < 1) {
		 	 alert("이름을 입력해주세요");
			  return;
		 }
		
		 if (form.email.value.length < 1) {
			  alert("이메일을 입력해주세요");
			  return;
		 }
	form.action="${path}/member/find_id.do";
	form.submit();
}
</script>
</head>
<body>
<h2>아이디 찾기</h2>
<p style="margin-bottom: 20px;">아이디는 가입 시 입력하신 이메일을 통해 찾을 수 있습니다</p>
<form  method="post" name="form1" id="form1">
<div class="col-lg-4" id="inputGroup">
<input id="name" name="name" class="form-control" placeholder="이름을 입력해주세요" ><br>
<input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" ><br>
<div class="d-grid gap-2 d-md-flex" >
<input type="button" value="아이디 찾기" id="find" class="btn btn-outline-warning" onclick="findId()">
<input type="button" value="비밀번호 찾기" class="btn btn-outline-warning" onclick="location.href='${path}/member/findpw.do'">
<input type="button" value="홈으로 가기" class="btn btn-outline-warning" onclick="location.href='${path}/'"> 
</div>
</div>


</form>
</body>
</html>
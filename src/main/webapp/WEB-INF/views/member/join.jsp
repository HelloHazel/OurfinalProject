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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address1").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
    
function find_id() {
    	$.ajax({
    		url : "${path}/member/idCheck.do",
    		type:"POST",
    		dataType:"JSON",
    		data:{"userid":$("#userid").val()},
    		success: function(data) {
    			if(data == 1){
    				alert("이미 있는 아이디입니다.");
    			} else if(data == 0){
    				$("#idCheck").attr("value","Y");
    				alert("사용 가능한 아이디입니다.");
    			}
    		}
    	});
    }   

function find_email() {
	$.ajax({
		url : "${path}/member/emailCheck.do",
		type:"POST",
		dataType:"JSON",
		data:{"email":$("#email").val()},
		success: function(data) {
			if(data == 1){
				alert("이미 가입되어 있는 이메일입니다.");
			} else if(data == 0){
				$("#emailCheck").attr("value","Y");
				alert("사용 가능한 이메일입니다.");
			}
		}
	});
}   
//회원가입 버튼 클릭 시
function join() {
	var form = document.user;
	var name = $("#name").val();
	var userid = $("#userid").val(); //태그의 value 속성값
	var passwd = $("#passwd").val();
	var passwdCheck = $("#passwdCheck").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var zipcode = $("#zipcode").val();
	var address1 = $("#address1").val();
	var address2 = $("#address2").val();
	var idCheck = $("#idCheck").val();
	var emailCheck = $("#emailCheck").val();
	
	var exp1 = /^[A-Za-z0-9]{4,10}$/; //아이디 영문자, 숫자 포함 4~10자리
	var exp2 = /(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*\d){6,12}/; //비밀번호 영문자, 특수문자 포함 6~12자리
	var exp3 = /^[가-힣]+$/; //한글 유효성검사
	var exp4 = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; //이메일 정규식
	
	if (name == "") {
		alert("이름을 입력하세요.");
		$("#name").focus();
		return;
	}else if(!exp3.test(name)){
		alert("이름은 한글로 입력해주세요");
		$("#name").focus();
		return;
	}
	if (userid == "") {
		alert("아이디를 입력하세요.");
		$("#userid").focus(); //입력 포커스 이동
		return; //함수 종료
	}else if(!exp1.test(userid)){
		alert("아이디는 영문, 숫자를 사용한 4~10자리로 입력");
		$("#userid").focus();
		return;
	}
	if(idCheck == "N"){
		alert("아이디 중복 체크를 하세요.");
		return;
	}
	if (passwd == "") {
		alert("비밀번호를 입력하세요.");
		$("#passwd").focus();
		return;
	}else if(!exp2.test(passwd)){
		alert("비밀번호는 영문자, 숫자, 특수기호(!@#$%^*+=-)를 모두 사용하여 6~12자리로 입력하세요");
		$("#passwd").focus();
		return;
	}
	if (passwdCheck == "") {
		alert("비밀번호확인을 입력하세요.");
		$("#passwdCheck").focus();
		return;
	}
	if(passwd != passwdCheck){
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
	if (email == "") {
		alert("이메일을 입력하세요.");
		$("#email").focus();
		return;
	}else if(!exp4.test(email)){
		alert("이메일을 제대로 입력해주세요");
		$("#email").focus();
		return;
	}
	if(emailCheck == "N"){
		alert("이메일 중복 체크를 하세요.");
		return;
	}		
	form.action = "${path}/member/write.do";
	form.submit();
}
</script>
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
                                <p style="color: red;">* 표시는 필수 입력사항입니다</p>
                            </div>
                            <form class="user" name="user"  id="user"> 
                            <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="name" name="name"
                                            placeholder="* 이름">
								 </div>
                                 <div class="form-group row">
                                    <div class="col-sm-8 mb-3 mb-sm-0">
                                         <input type="text" class="form-control form-control-user" id="userid" name="userid"
                                            placeholder="* 아이디">  
                                    </div>
                                    <div class="col-sm-4">
                                       <button type="button" class="btn btn-warning btn-user btn-block" onclick="find_id();" id="idCheck"  value="N">아이디 중복 체크</button>
                                    </div>
                                </div>                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user" name="passwd"
                                            id="passwd" placeholder="* 비밀번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user" name="passwdCheck"
                                            id="passwdCheck" placeholder="* 비밀번호 확인">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-8 mb-3 mb-sm-0">
                                           <input type="email" class="form-control form-control-user" id="email" name="email"
                                        placeholder="* 이메일">  
                                    </div>
                                    <div class="col-sm-4">
                                       <button type="button" class="btn btn-warning btn-user btn-block" onclick="find_email();" id="emailCheck"  value="N">이메일 중복 체크</button>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" id="phone" name="phone"
                                        placeholder="전화번호는 - 포함해서 입력해주세요">
                                </div>
                                <div class="form-group row">
                                <div class="col-sm-8 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="zipcode" name="zipcode" readonly
                                        placeholder="우편번호">
                                </div>
                                 <div class="col-sm-4">
                                    <input type="button"  class="btn btn-warning btn-user btn-block" onclick="daumZipCode()" value="우편번호 찾기">
                                </div>
                                </div>
                                 <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                            id="address1" name="address1" placeholder="주소">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user"
                                            id="address2" name="address2"  placeholder="상세주소">
                                    </div>
                                <button class="btn btn-warning btn-user btn-block" type="button" onclick="join()">
                                   회원가입
                                </button>
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
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
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	 
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

    </style>

    
    <!-- Custom styles for this template -->
    <link href="sidebars.css" rel="stylesheet">
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
    
    $(function(){
    	$("#btnUpdate").click(function(){
    		document.form1.action="${path}/member/update.do";
    		document.form1.submit();
    	});
    	$("#btnDelete").click(function(){
    		if(confirm("삭제하시겠습니까?")){
    			document.form1.action="${path}/member/delete.do";
    			document.form1.submit();
    		}
    	});
    });
    </script> 
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
				      <li class="nav-item">
				        <a href="${pageContext.request.contextPath}/mypage/mypagemain.do"class="nav-link text-dark">
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
				      <li>
				        <a href="${pageContext.request.contextPath}/mypage/myCmmList.do" class="nav-link text-dark">
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
				        <!-- <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2"> -->
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
				<div class="orderInfo">
				<div class="Info" >
					<h2 style="text-align: center;">회원정보 확인/수정</h2>
					<br>
				</div>
					<div class="form-horizontal">
					 <form class="user" name="form1" method="post">
						<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputReceiver" class="control-label" id="label">아이디</label>
							</div>
							<div class="col-sm-7">
								<input class="form-control" id="userid" name="userid"
									value="${dto.userid}"><br>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputTel" class="control-label" id="label">비밀번호</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="passwd" name="passwd"><br>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputMessage" class="control-label" id="label" >이름</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name"  name="name" value="${dto.name}"><br>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputMessage" class="control-label" id="label" >전화번호</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone"  name="phone" value="${dto.phone}"><br>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputMessage" class="control-label" id="label" >이메일</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email"  name="email" value="${dto.email}"><br>
							</div>
						</div>
						<div>
							<div class="form-group row">
								<div class="col-sm-2">
									<label for="inputZipcode" class="control-label" id="label">우편번호</label>
								</div>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="zipcode"
										name="zipcode" value="${dto.zipcode}" readonly>&nbsp;
								</div>
								<div class="col-sm-3">
									<input type="button" class="btn btn-outline-warning btn-sm"
										 onclick="daumZipCode()" value="우편번호 찾기">
								</div>
							</div>
							<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputAddress1" class="control-label" id="label">주소</label>
							</div>
							<div class="col-sm-7">
								<input class="form-control" type="text" id="address1" name="address1" value="${dto.address1}"> <br>
							</div>
							</div>
							<div class="form-group row">
							<div class="col-sm-2">
								<label for="inputAddress2" class="control-label" id="label">상세주소</label>
							</div>
							<div class="col-sm-7">
								<input class="form-control" type="text" id="address2" name="address2" value="${dto.address2}" placeholder="상세주소"> <br>
							</div>
							</div>
						</div>
						<div>
							<button class="btn btn-warning btn-user btn-block" type="button" id="btnUpdate" style="margin:5px">
		                                   수정
		                    </button>
		                    <button class="btn btn-warning btn-user btn-block" type="button" id="btnDelete" style="margin:5px">
		                                   삭제
		                    </button>
			
						</div>                          
				 </form>
				</div>
			</div>
		</div>		
	 </div>
	</div>
</section>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="sidebars.js"></script>     
</body>
</html>
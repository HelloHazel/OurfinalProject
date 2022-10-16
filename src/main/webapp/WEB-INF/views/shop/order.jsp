<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<title>주문</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
body {
	background-color: #ffffff;
}

.orderInfo, #payment {
	margin: 10px auto;
	background-color: #ffffff;
	width: 60%;
	height: auto;
}

#form1 {
	padding: 0px auto;
}

#label {
	padding-top: 7px;
}

.Info {
	padding-top: 100px;
}
</style>
<script type="text/javascript">
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

function pay() {
	var receiver = $("#receiver").val();
	var address1 = $("#address1").val();
	var address2 = $("#address2").val();
	var phone = $("#phone").val();
	
	const data = {
			name : $("#product_name").val(),
			amount : $("#price").val(),
			phone : phone,
			totalPrice : $("#price").val(),
			address : address1 + address2,
			email : $("#email").val(),
			receiver : $("#receiver").val(),
			zipcode : $("#zipcode").val(),
			order_id : $("#order_id").val()
	}
	
	if(receiver == ""){
		alert("수령인을 입력하세요.");
		$("#receiver").focus(); //입력 포커스 이동
		return; //함수 종료
	}
	if(address1 == ""){
		alert("주소를 입력하세요.");
		$("#address1").focus(); //입력 포커스 이동
		return; //함수 종료
	}
	if(address2 == ""){
		alert("상세주소를 입력하세요.");
		$("#address2").focus(); //입력 포커스 이동
		return; //함수 종료
	}
	if(phone == ""){
		alert("전화번호를 입력하세요.");
		$("#phone").focus(); //입력 포커스 이동
		return; //함수 종료
	}
	paymentCard(data);
}

//카드 결제
function paymentCard(data) {	
	IMP.init("imp82881631"); 
		
	IMP.request_pay({ // param
		pg: "html5_inicis",
	  	pay_method: "card",
	  	merchant_uid: data.order_id,
	  	name: data.name,
	  	amount: data.totalPrice,
	   	buyer_email: data.email,
	   	buyer_name: data.receiver,
	  	buyer_tel: data.phone,
	  	buyer_addr: data.adress,
	  	buyer_postcode: data.zipcode,
  	}, 
	function (rsp) { // callback
		if (rsp.success) {
         // 결제 성공 시 로직,
	        data.impUid = rsp.imp_uid;
	        data.merchant_uid = rsp.merchant_uid;
	        paymentComplete(data);
		} else {
			 alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		}
	});
}

function paymentComplete(data) {
	alert("결제가 완료되었습니다.");
	const formData = {
      		receiver : $("#receiver").val(),
  			price : $("#price").val(),
  			phone : $("#phone").val(),
  			amount : $("#amount").val(),
  			address1 : $("#address1").val(),
  			address2 : $("#address2").val(),
  			order_id : $("#order_id").val(),
  			alert : $("#alert").val()
      		};
	$.ajax({
		url : '${path}/shipping/insert.do',
		method : 'POST',
		data: formData
	}).done(function() {
		location.href='${path}/';
	})
}
</script>
</head>
<body>
	<div class="orderInfo">
		<form method="post" name="form1"
			id="form1">
			<div class="Info" >
				<h3 class="page-header">배송지 정보</h3>
				<input type="hidden" value="${order_id}" id="order_id" name="order_id">
				<p style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</p>
			</div>
			<c:forEach var="row" items="${map2.info}">
				<div class="form-horizontal">
					<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputReceiver" class="control-label" id="label">수령인</label>
						</div>
						<div class="col-sm-8">
							<input class="form-control" id="receiver" name="receiver"
								value="${row.name}"><br>
						</div>
					</div>
					<div>
					<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputZipcode" class="control-label" id="label">우편번호</label>
						</div>
						<div class="col-sm-5">
							<input class="form-control" type="text" id="zipcode" name="zipcode" value="${row.zipcode}"  readonly> <br>
						</div>
						<div class="col-sm-3">
							<input class="btn btn-warning btn-user btn-block"  type="button" onclick="daumZipCode()" value="우편번호 찾기" > 
						</div>
					</div>
						<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputAddress1" class="control-label" id="label">주소</label>
						</div>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="address1" name="address1" value="${row.address1}"> <br>
						</div>
					</div>
						<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputAddress2" class="control-label" id="label">상세주소</label>
						</div>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="address2" name="address2" value="${row.address2}" placeholder="상세주소"> <br>
						</div>
					</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputTel" class="control-label" id="label">전화번호</label>
						</div>
						<div class="col-sm-8">
							<input type="tel" class="form-control" id="phone" name="phone" value="${row.phone}"><br>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputEmail" class="control-label" id="label">이메일</label>
						</div>
						<div class="col-sm-8">
							<input type="email" class="form-control" id="email" name="email" value="${row.email}"><br>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputMessage" class="control-label" id="label" >메세지</label>
						</div>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="alert"  name="alert" placeholder="배송 메세지를 적어주세요"><br>
						</div>
				</div>
				<br>
				<h3>주문 목록</h3> <hr>
				<input type="hidden" name="amount" id="amount" value="${map.count}">
			<table class="table">
		<thead>
			<tr style="font-weight:bold;">
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<c:forEach var="row" items="${map.list}">
		 	<tr>
		 		<td>${row.product_name}<input type="hidden" name="product_name" id="product_name" value="${row.product_name}"></td>
		 		<td><fmt:formatNumber value="${row.price}" pattern="#,###원"/></td>
		 		<td>${row.amount}<input type="hidden" name="cart_no" value="${row.cart_no}"></td>
		 		<td><fmt:formatNumber value="${row.money}"  pattern="#,###원"/> </td>
		 		</tr>
		 		</c:forEach>
		 	<tr>
		 		<td colspan="4" align="right" style="font-weight:bold;">
		 			주문 금액 합계 : <fmt:formatNumber value="${map.sumMoney}"  pattern="#,###원"/><br>
		 			배송료 : <fmt:formatNumber value="${map.fee}"  pattern="#,###원"/><br>
		 			총합계 :<fmt:formatNumber value="${map.sum}"  pattern="#,###원"/><input type="hidden" name="price" id="price" value="${map.sum}">
		 		</td>
		 	</tr>	
		</table>
	
	
	<!-- class=row -->
	<br>
	<div class="row"  id="payment">
		<div style="text-align: center;">
		<div class="row" style="text-align: center; margin-bottom: 20px;">
			<label>주문 금액 합계 :<fmt:formatNumber value="${map.sumMoney}"  pattern="#,###원"/></label> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
			<label>배송비 : <fmt:formatNumber value="${map.fee}"  pattern="#,###원"/></label> <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			<label style="font-size: 1.5em;">총 결제금액 :  <fmt:formatNumber value="${map.sum}"  pattern="#,###원"/><input type="hidden" id="amount" name="totalAmount"></label>
		</div>
			<button class="btn btn-warning btn-user btn-block"  type="button"  onclick="pay()">결제하기</button>
			<a class="btn btn-warning btn-user btn-block"  href="javascript:history.back(-1)">돌아가기</a>
		</div>
	</div>
	</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
<title>Top</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</head>
<body>
	<div class="orderInfo">
		<form action="${path}/shipping/insert.do" method="post" name="form1"
			id="form1">
			<div class="Info" >
				<h3 class="page-header">배송지 정보</h3>
				<p style="color: red;">주문자 정보와 배송지가 다른 경우 직접 입력해주세요.</p>
			</div>
			<c:forEach var="row" items="${map2.info}">
				<div class="form-horizontal">
				<input id="order_id" name="order_id" type="hidden">
					<div class="form-group row">
						<div class="col-sm-1">
							<label for="inputReceiver" class="control-label" id="label">받는사람</label>
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
							<div class="col-sm-8">
								<input type="text" class="form-control" id="zipcode"
									name="zipcode" value="${row.zipcode}" readonly>&nbsp;
							</div>
							<div class="col-sm-3">
								<input type="button" class="btn btn-outline-warning btn-sm"
									id="searchZipcode" value="우편번호 찾기">
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
				<th>&nbsp;</th>
			</tr>
		</thead>
		 <c:forEach var="row" items="${map.list}">
		 	<tr>
		 		<td>${row.product_name}</td>
		 		<td>${row.price}원<input type="hidden" name="price" id="price" value="${row.price}"> </td>
		 		<td>${row.amount}<input type="hidden" name="cart_no" value="${row.cart_no}"></td>
		 		<td>${row.money}원</td>
		 		</tr>
		 		</c:forEach>
		 	<tr>
		 		<td colspan="5" align="right" style="font-weight:bold;">
		 			주문 금액 합계 : ${map.sumMoney}원<br>
		 			배송료 : ${map.fee}원<br>
		 			총합계 : ${map.sum}원
		 		</td>
		 	</tr>	
		</table>
	
	<!-- class=row -->
	<br>
	<div class="row"  id="payment">
		<h3 class="page-header">결제수단 확인</h3>
		<div style="text-align: center;">
			<input type="radio" name="cal_info" value="transfer"><label
				style="margin-right: 50px;">&nbsp;계좌이체</label> <input type="radio"
				name="cal_info" value="no_bankingBook"><label
				style="margin-right: 50px;">&nbsp;무통장 입금</label> <input type="radio"
				name="cal_info" value="tel_billing"><label
				style="margin-right: 50px;">&nbsp;핸드폰 결제</label> <input type="radio"
				name="cal_info" value="card"><label>&nbsp;카드 결제</label>
		</div>
		<hr>
		<div class="row" style="text-align: center; margin: 50px 0;">
			<label>상품가격 : ${map.sumMoney}원</label> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
			<label>배송비 : ${map.fee}원</label> <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
			<label style="font-size: 1.5em;">총 결제금액 :  ${map.sum}원<input type="hidden" id="amount"
				name="totalAmount">
			</label>
		</div>
		<div style="text-align: center;">
			<button class="btn btn-default cal-btn" type="submit">결제하기</button>
			<button class="btn btn-default back_btn">돌아가기</button>
		</div>
	</div>
	</form>
	</div>
</body>
</html>

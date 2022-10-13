<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<style type="text/css">

.panel-faq-container {
  margin-bottom: -16px;
}
.panel-faq-title {
  
  cursor: pointer;
}
.panel-faq-answer {
  height: 0;
  overflow: hidden;
  /* 변화가 시작되는 쪽에다가 transition 적용해준다 0 -> 300px 
  왜? 닫기 버튼을 누를 때 변화가 티남 */
  transition: all 0.1s;
}

#btn-all-close:hover {
  transition: all 0.35s;
}
.active {
  display: block;
  /* 높이를 정해줘야지만 transition이 적용됨 */
  height: 100%;
}

.write {
	text-align: right;
	position: relative;
	
}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // btn-all-close
	  const btnAllClose = document.querySelector("#btn-all-close");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}


//faq 삭제
function faq_delete() { 
	if(confirm("삭제하시겠습니까?")){
	 	document.form1.action="${path}/faq/delete.do";
		document.form1.submit();
	} 
}


</script>


</head>
<body>
<%@ include file="../include/menu.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<div class="container">
	<br>
    <h2 style="text-align: center;">FAQ</h2>
    
    <br>
    <c:if test="${sessionScope.userid == 'admin' }">
		<div class="write">
			<input type="button" class="btn btn-outline-warning btn-sm"
				value="글쓰기" onclick="location.href='${path}/faq/write.do'">
			<input type="button" class="btn btn-outline-warning btn-sm" id="btn-all-close"
			value="FAQ ALL Close">
		</div>
	</c:if>
	<c:if test="${sessionScope.userid != 'admin' || sessionScope.userid == null }">
		<div class="write">
			<input type="button" class="btn btn-outline-warning btn-sm" id="btn-all-close"
			value="FAQ ALL Close">
		</div>
	</c:if>
	
	
	<br>
	<form name="form1" id="form1" method="post" enctype="multipart/form-data">
	    <table class="table table-bordered table-hover">
	      <thead class="thead-light text-center">
	        <tr>
	          <th></th>
	          <th>FAQ Title</th>
	        </tr>
	      </thead>
	      <tbody class="text-center">
	      	<c:forEach var="row" items="${map.list}"> 
		        <tr>
		          <td><b>Q</b></td>
		          <td class="text-left" width="80%">
		            <div class="panel-faq-container">
		              <p class="panel-faq-title">${row.faq_title}</p>
		              <div class="panel-faq-answer">
		                <p>${row.faq_content}</p>
		              </div>
		            </div>
		          </td>
		          	<c:if test="${sessionScope.userid == 'admin' }">
		          		<td>
		          			<input type="hidden" name="faq_no" value="${row.faq_no}">
		          			<input type="submit" class="btn btn-outline-warning btn-sm" name="faq_delete" value="삭제" onclick="faq_delete()">
		          		</td>
		          	</c:if>
		        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	</form>   
  </div>

</body>
</html>
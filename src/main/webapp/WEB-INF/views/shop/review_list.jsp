<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//삭제 버튼
$(function(){
   $("#btnDeleteReview").click(function(){
      if(confirm("삭제하시겠습니까?")){
         document.form1.action="${path}/review/delete.do";   
         document.form1.submit();
      }
   });
});
</script>
</head>
<body>
<table style="width:700px" id="form1" name="form1">
<c:forEach var="row" items="${list}">   
	<tr>
		<td>
			[${row.userid}]
			( <fmt:formatDate value="${row.review_date}"
				 pattern="yyyy-MM-dd a HH:mm:ss" /> )<br>
				  ${row.review_content} <br>
        <!-- <button type="button" class="btn btn-outline-warning btn-sm" id="btnDeleteReview">삭제</button>-->  
				  <br>
			${str}
		</td>
	</tr>
</c:forEach>	
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

//댓글 삭제
function comment_delete() { 
	if(confirm("삭제하시겠습니까?")){
	 	document.form1.action="${path}/commCmt/delete.do";
		document.form1.submit();
		window.location.reload();
	} 
}


</script>





</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<form name="form1" id="form1" method="post" enctype="multipart/form-data">
	<table style="width:700px">
		<!-- fn: header.jsp의 jstl -->
		<c:forEach var="row" items="${list}">   
			<c:set var="str"
		value="${fn:replace(row.cmt_content,'<','&lt;') }" />
			<c:set var="str"
		value="${fn:replace(str,'>','&gt;') }" />	
			<c:set var="str"  
		value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
			<c:set var="str"
		value="${fn:replace(str,newLineChar,'<br>') }" />
		
		<%-- <c:set var="str" value="${fn:replace(str, '\\','<br>') }" /> --%>
		<!-- c:set 태그안에는 역슬래쉬를 쓸 수 없어서 별도로 처리해야함 -->
			<tr>
				<td>
				${row.name}
				( <fmt:formatDate value="${row.cmt_regdate}" pattern="yyyy-MM-dd a HH:mm:ss" /> ) 
					<c:if test="${sessionScope.userid == row.commenter}">
					 	<input type="hidden" name="cmt_no" value="${row.cmt_no}">
					 	<input type="hidden" name="comm_no" value="${row.comm_no}">
					 	<button type="button" class="btn btn-outline-warning btn-sm" onclick="comment_delete()">삭제</button>
					</c:if>
				 	<br>
				${str} 
				</td>
			</tr>
		</c:forEach>	
	</table>
</form>

</body>
</html>
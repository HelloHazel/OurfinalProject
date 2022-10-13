<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">

$(function() {
	$.ajax({
		type : "get",
		url : "${path}/faq/list.do",
		success : function(result) {
			//result : responseText 응답텍스트(html)
			$("#listFaq").html(result);
		}
	});
});
	


</script>



</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div>
	<div id="listFaq"></div>
</div>
</body>
</html>
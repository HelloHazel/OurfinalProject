<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<style type="text/css">
 table {
 	width:80%;
    margin-left:10%; 
    margin-right:10%;
 } 

.hide {
	display: none;
}

.show {
	display: table-row;
}

.item td {
	cursor: pointer;
}

.write {
	text-align: right;
	position: relative;
	right: 200px;
}


</style>


</head>
<body>
<%@ include file="../include/menu.jsp" %>

<br>
<h2 style="text-align: center;">FAQ</h2>
<br>
	<c:if test="${sessionScope.userid == 'admin' }">
		<div class="write">
			<input type="button" class="btn btn-outline-warning btn-sm"
				value="글쓰기" onclick="location.href='${path}/faq/write.do'">
		</div>
	</c:if>

	<table class="recruit" >  
        <colgroup>  
            <col width="10%">  
            <col width="70%">  
            <col width="20%">  
            </colgroup>  
        
        <thead>  
            <tr class="">  
                <th scope="col">#</th>  
                <th scope="col">title</th>  
                <th scope="col">writer</th> 
            </tr>  
        </thead>  
        <tbody> 
	        <c:forEach items="${map.list}" var="row">  
	            <tr class="item"> 
	                <td>${row.faq_no}</td>  
	                <td>${row.faq_title}</td>  
	                <td>${row.userid}</td> 
	            </tr>  
	            <tr class="hide">  
	                <td colspan="3" class="faq_content">${row.faq_content}</td>  
	            </tr>  
	         </c:forEach>
            
        </tbody>  
    </table>  
    <script type="text/javascript">  
        $(function(){  
            var article = (".recruit .show");  
            $(".recruit .item  td").click(function() {  
                var myArticle =$(this).parents().next("tr");  
                if($(myArticle).hasClass('hide')) {  
                    $(article).removeClass('show').addClass('hide');  
                    $(myArticle).removeClass('hide').addClass('show');  
                }  
                else {  
                    $(myArticle).addClass('hide').removeClass('show');  
                }  
            });  
        });  
    </script>  

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;

<h2 style="text-align: center;">MemberList</h2>
	&nbsp;
  <div class="container mt-3">
  <table class="table table-bordered" style="text-align: center;">
    <thead>
      <tr>
        <th>id</th>
        <th>name</th>
        <th>phone</th>
        <th>email</th>
        <th>address</th>
        <th>join-date</th>
      </tr>
    </thead>
    <c:forEach var="row" items="${list}">
    <tbody>
      <tr>
       <td>${row.userid}</td>
       <td>${row.name}</td>
       <td>${row.phone}</td>
       <td>${row.email}</td>
       <td>${row.address1}</td>
       <td><fmt:formatDate value="${row.join_date}" pattern="yyyy-MM-dd"/></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
    </div>
</body>
</html>
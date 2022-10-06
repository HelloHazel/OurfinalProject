<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
&nbsp;&nbsp;&nbsp;&nbsp;

  <h2>Bordered Table</h2>
  <div class="container mt-3">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>ID</th>
        <th>PW</th>
        <th>NAME</th>
        <th>PHONE</th>
        <th>EMAIL</th>
        <th>ADDRESS</th>
        <th>JOIN-DATE</th>
      </tr>
    </thead>
    <c:forEach var="row" items="${list}">
    <tbody>
      <tr>
       <td>${row.userid}</td>
       <td>${row.passwd}</td>
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
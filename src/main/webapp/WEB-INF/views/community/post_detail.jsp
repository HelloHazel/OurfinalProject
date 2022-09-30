<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<style type="text/css">

	#useridText {
		font-weight: bold;
		float: left;
		margin-right: 15px;
	}
	
	#contentText{
		float: left;
	}

</style>


</head>
<body>
<%@ include file="../include/menu.jsp" %>


<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">${dto.comm_title}</h1>
       </div>
    </div>
  </section>


  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1">
        
        <div class="col">
          <div class="card shadow-sm">
            <img class="bd-placeholder-img card-img-top" width="100%" height="100%" src="${path}/images/community/${dto.comm_url}">
            <div class="card-body">
            
           	  <p class="card-text" id="useridText">${dto.userid}</p>
           	  <p class="card-text" id="contentText">${dto.comm_content}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='${path}/community/detail.do?comm_no=${dto.comm_no}'">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">${dto.comm_regdate}</small>
              </div>
            </div>
          </div>
        </div>
       
      </div>
    </div>     
  </div>
</main>

</body>
</html>
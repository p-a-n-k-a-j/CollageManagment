<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="Stylesheet" href="${pageContext.request.contextPath }/adminPages/css/adminlogin.css">
</head>
<body>
<div class="errorMessage" id="errorMessage">
  
    <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
</div>
<div class="container">

<div class="box">
<img src="${pageContext.request.contextPath }/images/admin.png" class="icon">
<div class="heading">Admin</div>
<div class="form-container">
<form action="<%=application.getContextPath() %>/Login" method="POST">
<div style="position: relative; display: inline-block;">

  <input type="password" name="password" placeholder="Password" class="input-pass" id="input-pass">
  <button type="submit"><img src="${pageContext.request.contextPath }/images/rightarrow.png" class="right-arrow"  id="right-arrow" style="display:none;"></button>
  <img src="${pageContext.request.contextPath }/images/hide.png" class="eye" id="hide" style="display:none;" draggable="false">
  <img src="${pageContext.request.contextPath }/images/view.png" class="eye" id="view" style="display:none;" draggable="false">
</div>
</form>
</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/adminPages/js/AdminLogin.js"></script>

</body>
</html>
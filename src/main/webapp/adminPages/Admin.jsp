<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
HttpSession emailSession = request.getSession(false); // Get session if it exists, do not create a new one
if (emailSession != null && emailSession.getAttribute("adminEmail") != null) {
	
	response.sendRedirect("./adminPage/AdminLogin.jsp"); // Redirect if session exists and user is already logged in
    return; // Ensure no further code is executed
}
// If no session, continue to the registration form

%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin port</title>
<link rel="Stylesheet" href="${pageContext.request.contextPath}/adminPages/css/admincreate.css">
</head>
<body>
<div class="errorMessage" id="errorMessage">
  
    <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
</div>
<div class="wrapper">
<div class="image-container"></div>
<div class="form-container">
<h2 class="admin-heading"> Register Admin</h2>
<!--here starts the form .  -->
<form id="form" action="<%=application.getContextPath() %>/Register" method="post">

<div class="form-group">
<label class="input-name">Full Name</label>
<input type="text" id="name" class="inline-input" name="fullname" placeholder="Name..." required="required">
</div>

<div class="form-group">
<label class="input-name">Email</label>
<input type="email" class="inline-input" id="email" name="email" placeholder="Email addres.." required="required">
</div>
<div class="form-group">
<label class="input-name">Password</label>
<input type="password" class="inline-input" name="password" placeholder="Password.." id="pass" required="required">
 <img src="./adminPages/images/hide.png" class="eye" id="hide" style="display:block;" draggable="false">
 <img src="./adminPages/images/view.png" class="eye" id="view" style="display:none;" draggable="false">
</div>
<div class="form-group">
<label class="input-name" id="message">Repeat Password </label>
<input type="password" class="inline-input" name="repeatpassword" id="pass2" placeholder="Repeat pass.."  required="required">
 <img src="./adminPages/images/hide.png" class="eye2" id="hide2" style="display:block;" draggable="false">
 <img src="./adminPages/images/view.png" class="eye2" id="view2" style="display:none;" draggable="false">
</div>
<div class="form-group">
 <span id="error-message" style="color: red;"></span><br><br>
<button type="submit" onclick="validate()" class="btn">Create Account</button>
</div>

</form>
</div>
</div>


<script src="./adminPages/js/Admin.js"></script>
</body>
</html>
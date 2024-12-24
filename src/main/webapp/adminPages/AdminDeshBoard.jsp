<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Admin</title>
<link rel="StyleSheet" href="css/adminDesh.css">
</head>
<body>
<% HttpSession pass = request.getSession(false);
	
if(pass.getAttribute("adminPass")==null || pass==null){
	
	response.sendRedirect("AdminLogin.jsp");
}

%>
<c:set var="adminName"></c:set>
<div class="container">


<!--  this is the full page you can say main page-->
<div class="hero-section">

<div class="welcome-box">
<div class="discription">
<!-- getting name from database using jstl -->
<%-- Fetch database connection parameters --%>
<%
    String dbdriver = application.getInitParameter("dbdriver");
    String dburl = application.getInitParameter("dburl");
    String dbuserName = application.getInitParameter("dbusername");
    String dbpassword = application.getInitParameter("dbpassword");
    
    // Set Java variables as attributes for JSTL
    pageContext.setAttribute("dbdriver", dbdriver);
    pageContext.setAttribute("dburl", dburl);
    pageContext.setAttribute("dbuserName", dbuserName);
    pageContext.setAttribute("dbpassword", dbpassword);
    
    String adminPass = (String) pass.getAttribute("adminPass"); // Fetching adminPass
%>



<%-- Configure the DataSource using JSTL --%>
<sql:setDataSource driver="${dbdriver}" url="${dburl}" user="${dbuserName}" password="${dbpassword}" var="ds" />

<%-- Query the database --%>
<sql:query dataSource="${ds}" var="rs">
    SELECT admin_fullname FROM admin_register WHERE admin_password = ?
    <sql:param value="${adminPass}" />
</sql:query>

<%-- Display the admin's name if the query returns data --%>
<c:if test="${not empty rs.rows}">
    <h2 class="text-welcome">Welcome back, <c:out  value="${rs.rows[0].admin_fullname}" />!</h2>
    <c:set var="adminName" value="${rs.rows[0].admin_fullname }"></c:set>
</c:if>

<h2 class="deshboard-name"> Admin Dashboard</h2>
</div>
<div class="simple-img"></div>
</div><!-- welcome box code end here  -->
<!-- overview section start here -->
<div class="overview">
<h2>Total Faculty: 55</h2>
<h2>Total Student: 154</h2>
</div>
<div class="notifications">
<h2 class="notify-heading">List of Users Who Have Sent Messages to the Admin</h2>
<table class="notify-table">
<tr>
<th>User Email</th>
<th>User Role</th>
<th>Send Date</th>
</tr>
<tr>
<td>UserEmail</td>
<td>User Role</td>
<td>Send Date</td>
</tr>
</table>
</div>
</div>

<div class="side-bar">
<h2 class="adminN"><c:out value="${adminName }" ></c:out>tech</h2>
<ul class="links">
<li><a class="another" href="#">Home</a></li>
<li><a class="another" href="#">Faculty's</a></li>
<li><a class="another" href="#">Student's</a></li>
<li><a class="another" href="#">BlackList</a></li>
<li><a class="another" href="#">Notifications</a></li>
<li><a class="another" href="#">Messages</a></li>
<li><a class="another" href="#">Modification</a></li>
<li><a  class="logout" href="#">Log out</a></li>
</ul>
</div>
</div>

<!-- Invalidate session at the end -->
<%
pass.invalidate(); // Invalidate session after all operations are done
%>

</body>
</html>
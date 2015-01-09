<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	if (session.getAttribute("CurrentUser") == null) {
		response.sendRedirect("loginfailed.jsp");

	}
%>
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="ogtcstyle.css" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="contain" style="height: 700px">
<div id="header">
<h1 class="style7">Welcome To CRM HelpDesk</h1>
</div>
<div id="leftcol" style="width: 200px">
<h3>Links</h3>
<div id="navcontainer" style="width: 200px">
<ul id="navlist" style="width: 200px">
	<li><a HREF="studentprofile.jsp">My Profile</a></li>
	<li><a HREF="">My Tickets</a></li>
	<li><a HREF="raiseTicket.jsp">Raise New Ticket</a></li>
	<li><a HREF="">About Us</a></li>
	<li><a HREF="">Contact Us</a></li>
	<li><a HREF="logout.jsp">Log Out</a></li>
</ul>
</div>
</div>
</div>
</body>
</html>
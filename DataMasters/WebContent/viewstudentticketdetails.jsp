<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Details</title>

</head>
<body>

<h2> This page is not developed as it is not in the scope of the final project</h2>
	<br />
	<br />

	<table cellpadding="10" cellspacing="10" border="2" rules="none"
		frame="box" align="center">
		<%
			System.out.println("jsp before");
			String stuid = (String) session.getAttribute("RoleId");
			System.out.println("student id : " + stuid);
			String tktid = request.getParameter("value");
			System.out.println("ticket id value on detail page : " + tktid);

			System.out.println("dao called");
		%>
	</table>

</body>
</html>
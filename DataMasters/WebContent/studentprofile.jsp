<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dm.dao.DBAccess"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Profile</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0);
		//prevents caching at the proxy server
	%>
	<br>
	<br>

	<h3>You have been associated with the following tags</h3>
	<br>
	<table cellpadding="10" cellspacing="10" border="2" rules="none"
		frame="box" align="center">
		<TR>
			<TH>TagName</TH>
			<TH>Tag Description</TH>
		</TR>
		<%
			ArrayList<String> tagArr = DBAccess
					.getTagsByStudentId((String) session.getAttribute("RoleId"));
			int k = 0;
			if (tagArr.isEmpty() == false) {
				for (int i = 0; i < tagArr.size(); i++) {
					k = k + 1;
		%>
		<TR>
			<TD><%=k%></TD>
			<TD><%=tagArr.get(i)%></TD>
		</TR>
		<%
			}
			}
		%>
	</table>
</body>
</html>
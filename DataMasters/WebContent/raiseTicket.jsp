<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Raise a Ticket</title>

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0);
		//prevents caching at the proxy server
	%>
	<form action="loginsuccessful" method="post">
		<br>
		<p align="center">Please provide the following details:</p>
		<br> <br>
		<table cellpadding="10" cellspacing="10" border="2" rules="none" frame="box"  align="center">
			<tr>
				<td>Subject :</td>
				<td><input name="subject" type="text" id="subject" /></td>
			</tr>
			<tr>
				<td>Description :</td>
				<td><textarea name="desc" id="desc"></textarea></td>
			</tr>
			<tr>
				<td><div align="center">
						<input type="submit" name="Submit" value="Submit">
					</div></td>
				<td><input type="reset" name="Submit2" value="Reset" /></td>
			</tr>
		</table>
		<input type="hidden" name="FromPage" value="RaiseTicket" /> <input
			type="hidden" name="Role" value="Role" /> <input type="hidden"
			name="Tags" value="Tags" readonly />
	</form>

</body>
</html>
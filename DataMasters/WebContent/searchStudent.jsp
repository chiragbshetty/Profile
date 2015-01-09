<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Student</title>
</head>
<body>

	<form action="loginsuccessful" method="post">
		<br> <br>
		<center>
			<h2>Please provide a valid Student Number:</h2>

			<br /> <br />

			<table cellpadding="10" cellspacing="10" border="2" rules="none"
				frame="box">
				<tr>
					<td>Student Number</td>
					<td><input name="sNo" type="text" id="sNo" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit"
						name="Search" value="Search"> <input type="reset"
						name="Reset" value="Reset" /></td>
				</tr>
			</table>
		</center>
		<input type="hidden" name="FromPage" value="searchStudent" /> <input
			type="hidden" name="Role" value="Role" />
	</form>

</body>
</html>
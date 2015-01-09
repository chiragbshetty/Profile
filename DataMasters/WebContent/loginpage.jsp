<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<SCRIPT LANGUAGE="JAVASCRIPT">
	function validate(uname, pword) {
		if (uname == null || uname == "") {
			alert("Please enter a User Name");
			return false;
		}
		if (pword == null || pword == "") {
			alert("Please enter a Password");
			return false;
		}
		return true;
	}
</SCRIPT>
<body>
	<FORM ACTION="loginsuccessful" METHOD="POST"
		onSubmit="return validate (this.UserName.value,this.Password.value);"
		onreset="return clear();" onSubmit="return true">
		<center>
			<br> <U><h1>CRM Help Desk Solution</h1></U>
			<h3>A Tech Launch Arizona Initiative</h3>
			<br>
			<h3>Please provide your credentials to login</h3>
			<table cellpadding="10" cellspacing="10" rules="none" frame="box"
				align="center">

				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;User Name:&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="TEXT" NAME="UserName">&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR></TR>
				<TR></TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="PASSWORD"
						NAME="Password">&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>

				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Role:&nbsp;&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<select id="role " name="role"
						style="width: 145px; min-width: 155px;">
							<option value="Students">Student</option>
							<option value="Employees">Employee</option>
							<option value="Administrator">Administrator</option>
							<option value="Coordinator">Coordinator</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>


				<TR>
					<TD>
						<center>
							&nbsp;&nbsp;&nbsp;&nbsp;<A HREF="underconstruction.jsp">Change
								Password</A>&nbsp;&nbsp;&nbsp;&nbsp;
						</center>
					</TD>
					<TD>
						<center>
							<A HREF="studregister.jsp">New Registration</A>
							&nbsp;&nbsp;&nbsp;&nbsp;
						</center>
					</TD>
				</TR>

				<TR>
					<TD>
						<center>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT
								TYPE="SUBMIT" NAME="SUBMIT" VALUE="Log In">
						</center>
					</TD>
					<TD>
						<center>
							<INPUT TYPE="RESET" NAME="RESET" VALUE="Clear">
						</center>
					</TD>
				</TR>



			</TABLE>
		</center>
		<INPUT TYPE="HIDDEN" NAME="FromPage" VALUE="LoginPage">
	</FORM>
</body>
</html>
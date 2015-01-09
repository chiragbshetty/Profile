<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<FORM ACTION="loginsuccessful" METHOD="POST" onreset="return clear();"
		onSubmit="return true">
		<center>
			<h3>Please provide below Tag Details</h3>
			<TABLE align="center">
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Tags:&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="TEXT" NAME="TagName">&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR>
					<TD>
						<center>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT
								TYPE="SUBMIT" NAME="SUBMIT" VALUE="Delete">
						</center>
					</TD>
					<TD>
						<center>
							<INPUT TYPE="RESET" NAME="RESET" VALUE="Cancel">
						</center>
					</TD>
				</TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>


			</TABLE>
		</center>
		<INPUT TYPE="HIDDEN" NAME="FromPage" VALUE="ModifyTagPage">
	</FORM>
</body>
</html>
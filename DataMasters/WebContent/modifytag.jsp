<%@page import="com.dm.dao.DBAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
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
			<h3>
				Please edit the information for the Tag
				<%=request.getAttribute("listTags")%></h3>
			<TABLE align="center">
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>

				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Tag Name:&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="TEXT" NAME="TagName">&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Tag
						Description:&nbsp;&nbsp;&nbsp;&nbsp;</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="TEXT"
						NAME="TagDescription">&nbsp;&nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="vehicle" value="Event">Event
					</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="vehicle" value="Program">Program
					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="vehicle" value="Company">Company

					</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="vehicle" value="Ticket">Ticket

					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"
						name="vehicle" value="Student">Student

					</TD>
					<TD></TD>
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
								TYPE="SUBMIT" NAME="SUBMIT" VALUE="Create">
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Tag</title>
</head>
<SCRIPT LANGUAGE="JAVASCRIPT">

	function validate(TagName, TagDescription) {
		if (TagName == null || TagName == "") {
			alert("Please enter Tag Name");
			return false;
		}
		if (TagDescription == null || TagDescription == "") {
			alert("Please enter Tag Description");
			return false;
		}
		return true;
	}
</SCRIPT>
<body>
	<FORM ACTION="loginsuccessful" METHOD="POST" onreset="return clear();"
		onSubmit="return validate (this.TagName.value,this.TagDescription.value);"
		onreset="return clear();">
		<%
			String session_val = (String) session.getAttribute("responseone");
			System.out.println("session_val" + session_val);
		%>
		<center>
			<h3>Please provide below Tag Details</h3>
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
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="tag"
						value="Event">Event
					</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="tag"
						value="Program">Program
					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="tag"
						value="Company">Company

					</TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="tag"
						value="Ticket">Ticket

					</TD>
				</TR>
				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="tag"
						value="Student">Student

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
		<INPUT TYPE="HIDDEN" NAME="FromPage" VALUE="CreateTagPage">
	</FORM>

</body>
</html>
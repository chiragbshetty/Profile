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
			<h3>Please provide below Tag Details</h3>
			<TABLE align="center">
				<TR></TR>
				<TR></TR>
				<TR></TR>
				<TR></TR>

				<TR>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;Tag:&nbsp;&nbsp;&nbsp;&nbsp;</TD>
					<%
						ArrayList<String> list = DBAccess.getAllTags();
					%>
					<TD><select id="listTags" name="listTags" size="1">
							<%
								for (String s : list) {
							%>
							<option value="<%=s%>"><%=s%></option>
							<%
								}
							%>

					</select></TD>
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
		<INPUT TYPE="HIDDEN" NAME="FromPage" VALUE="ModifyTagListPage">
	</FORM>
</body>
</html>
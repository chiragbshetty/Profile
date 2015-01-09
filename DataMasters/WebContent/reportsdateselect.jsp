<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
<link rel="stylesheet" href="jquery-ui.css" />
<script src="jquery-1.8.3.js"></script>
<script src="jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#dateEntry").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "dd-mm-yy",
			minDate : -10
		});
	});
	$(function() {
		$("#dateEntry1").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "dd-mm-yy",
			minDate : -10
		});
	});
</script>
</head>
<body>
	<FORM ACTION="loginsuccessful" METHOD="POST" onreset="return clear();"
		onSubmit="return true">
		<center>
			<h3>To generate Reports please provide start date and end date</h3>

			<Table>

				<TR>
					<TD style="text-align: right">Start Date :</TD>
					<TD><input type="text" id="dateEntry" name="dateEntry" /></TD>
					<TD style="text-align: right">End Date :</TD>
					<TD><input type="text" id="dateEntry1" name="dateEntry" /></TD>
					<TD>
						<center>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT
								TYPE="SUBMIT" NAME="SUBMIT" VALUE="GET REPORT">
						</center>
					</TD>
				</TR>
				<TR>

				</TR>
			</Table>
		</center>
		<INPUT TYPE="HIDDEN" NAME="FromPage" VALUE="ReportsPage">
	</FORM>
</body>
</html>
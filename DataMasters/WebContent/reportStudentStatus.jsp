<%@page import="com.dm.bean.ReportStatusBean"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="java.util.*"%>
<%@ page import="com.dm.bean.TicketBean"%>
<%@ page import="com.dm.dao.DBAccess"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>View Ticket</title>
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setDateHeader("Expires", 0);
		//prevents caching at the proxy server
	%>
	<br />
	<br />
	<center>
		<h2>To display the number of students in active or inactive
			status segregated by their month of creation</h2>
	</center>
	<br />
	<br />

	<table cellpadding="10" cellspacing="10" border="2" rules="none"
		frame="box" align="center">
		<%
			System.out.println("jsp before");
			ArrayList<ReportStatusBean> al = new ArrayList<ReportStatusBean>();
			al = DBAccess.reportStudentStatus();
			System.out.println("dao called");
		%>


		<%
			try {
				if (al.isEmpty() == false) {

					System.out.println("not empty");
		%>
		<tr>
			<th>MONTH</th>
			<th>STATUS</th>
			<th>COUNT</th>

		</tr>
		<%
			ReportStatusBean tb = null;
					for (int i = 0; i < al.size(); i++) {
						System.out.println("asdasd" + i);
						tb = new ReportStatusBean();
						tb = (ReportStatusBean) al.get(i);
						if (tb != null && !tb.equals("")) {
							System.out.println("Hello " + tb.getMonth());
		%>

		<tr>
			<td><%=tb.getMonth()%></td>
			<td><%=tb.getStatus()%></td>
			<td><%=tb.getCount()%></td>

		</tr>
		<%
			}
					}
				}
			} catch (Exception e) {
				System.out.println("result set is empty");
				e.printStackTrace();
			} finally {
				System.out.println("finally");

			}
		%>
	</table>

</body>
</html>

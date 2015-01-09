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
	<h2>Tickets with Open Status</h2>
	<br />

	<table cellpadding="10" cellspacing="10" border="2" rules="none"
		frame="box" align="center">
		<%
			System.out.println("jsp before");
			String adminid = (String) session.getAttribute("RoleId");
			System.out.println("admin id : " + adminid);
			ArrayList<TicketBean> al = DBAccess.getAdminTicket(2);

			System.out.println("dao called");
		%>
		<tr>
			<th>TICKET ID</th>
			<th>TICKET SUBJECT</th>
			<th>TICKET USER</th>
			<th>TICKET CREATE DATE</th>
		</tr>

		<%
			try {
				if (al.isEmpty() == false) {
					for (int i = 0; i < al.size(); i++) {
						TicketBean tb = (TicketBean) al.get(i);
		%>
		<tr>
			<td><a
				href="ViewTicketDetails.jsp?&value1=<%=tb.getTktid()%>&value2=<%=tb.getTicketuserid()%>"><%=tb.getTktid()%></a></td>
			<td><%=tb.getTktsub()%></td>
			<td><%=tb.getTicketuserid()%></td>
			<td><%=tb.getCreatedate()%></td>
		</tr>
		<%
			}
				}
			} catch (Exception e) {
				System.out.println("result set is empty");
				e.printStackTrace();
			} finally {
				System.out.println("result set is empty");
			}
		%>
	</table>

</body>
</html>

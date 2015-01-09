<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dm.bean.TicketBean"%>
<%@ page import="com.dm.dao.DBAccess"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Ticket Details</title>
</head>
<body>
	<h2>Ticket Details</h2>
	<br />
	<br />
	<form action="loginsuccessful" method="post">
		<table cellpadding="10" cellspacing="10" border="2" rules="none"
			frame="box" align="center">
			<%
				System.out.println("jsp before");
				String tktid = request.getParameter("value1");
				String tktuserid = request.getParameter("value2");
				System.out.println("ticket id value on detail page : " + tktid);
				System.out.println("ticket user id value on detail page : "
						+ tktuserid);

				TicketBean tb = DBAccess.getTicketDetails(tktid, tktuserid);
				System.out.println("dao called");
			%>
			<tr>
				<th>TICKET ID</th>
				<th>TICKET SUBJECT</th>
				<th>TICKET DESCRIPTION</th>
				<th>TICKET USER ID</th>
				<th>TICKET USER NAME</th>
				<th>TICKET CREATE DATE</th>
				<th>TICKET LAST MODIFIED DATE</th>
			</tr>
			<%
				try {
			%>
			<tr>
				<td><%=tb.getTktid()%></td>
				<td><%=tb.getTktsub()%></td>
				<td><%=tb.getTktdesc()%></td>
				<td><%=tb.getTicketuserid()%></td>
				<td><%=tb.getTicketusername()%></td>
				<td><%=tb.getCreatedate()%></td>
				<td><%=tb.getTktlastmodified()%></td>
			</tr>
			<%
				} catch (Exception e) {
					System.out.println("result set is empty");
					e.printStackTrace();
				} finally {
					System.out.println("result set is empty");
				}
			%>
		</table>
		</br> </br> <input type="hidden" name="FromPage" value="AddTicketTag" /> <input
			type="hidden" name="userid" value=<%=tktuserid%>>
	</form>
</body>
</html>
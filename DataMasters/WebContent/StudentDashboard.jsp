<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Dashboard</title>
<!-- Load jQuery from Google's CDN -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- Source javascript file with the jQUERY code -->
<script src="script.js"></script>
<script src="http://code.jquery.com/jquery-1.4.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="runnable.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#raiseTicket").click(function() {
			$('#result').load('raiseTicket.jsp');
			//alert("Thanks for visiting!");
		});
		$("#newTicket").click(function() {
			$('#result').load('ViewStudentTicket.jsp');
			//alert("Thanks for visiting!");
		});
		$("#openTicket").click(function() {
			$('#result').load('ViewStudentTicketOpen.jsp');
			//alert("Thanks for visiting!");
		});
		$("#onHoldTicket").click(function() {
			$('#result').load('ViewStudentTicketOnHold.jsp');
			//alert("Thanks for visiting!");
		});
		$("#closedTicket").click(function() {
			$('#result').load('ViewStudentTicketClose.jsp');
			//alert("Thanks for visiting!");
		});

		$("#page2").click(function() {
			$('#result').load('loginpage.jsp');
			//alert("Thanks for visiting!");
		});

		$("#studentProfile").click(function() {
			$('#result').load('studentprofile.jsp');
			//alert("Thanks for visiting!");
		});
		$("#viewTicketOpen").click(function() {
			$('#result').load('ViewStudentTicket.jsp');
			//alert("Thanks for visiting!");
		});
		$("#underConstruction").click(function() {
			$('#result').load('underconstruction.jsp');
			//alert("Thanks for visiting!");
		});
		
		

	});
</script>

</head>
<body>
	<%
		session = request.getSession();
		String tkt = (String) session.getAttribute("raiseTicket");
		if (tkt != null && tkt.equals("ticketRaised")) {
			session.removeAttribute("raiseTicket");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Ticket Raised Successfully');");
			out.println("</script>");
		}
	%>
	<form method="post">
		<%
			String str = (String) session.getAttribute("CurrentName");
			String str1 = "Welcome " + str;
		%>
		<h1 align="center"><%=str1%>
		</h1>
		<h2 align="center">Dashboard</h2>
		<div align="center">
			<ul class="nav">
				<li><a id="studentProfile" href="#">My Profile</a></li>
				<li><a id="raiseTicket" href="#">Raise Ticket</a></li>
				<li><a href="#">View Ticket</a>
					<ul>
						<li><a id ="newTicket" href="#">New Tickets</a></li>
						<li><a id ="openTicket" href="#">Open Tickets</a></li>
						<li><a id ="onHoldTicket" href="#">On-Hold Tickets</a></li>
						<li><a id ="closedTicket" href="#">Closed Tickets</a></li>
					</ul></li>
				<li><a href="#">Register</a>
					<ul>
					
						<li><a id ="underConstruction" href="#">Program</a></li>
						<li><a id ="underConstruction" href="#">Event</a></li>
					</ul></li>
				<li><a id="logout" href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<div id="result" style="clear: both;"></div>

		<input type="hidden" name="FromPage" value="StudentDashboard" /> <input
			type="hidden" name="Role" value="Role" /> <input type="hidden"
			name="Tags" value="Tags" readonly />
	</form>

</body>
</html>
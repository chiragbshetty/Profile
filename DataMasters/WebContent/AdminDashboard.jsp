<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Dashboard</title>
<!-- Load jQuery from Google's CDN -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<!-- Source javascript file with the jQUERY code -->
<script src="script.js"></script>
<script src="http://code.jquery.com/jquery-1.4.min.js"
	type="text/javascript"></script>

<link rel="stylesheet" href="runnable1.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#createTag1").click(function() {
			$('#result').load('createtag.jsp');
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
		$("#searchStudent").click(function() {
			$('#result').load('searchStudent.jsp');
			//alert("Thanks for visiting!");
		});
		$("#reportStudent").click(function() {
			$('#result').load('reportStudentStatus.jsp');
			//alert("Thanks for visiting!");
		});
		$("#raiseTicket").click(function() {
			$('#result').load('raiseTicket.jsp');
			//alert("Thanks for visiting!");
		});
		$("#newTicket").click(function() {
			$('#result').load('ViewAdminTicketNew.jsp');
			//alert("Thanks for visiting!");
		});
		$("#openTicket").click(function() {
			$('#result').load('ViewAdminTicketOpen.jsp');
			//alert("Thanks for visiting!");
		});
		$("#onHoldTicket").click(function() {
			$('#result').load('ViewAdminTicketOnHold.jsp');
			//alert("Thanks for visiting!");
		});

		$("#closedTicket").click(function() {
			$('#result').load('ViewAdminTicketClosed.jsp');
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
		String name = (String) session.getAttribute("responseone");
		if (name != null && name.equals("Added")) {
			session.removeAttribute("responseone");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Successfully');");
			out.println("</script>");
		}
		String tkt = (String) session.getAttribute("tagAssociated");
		if (tkt != null && tkt.equals("tagAssociated")) {
			session.removeAttribute("tagAssociated");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('The tags have been associated successfully!');");
			out.println("</script>");
		}
	%>
	<form method="post">
		<%
			String str = (String) session.getAttribute("CurrentName");
			String str1 = "Welcome " + str;
		%>
		<h1 align="center"><%=str1%></h1>
		<h2 align="center">Dashboard</h2>
		<div align="center">
			<ul class="nav">
				<li><a id="profiles" href="#">Profiles</a>
					<ul>
						<li><a id="searchStudent" href="#">Students</a></li>
						<li><a id="underConstruction" href="#">Employees</a></li>
						<li><a id="underConstruction" href="#">Coordinators</a></li>
					</ul></li>
				<li><a id="tickets" href="#">Tickets</a>
					<ul>

						<li><a id="newTicket" href="#">New Tickets</a></li>
						<li><a id="openTicket" href="#">Open Tickets</a></li>
						<li><a id="onHoldTicket" href="#">On-Hold Tickets</a></li>
						<li><a id="closedTicket" href="#">Closed Tickets</a></li>
					</ul></li>
				<li><a id="tags" href="#">Tags</a>
					<ul>
						<li><a id="createTag1" href="#">Create</a></li>
						<li><a id="underConstruction" href="#">View</a></li>
						<li><a id="underConstruction" href="#">Modify</a></li>
						<li><a id="underConstruction" href="#">Delete</a></li>
					</ul></li>
				<li><a href="#">Programs</a>
					<ul>
						<li><a id="underConstruction" href="#">Create</a></li>
						<li><a id="underConstruction" href="#">Modify</a></li>
						<li><a id="underConstruction" href="#">Delete</a></li>
					</ul></li>
				<li><a href="#">Events</a>
					<ul>
						<li><a id="underConstruction" href="#">Create</a></li>
						<li><a id="underConstruction" href="#">Modify</a></li>
						<li><a id="underConstruction" href="#">Delete</a></li>
					</ul></li>
				<li>
				<li><a href="#">Reports</a>
					<ul>
						<li><a id="reportStudent" href="#">Student Report</a></li>
						<li><a id="underConstruction" href="#">Ticket Report</a></li>
					</ul></li>
				<li><a id="logout" href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<div id="result" style="clear: both;"></div>

		<input type="hidden" name="FromPage" value="AdminDashboard" /> <input
			type="hidden" name="Role" value="Role" /> <input type="hidden"
			name="Tags" value="Tags" readonly />
	</form>

</body>
</html>
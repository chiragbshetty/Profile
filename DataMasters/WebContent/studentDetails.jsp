<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.dm.bean.StudentBean"
	import="java.util.ArrayList" import="java.lang.String"%>
<%@include file="AdminDashboard.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--<script type="text/javascript">
function showDiv() {
	   document.getElementById('tagDiv').style.display = "block";
	   document.getElementById('buttonDiv').style.hide;
	}
</script>-->
</head>
<body>

	<form action="loginsuccessful" method="post">
		<%
			session = request.getSession();
			StudentBean sb = (StudentBean) session.getAttribute("student");
			ArrayList<String> al = (ArrayList<String>) session
					.getAttribute("al");
			String studid = null;
			String sname = null;
			String email = null;
			String tag = null;
			if (sb.getStudid() == null || sb.getStudid().equals("")) {
				session.removeAttribute("student");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid Student Number!');");
				out.println("</script>");
			} else {
				studid = sb.getStudid();
				sname = sb.getFirstName() + " " + sb.getLastName();
				email = sb.getEmail();
				System.out.println("Student ID on the form is " + studid);
		%>

		<p align="center">Student Details:</p>
		<center>
			<table cellpadding="10" cellspacing="10" border="2" rules="none">
				<tr>
					<td width="253">Student Number</td>
					<td width="500"><%=studid%></td>
				</tr>
				<tr>
					<td>Student Name</td>
					<td><%=sname%></td>
				</tr>
				<tr>
					<td>Email Address</td>
					<td><%=email%></td>
				</tr>

				<%
					try {
							if (al.isEmpty() == false) {
								tag = al.get(0);
								for (int i = 1; i < al.size(); i++) {
									tag = tag + ',' + al.get(i);
								}
							} else {
								tag = "None";
							}
							session.removeAttribute("student");
							session.removeAttribute("al");
							session.setAttribute("studid", studid);
							System.out.println("Student ID from session = " + studid);
						} catch (Exception e) {
							System.out.println("result set is empty");
							e.printStackTrace();
						} finally {
							System.out.println("result set is empty");
						}
				%>
				<tr>
					<td>Tags</td>
					<td><%=tag%></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" name="addTags"
						value="Add Tags"></td>
					
				</tr>
			</table>

		</center>
		<input type="hidden" name="FromPage" value="studentDetails" /> <input
			type="hidden" name="Tags" value="Tags" readonly />
		<%
			}
		%>
	</form>

</body>
</html>
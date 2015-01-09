<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"%>
<%@include file="AdminDashboard.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="loginsuccessful" method="post">
		<%
			session = request.getSession();
			ArrayList<String> al = (ArrayList<String>) session
					.getAttribute("al");
			String studid = (String) session.getAttribute("studid");
			System.out.println("Student ID in addTags page is " + studid);
			session.removeAttribute("studid");
			String tagName = null, tagName1 = null;
		%>
		<br />
		<h2>Please check the tags you want to associate the Student
			Profile with</h2>
		<br /> <br />
		<center>
			<table cellpadding="10" cellspacing="10" border="2" rules="none"
				frame="box">
				<tr>
					<td align="center" colspan="2">Student Tags</td>
				</tr>
				<%
				try{
					for (int i = 0; i < al.size();) {
						
						tagName = al.get(i);
						if (i < al.size()) {							
							tagName1 = al.get(	i + 1);
				%>
				<tr>
					<td align="left"><input type="checkbox" name="listTags"
						value="<%=tagName%>"><%=tagName%></td>
					<td align="left"><input type="checkbox" name="listTags"
						value="<%=tagName1%>"><%=tagName1%></td>
				</tr>
				<%
					}
						i = i + 2;
					}
				} catch(Exception e){
					
				}
				%>
				<tr>
					<td colspan="3" align="center"><input type="submit"
						name="addTag" value="Add Tags"></td>
				</tr>
			</table>
		</center>
		<input type="hidden" name="FromPage" value="addTags" /> <input
			type="hidden" name="studid" value=<%=studid%>> <input
			type="hidden" name="Tags" value="Tags" readonly />
	</form>

</body>
</html>
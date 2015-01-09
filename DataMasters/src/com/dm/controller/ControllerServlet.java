package com.dm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dm.bean.StudentBean;
import com.dm.bean.TicketBean;
import com.dm.dao.DBAccess;

public class ControllerServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String FromPage = request.getParameter("FromPage");
		System.out.print("Inside servlet");
		if (FromPage.equals("LoginPage")) {
			String UserName = request.getParameter("UserName");
			String Password = request.getParameter("Password");
			String Role = request.getParameter("role");
			System.out.println("name : " + UserName + "Passowr" + Password
					+ "role" + Role);
			String str[] = DBAccess.validateUser(UserName, Password, Role);
			if (str != null) {
				HttpSession UserSession = request.getSession(true);
				UserSession.setAttribute("CurrentUser", UserName);
				UserSession.setAttribute("CurrentName", str[1]);
				UserSession.setAttribute("RoleId", str[0]);
				UserSession.setAttribute("Role", Role);
				if (Role.equalsIgnoreCase("Administrator")
						|| Role.equalsIgnoreCase("Coordinator")) {
					System.out.println("inside admins");
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/AdminDashboard.jsp");
					rd.forward(request, response);
				}
				if (Role.equalsIgnoreCase("Students")) {
					System.out.println("inside students");
					// ArrayList<String> tagArr =
					// DBAccess.getTagsByStudentId(str[0]);
					// UserSession.setAttribute("tagsStud", tagArr);
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/StudentDashboard.jsp");
					rd.forward(request, response);
				}

			} else {

				response.sendRedirect(response
						.encodeRedirectURL("loginfailed.html"));
			}
		}
		if (FromPage.equals("CreateTagPage")) {
			String TagName = request.getParameter("TagName");
			String TagDescription = request.getParameter("TagDescription");
			String[] tag = request.getParameterValues("tag");

			if (DBAccess.addTag(TagName, TagDescription, tag)) {
				System.out.println("Inside Tags");
				request.getSession(true).setAttribute("responseone", "Added");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/AdminDashboard.jsp");
				rd.forward(request, response);

			} else {

				request.getSession(true).setAttribute("responseone",
						"Not Added");
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher("/AdminDashboard.jsp");
				rd.forward(request, response);
			}
		}
		// Raising a Ticket
		System.out.println("Going to raise a ticket");
		if (FromPage.equals("RaiseTicket")) {

			System.out.println("Inside controller servlet");

			TicketBean tb = new TicketBean();
			tb.setTktsub(request.getParameter("subject"));
			tb.setTktdesc(request.getParameter("desc"));
			tb.setTktstatus(1);

			String stud = (String) request.getSession(true).getAttribute(
					"RoleId");
			DBAccess dao = new DBAccess();
			System.out.println("Dao object created" + stud);
			dao.addTicket(tb, stud);
			// request.setAttribute("tb",tb);

			System.out.println("Inside Raise Tickets");
			request.getSession(true)
					.setAttribute("raiseTicket", "ticketRaised");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/StudentDashboard.jsp");
			dispatcher.forward(request, response);
		}

		if (FromPage.equals("AddStudent")) {
			StudentBean sb = new StudentBean();

			try{
			sb.setFirstName(request.getParameter("fname"));
			sb.setLastName(request.getParameter("lname"));
			sb.setDescription(request.getParameter("desc"));
			System.out.println("radio " + request.getParameter("gender"));

			if (request.getParameter("gender").equals("Female")) {
				sb.setGender("F");
			} else {
				sb.setGender("M");
			}

			sb.setEmail(request.getParameter("email"));
			sb.setGpa(request.getParameter("gpa"));
			sb.setStreet(request.getParameter("street"));
			sb.setCity(request.getParameter("city"));
			sb.setState(request.getParameter("state"));
			sb.setCountry(request.getParameter("country"));
			sb.setZipcode(request.getParameter("zipcode"));
			sb.setMajor(request.getParameter("major"));
			sb.setMinor(request.getParameter("minor"));
			sb.setStudusername(request.getParameter("username"));
			sb.setPassword(request.getParameter("pwd"));

			System.out.println("bean------------");
			System.out.println(sb.toString());
			DBAccess dao = new DBAccess();
			System.out.println("call register student from dao");
			dao.registerStudent(sb);
			System.out.println("attribute set");
			request.setAttribute("sb", sb);

			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/studregistersuccess.jsp");
			dispatcher.forward(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/studregister.jsp");
				dispatcher.forward(request, response);
			}
		}
		// Searching for a Student based on Student Number
		System.out.println("Going to search for a student");
		if (FromPage.equals("searchStudent")) {

			String sNumber = request.getParameter("sNo");

			DBAccess dao = new DBAccess();
			System.out.println("Dao object created");

			StudentBean student = new StudentBean();
			student = dao.searchStudent(sNumber);

			ArrayList<String> al = new ArrayList<String>();
			al = dao.searchTags(sNumber);

			request.getSession(true).setAttribute("student", student);
			request.getSession(true).setAttribute("al", al);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/studentDetails.jsp");
			dispatcher.forward(request, response);
		}

		// Displaying Tags in the Student Profile
		if (FromPage.equals("searchStudent")) {

			String sNumber = request.getParameter("sNo");

			DBAccess dao = new DBAccess();
			System.out.println("Dao object created");

			StudentBean student = new StudentBean();
			student = dao.searchStudent(sNumber);

			ArrayList<String> al = new ArrayList<String>();
			al = dao.searchTags(sNumber);

			request.getSession(true).setAttribute("student", student);
			request.getSession(true).setAttribute("al", al);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/studentDetails.jsp");
			// dispatcher.forward(request, response);
		}

		// Add Tags to the Student Profile
		if (FromPage.equals("studentDetails")) {

			DBAccess dao = new DBAccess();

			ArrayList<String> al = new ArrayList<String>();
			System.out.println("Going to call getTags function.");
			al = dao.getTags();

			request.getSession(true).setAttribute("al", al);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/addTags.jsp");
			dispatcher.forward(request, response);
		}

		// Associate Tags to the Student Profile
		if (FromPage.equals("addTags")) {

			String[] tags = request.getParameterValues("listTags");
			String studid = request.getParameter("studid");
			System.out.println("In controller, Student ID is " + studid);
			DBAccess dao = new DBAccess();

			System.out.println("Going to call associateStudentTags function.");
			dao.associateStudentTags(tags, studid);

			request.getSession(true).setAttribute("tagAssociated",
					"tagAssociated");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/AdminDashboard.jsp");
			dispatcher.forward(request, response);
		}

	}
}

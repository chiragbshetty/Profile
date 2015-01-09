package com.dm.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;

import com.dm.bean.ReportStatusBean;
import com.dm.bean.StudentBean;
import com.dm.bean.TicketBean;

public class DBAccess {
	public static DBConnector db = new DBConnector(
			"jdbc:oracle:thin:@128.196.27.218:1521:MIS00", "datamasters",
			"eAMw2Ph1o");
	public static Connection con = null;
	public static Statement st = null;
	public static ResultSet rs = null;

	@SuppressWarnings("resource")
	public static String[] validateUser(String UserName, String Password,
			String role) {

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String str[] = new String[3];

		try {

			con = db.getConnection();
			st = con.createStatement();
			if (role.equalsIgnoreCase("Students")) {
				rs = st.executeQuery("select * from Students where  studUserName='"
						+ UserName + "' and password='" + Password + "'");
				while (rs.next()) {
					System.out.println("name" + rs.getString("studusername"));
					if (UserName.equalsIgnoreCase(rs.getString("studusername"))) {
						System.out.println("Current user in DB Acc" + UserName);
						str[0] = rs.getString("studid");
						str[1] = rs.getString("studfirstname") + " "
								+ rs.getString("studlastname");
						return str;
					}

				}
			} else if (role.equalsIgnoreCase("Administrator")) {
				rs = st.executeQuery("select * from System_managers where UserName='"
						+ UserName
						+ "' and password='"
						+ Password
						+ "'  and role='Administrator'");
				System.out.println("Current in admin" + UserName);
				if (rs.next()) {
					str[0] = rs.getString("managerid");
					str[1] = rs.getString("managername");
					return str;
				}
			} else if (role.equalsIgnoreCase("Coordinator")) {
				rs = st.executeQuery("select * from System_managers where UserName='"
						+ UserName
						+ "' and password='"
						+ Password
						+ "' and role='Coordinator'");
				System.out.println("Current user in coordinator" + UserName);
				if (rs.next()) {
					str[0] = rs.getString("managerid");
					str[1] = rs.getString("managername");
					return str;
				}
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					// System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					// System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != con)
				;
			con = null;
			// System.out.println("Connection is closed");
			// db.returnConnectionToPool(con);

		}
		return null;
	}

	public static Boolean addTag(String name, String description,
			String[] checkvalues) {

		Connection con = null;
		Statement st = null;
		Boolean rs = null;
		ResultSet rs1;
		try {

			con = db.getConnection();
			st = con.createStatement();
			String key = null;

			rs = st.execute("insert into tags(tagname, tagdesc) values('"
					+ name + "','" + description + "')");
			rs1 = st.executeQuery("select tagid from tags where tagname='"
					+ name + "'");
			if (rs1.next()) {
				key = rs1.getString(1);
			}
			System.out.println("key" + key);
			for (int i = 0; i < checkvalues.length; i++) {
				System.out.println(checkvalues[i]);
				if (checkvalues[i].equalsIgnoreCase("Student")) {
					rs = st.execute("insert into Student_tag_type values('"
							+ key + "')");
				}
				if (checkvalues[i].equalsIgnoreCase("Ticket")) {
					rs = st.execute("insert into Ticket_tag_type values('"
							+ key + "')");
				}
				if (checkvalues[i].equalsIgnoreCase("Program")) {
					rs = st.execute("insert into Program_tag_type values('"
							+ key + "')");
				}
				if (checkvalues[i].equalsIgnoreCase("Event")) {
					rs = st.execute("insert into Event_tag_type values('" + key
							+ "')");
				}
				if (checkvalues[i].equalsIgnoreCase("Company")) {
					rs = st.execute("insert into Company_tag_type values('"
							+ key + "')");
				}
			}
			con.close();
			return true;

		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {

				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					// System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != con)
				con = null;

			// System.out.println("Connection is closed");
			// db.returnConnectionToPool(con);

		}
		return false;
	}

	public static ArrayList<String> getAllTags() {

		ArrayList<String> listOfTags = new ArrayList<String>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {

			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM tags");
			while (rs.next()) {
				System.out.println(rs.getString("tagname"));
				listOfTags.add(rs.getString("tagname"));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return listOfTags;
	}

	public static ArrayList<String> getTagsByStudentId(String studId) {

		ArrayList<String> listOfTags = new ArrayList<String>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {

			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from student_tag s,tags t where t.TAGID= s.STUDTAGID and studid ='"
					+ studId + "'");
			while (rs.next()) {
				System.out.println(rs.getString("tagname"));
				listOfTags.add(rs.getString("tagname"));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return listOfTags;
	}

	// Adding a Ticket
	public Boolean addTicket(TicketBean tb, String studid) {

		System.out.println("Inside addTicket function.");
		// Connection con = null;
		// Statement st = null;

		try {

			con = db.getConnection();
			st = con.createStatement();

			String pattern = "dd-MMM-yy";
			String id = "T100020";
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			// formatting
			System.out.println(format.format(new Date()));

			CallableStatement cs = null;

			String d = format.format(new Date()).toString();
			cs = this.con
					.prepareCall("{call insert_ticket_data(?, ?,?,?,?,?,?)}");
			cs.setString(1, tb.getTktsub());
			cs.setString(2, tb.getTktdesc());
			cs.setInt(3, 1);
			cs.setString(4, d);
			cs.setString(5, d);
			cs.setString(6, "Students");
			cs.setString(7, studid);
			boolean b = cs.execute();
			System.out.println("boolean value is " + b);

			// String str =
			// "insert into tickets(tktsub, tktdesc, tktcurrentstatus, lastmodified, createdate) values('"
			// + tb.getTktsub()
			// + "','"
			// + tb.getTktdesc()
			// + "',"
			// + tb.getTktstatus()
			// + ",'"
			// + format.format(new Date())
			// + "','" + format.format(new Date()) + "')";

			System.out.println("Query executed successfully!");
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();

		}
		return false;
	}

	public void registerStudent(StudentBean sb) throws ServletException {
		try {

			con = db.getConnection();
			st = con.createStatement();

			System.out.println("connection :" + con + " stmt:" + st);

			String pattern = "dd-MMM-yy";
			SimpleDateFormat format = new SimpleDateFormat(pattern);

			System.out.println("status added=A");
			st.execute("INSERT INTO students(STUDFIRSTNAME, STUDLASTNAME, STUDDESC,"
					+ " STUDGENDER, STUDEMAIL,STUDGPA, STUDSTREET, STUDCITY, STUDSTATE, "
					+ "STUDCOUNTRY, STUDZIPCODE, STUDMINOR, STUDMAJOR, CREATEDDATE, STUDUSERNAME,PASSWORD, STUDSTATUS) "
					+ "VALUES('"
					+ sb.getFirstName()
					+ "','"
					+ sb.getLastName()
					+ "','"
					+ sb.getDescription()
					+ "','"
					+ sb.getGender()
					+ "','"
					+ sb.getEmail()
					+ "','"
					+ sb.getGpa()
					+ "','"
					+ sb.getStreet()
					+ "','"
					+ sb.getCity()
					+ "','"
					+ sb.getState()
					+ "','"
					+ sb.getCountry()
					+ "','"
					+ sb.getZipcode()
					+ "','"
					+ sb.getMajor()
					+ "','"
					+ sb.getMinor()
					+ "','"
					+ format.format(new Date())
					+ "','"
					+ sb.getStudusername()
					+ "','"
					+ sb.getPassword()
					+ "','"
					+ 'A' + "')");
			System.out.println("insert command executed");
			st.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB operation failed");
		}
	}

	public static ArrayList<TicketBean> getStudentTicket(String stuid,
			int tktstatus) {

		System.out.println("dao started" + tktstatus);
		ArrayList<TicketBean> al = new ArrayList<TicketBean>();
		TicketBean tb = new TicketBean();
		try {

			con = db.getConnection();
			st = con.createStatement();
			String str = "SELECT t.TKTID, TKTSUB, TKTDESC, TKTCURRENTSTATUS, CREATEDATE FROM student_ticket st, tickets t where st.STUD_ID='"
					+ stuid
					+ "'and st.STUDTKTID=t.TKTID and t.TKTCURRENTSTATUS='"
					+ tktstatus + "' order by tktid";

			System.out.println("Query ---" + str);
			rs = st.executeQuery(str);
			while (rs.next()) {
				System.out.println(rs.getString("TKTID"));
				tb = new TicketBean();
				tb.setTktid(rs.getString("TKTID"));
				tb.setTktsub(rs.getString("TKTSUB"));
				tb.setTktdesc(rs.getString("TKTDESC"));
				tb.setTktstatus(rs.getInt("TKTCURRENTSTATUS"));
				tb.setCreatedate(rs.getDate("CREATEDATE"));
				al.add(tb);
				System.out.println("values set");
				// System.out.println("inside dao function : "+al.get(1));
				// System.out.println("inside dao function : "+al.get(2));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return al;
	}

	// search a Student based on Student Number
	public StudentBean searchStudent(String sNo) throws ServletException {
		try {

			con = db.getConnection();
			st = con.createStatement();

			StudentBean sb = new StudentBean();

			System.out.println("connection :" + con + " stmt:" + st);

			ResultSet rs = st
					.executeQuery("SELECT * FROM students WHERE studid = '"
							+ sNo + "'");

			while (rs.next()) {
				System.out.println(rs.getString("studid"));
				sb.setStudid(rs.getString("studid"));
				sb.setFirstName(rs.getString("studfirstname"));
				sb.setLastName(rs.getString("studlastname"));
				sb.setEmail(rs.getString("studemail"));
			}

			st.close();
			con.close();
			return sb;
		} catch (SQLException e) {
			throw new ServletException("DB operation failed", e);
		}
	}

	// find all Student's tags
	public ArrayList<String> searchTags(String sNo) throws ServletException {
		try {

			con = db.getConnection();
			st = con.createStatement();

			ArrayList<String> tags = new ArrayList<String>();

			System.out.println("connection :" + con + " stmt:" + st);

			ResultSet rs = st
					.executeQuery("select tagname from tags t, student_tag st where t.TAGID = st.STUDTAGID and st.STUDID = '"
							+ sNo + "'");

			while (rs.next()) {
				tags.add(rs.getString("tagname"));
			}

			st.close();
			con.close();
			return tags;

		} catch (SQLException e) {
			throw new ServletException("DB operation failed", e);
		}

	}

	// Get Student Tags
	public ArrayList<String> getTags() {

		ArrayList<String> studTags = new ArrayList<String>();
		try {

			con = db.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("SELECT tagname FROM tags, student_tag_type where tagid=studtagid");
			while (rs.next()) {
				System.out.println(rs.getString("tagname"));
				studTags.add(rs.getString("tagname"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return studTags;
	}

	// Associate Student Tags
	public void associateStudentTags(String[] tags, String studid) {

		try {

			con = db.getConnection();
			st = con.createStatement();
			String tagid = null;
			System.out.println("Student ID is " + studid);
			st.execute("delete from student_tag where studid = '" + studid
					+ "'");
			System.out.println("Delete executed");
			for (int i = 0; i < tags.length; i++) {
				System.out.println(tags[i]);

				rs = st.executeQuery("select tagid from tags where tagname='"
						+ tags[i] + "'");
				if (rs.next()) {
					tagid = rs.getString("tagid");
					st.execute("insert into student_tag values('" + tagid
							+ "','" + studid + "')");
				}

			}

		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {

				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					// System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != con)
				con = null;
			// System.out.println("Connection is closed");
			// db.returnConnectionToPool(con);

		}

	}// Queries for Reports

	public static ArrayList<ReportStatusBean> reportStudentStatus() {

		try {

			con = db.getConnection();
			st = con.createStatement();
			String str = "SELECT TO_CHAR(TO_DATE(EXTRACT(month FROM CREATEDDATE), 'MM'), 'MONTH'),studstatus , Count(*)FROM STUDENTS Where Extract(Year from CREATEDDATE) = '2014' GROUP BY TO_CHAR(TO_DATE(EXTRACT(month FROM CREATEDDATE), 'MM'), 'MONTH'),studstatus Order by 1";
			rs = st.executeQuery(str);
			ReportStatusBean rb = new ReportStatusBean();
			ArrayList<ReportStatusBean> arr = new ArrayList<ReportStatusBean>();
			while (rs.next()) {
				System.out.println("Month" + rs.getString(1));
				rb = new ReportStatusBean();
				rb.setMonth(rs.getString(1));
				rb.setStatus(rs.getString(2));
				rb.setCount(rs.getInt(3));
				arr.add(rb);
			}
			con.close();
			return arr;
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {

				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					// System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != con)
				con = null;
			// System.out.println("Connection is closed");
			// db.returnConnectionToPool(con);

		}
		return null;

	}

	public static ArrayList<TicketBean> getAdminTicket(int tktstatus) {

		System.out.println("dao started");
		ArrayList<TicketBean> al = new ArrayList<TicketBean>();
		TicketBean tb = new TicketBean();
		try {

			con = db.getConnection();
			st = con.createStatement();

			rs = st.executeQuery("select t.tktid, t.tktsub, t.tktdesc, t.CREATEDATE, st.STUD_ID userid from tickets t, student_ticket st where t.TKTID=st.STUDTKTID and t.TKTCURRENTSTATUS='"
					+ tktstatus
					+ "' union select t.tktid, t.tktsub, t.tktdesc, t.CREATEDATE, et.empid userid from tickets t, EMPLOYEE_TICKET et where t.TKTID=et.emptktid and t.TKTCURRENTSTATUS='"
					+ tktstatus + "'order by CREATEDATE");

			while (rs.next()) {
				System.out.println(rs.getString("TKTID"));
				tb = new TicketBean();
				tb.setTktid(rs.getString("TKTID"));
				tb.setTktsub(rs.getString("TKTSUB"));
				tb.setTktdesc(rs.getString("TKTDESC"));
				tb.setTicketuserid(rs.getString("userid"));
				tb.setCreatedate(rs.getDate("CREATEDATE"));
				al.add(tb);
				System.out.println("values set");
				// System.out.println("inside dao function : "+al.get(1));
				// System.out.println("inside dao function : "+al.get(2));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return al;
	}

	
	public static TicketBean getTicketDetails(String tktid, String roleid) {

		ArrayList<TicketBean> al = new ArrayList<TicketBean>();
		TicketBean tb = new TicketBean();
		try {

			con = db.getConnection();
			st = con.createStatement();

			String str = "SELECT t.TKTID, TKTSUB, TKTDESC, TKTCURRENTSTATUS, CREATEDATE,LASTMODIFIED, s.STUDID roleid, (s.STUDFIRSTNAME||' '||s.STUDLASTNAME) rolename FROM student_ticket st, tickets t, students s where t.TKTID='"
					+ tktid
					+ "'and st.STUDTKTID=t.TKTID and st.STUD_ID=s.STUDID and st.STUD_ID='"
					+ roleid
					+ "'union SELECT t1.TKTID, t1.TKTSUB,t1.TKTDESC, t1.TKTCURRENTSTATUS, t1.CREATEDATE,t1.LASTMODIFIED, e.EMPID roleid, (e.EMPFIRSTNAME||' '||e.EMPLASTNAME) rolename FROM employee_ticket et, tickets t1, employees e where t1.TKTID='"
					+ tktid
					+ "'and et.EMPTKTID=t1.TKTID and et.EMPID=e.EMPID and e.EMPID='"
					+ roleid + "'order by TKTID";

			System.out.println("Query ---" + str);
			rs = st.executeQuery(str);
			while (rs.next()) {
				System.out.println(rs.getString("TKTID"));
				System.out.println(rs.getString("roleid"));
				tb = new TicketBean();
				tb.setTktid(rs.getString("TKTID"));
				tb.setTktsub(rs.getString("TKTSUB"));
				tb.setTktdesc(rs.getString("TKTDESC"));
				tb.setTktstatus(rs.getInt("TKTCURRENTSTATUS"));
				tb.setCreatedate(rs.getDate("CREATEDATE"));
				tb.setTktlastmodified(rs.getDate("LASTMODIFIED"));
				tb.setTicketuserid(rs.getString("roleid"));
				tb.setTicketusername(rs.getString("rolename"));

				System.out.println("values set");

			}
			con.close();
		} catch (Exception e) {
			System.out.println(e.toString());

		} finally {
			if (null != rs)
				try {
					rs.close();
					System.out.println("ResultSet closed");
				} catch (Exception e) { /* ignored */
				}
			if (null != st)
				try {
					st.close();
					System.out.println("Statement closed");
				} catch (Exception e) { /* ignored */
				}
		}
		return tb;
	}

}

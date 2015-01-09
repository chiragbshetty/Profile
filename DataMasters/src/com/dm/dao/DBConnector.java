package com.dm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Vector;

public class DBConnector {

	String databaseUrl = "jdbc:oracle:thin:@128.196.27.218:1521:MIS00";
	String userName = "datamasters";
	String password = "eAMw2Ph1o";

	@SuppressWarnings("rawtypes")
	Vector connectionPool = new Vector();

	public DBConnector() {
		
	}

	public DBConnector(
	// String databaseName,
			String databaseUrl, String userName, String password) {
		this.databaseUrl = databaseUrl;
		this.userName = userName;
		this.password = password;
		}

	
	// Creating a connection
	public Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			connection = DriverManager.getConnection(databaseUrl, userName,
					password);
			System.out.println("Connection: " + connection);
		} catch (SQLException sqle) {
			System.err.println("SQLException: " + sqle);
			return null;
		} catch (ClassNotFoundException cnfe) {
			System.err.println("ClassNotFoundException: " + cnfe);
			return null;
		}

		return connection;
	}
}
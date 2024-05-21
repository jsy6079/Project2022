package ch08;

import java.sql.*;

public class JdbcTest {
	public static void main (String args[]) {
		Connection con;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mis","root","ksj30317");
			System.out.println("Success");
		} catch(SQLException ex) {
			System.out.println("SQLException" + ex);
		} catch(Exception ex) {
			System.out.println("Exception" + ex);
		}
	}

}

package sql.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection makeConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capstone", "newuser",
					"zaq!1234");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/*
	 * public static Connection makeConnection() { try {
	 * Class.forName("com.mysql.cj.jdbc.Driver"); Connection conn =
	 * DriverManager.getConnection(
	 * "jdbc:mysql://localhost:3306/capstone?serverTimezone=Australia/Melbourne",
	 * "be5_newuser", "Be5M95ql*"); return conn; } catch (Exception e) {
	 * e.printStackTrace(); } return null; }
	 */

}

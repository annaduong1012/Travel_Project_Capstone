package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Customer;
import entity.Tour;
import entity.TourGuide;
import sql.connection.DBConnection;

public class CustomerDAO {
	public static List<Customer> getFeedback() throws SQLException {
		Connection connection = DBConnection.makeConnection();
		Statement stmt = connection.createStatement();

		String sqlQuery = "select c.first_name, feedbacks, img_name\n" + "from testimonial t\n"
				+ "join customer c on t.customer_id = c.id;";
		ResultSet resultSet = stmt.executeQuery(sqlQuery);
		
		List<Customer> list = new ArrayList<Customer>();

		while (resultSet.next()) {
			String name = resultSet.getString("c.first_name");
			String feedback = resultSet.getString("feedbacks");
			String imgName = resultSet.getString("img_name");

			Customer customer = new Customer(name, feedback, imgName);
			list.add(customer);
		}
		return list;

	}
}

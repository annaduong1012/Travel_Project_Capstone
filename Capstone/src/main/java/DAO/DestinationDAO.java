package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Destination;
import sql.connection.DBConnection;

public class DestinationDAO {
	public List<Destination> getAllStates() throws SQLException {
		Connection connection = DBConnection.makeConnection();
		Statement stmt = connection.createStatement();
		String sqlQuery = "SELECT * FROM destination ORDER BY state ASC";
		ResultSet resultSet = stmt.executeQuery(sqlQuery);

		List<Destination> list = new ArrayList<Destination>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String state = resultSet.getString("state");

			Destination destination = new Destination(id, state);
			list.add(destination);
		}
		return list;
	}
}

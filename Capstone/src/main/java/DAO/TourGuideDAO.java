package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Tour;
import entity.TourGuide;
import sql.connection.DBConnection;

public class TourGuideDAO {
	public static List<TourGuide> getTourGuide() throws SQLException {
		Connection connection = DBConnection.makeConnection();
		Statement stmt = connection.createStatement();
		String sqlQuery = "SELECT * FROM tour_guide;";
		ResultSet resultSet = stmt.executeQuery(sqlQuery);

		List<TourGuide> list = new ArrayList<TourGuide>();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			String location = resultSet.getString("location");
			String imgName = resultSet.getString("img_name");

			TourGuide tourGuide = new TourGuide(id, name, location, imgName);
			list.add(tourGuide);

		}
		return list;

	}

}


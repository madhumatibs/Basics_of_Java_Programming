package jdbc;

import java.sql.*;
import java.util.Properties;

public class CoffeeDelete {
    public static void main(String[] args) {
        Connection dbConnection = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            String url = "jdbc:mysql://localhost:3306/test";
            Properties info = new Properties();
            info.put("user", "root");
            info.put("password", "MADHU@2005");

            dbConnection = DriverManager.getConnection(url, info);

            if (dbConnection != null) {
                System.out.println("Successfully connected to MySQL database test");
            }

            // SELECT query
            String query = "SELECT * FROM coffee";
            Statement st = dbConnection.createStatement();
            ResultSet rs = st.executeQuery(query);

            System.out.println("\nExisting Records:");
            while (rs.next()) {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int price = rs.getInt("price");

                System.out.println(id + ", " + coffee_name + ", " + price);
            }

            rs.close();
            st.close();

            // DELETE query
            String query3 = "DELETE FROM coffee WHERE id=?";
            PreparedStatement ps = dbConnection.prepareStatement(query3);

            ps.setInt(1, 264); // change ID as needed

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("\nRecord Deleted Successfully!");
            } else {
                System.out.println("\nNo record found with given ID.");
            }

            ps.close();
            dbConnection.close();

        } catch (Exception e) {
            System.err.println("Got an exception!");
            e.printStackTrace();
        }
    }
}
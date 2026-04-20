package coffeeInsert;

/*
Lab 11a. Read all the existing records from the table coffee which is from the database test
and insert a new coffee product into it
*/

/*
11a. Read all records from coffee table and insert a new record
*/



import java.sql.*;
import java.util.Properties;

public class CoffeeInsert {
    public static void main(String[] args) {
        try {
            Connection dbConnection = null;

            try {
                String url = "jdbc:mysql://localhost/test";
                Properties info = new Properties();
                info.put("user", "root");
                info.put("password", "MADHU@2005");

                dbConnection = DriverManager.getConnection(url, info);

                if (dbConnection != null) {
                    System.out.println("Successfully connected to MySQL database test");
                }
            } catch (SQLException ex) {
                System.out.println("An error occurred while connecting MySQL database");
                ex.printStackTrace();
            }

            // SELECT query
            String query = "SELECT * FROM coffee";
            Statement st = dbConnection.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String coffee_name = rs.getString("coffee_name");
                int price = rs.getInt("price");

                System.out.format("\n%d, %s, %d", id, coffee_name, price);
            }
            rs.close();

            // INSERT using PreparedStatement (correct way)
            String insertQuery = "INSERT INTO coffee (coffee_name, price) VALUES (?, ?)";
            PreparedStatement stmt = dbConnection.prepareStatement(insertQuery);

            stmt.setString(1, "Tajmahal");
            stmt.setInt(2, 950);

            stmt.executeUpdate();
            stmt.close();

            System.out.println("\nRecord inserted successfully!");

        } catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}


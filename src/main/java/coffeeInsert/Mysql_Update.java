package coffeeInsert;
import java.sql.*;
import java.util.Properties;

public class Mysql_Update {
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

                System.out.format("\n%d %s %d", id, coffee_name, price);
            }
            rs.close();

            // UPDATE query
            String query2 = "UPDATE coffee SET price = 950 WHERE id = 102";
            PreparedStatement preparedStmt1 = dbConnection.prepareStatement(query2);
            preparedStmt1.executeUpdate();
            preparedStmt1.close();

            System.out.println("\nRecord updated successfully!");

        } catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }
}

<%@ page import="java.sql.*" %>

<%
Connection con = null;
PreparedStatement ps = null;

try {
    // Load driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect to DB
    con = DriverManager.getConnection(
    		  "jdbc:mysql://localhost:3306/Employee",
        "root",
        "MADHU@2005"
    );

    // DELETE query
    String sql = "DELETE FROM Emp WHERE Emp_Name LIKE ?";
    ps = con.prepareStatement(sql);
    ps.setString(1, "S%");

    int rows = ps.executeUpdate();

    // Optional message (before redirect)
    System.out.println(rows + " record(s) deleted");

    // Redirect to report page
    response.sendRedirect("report.jsp");

} catch(Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
} finally {
    // Close resources safely
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>
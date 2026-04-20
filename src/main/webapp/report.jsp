<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/Employee",
        "root",
        "your_password"
    );

    stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM Emp");

    int total = 0;

    out.println("<h2>Salary Report</h2>");
    out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>");

    while(rs.next()) {
        int eno = rs.getInt("Emp_NO");
        String name = rs.getString("Emp_Name");
        int sal = rs.getInt("Basicsalary");

        total += sal;

        out.println("Emp_No : " + eno + "<br>");
        out.println("Emp_Name : " + name + "<br>");
        out.println("Basic : " + sal + "<br>");
        out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>");
    }

    out.println("<b>Grand Salary : " + total + "</b>");

} catch(Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (con != null) con.close();
}
%>
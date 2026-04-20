<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Employee","root","");

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM Emp WHERE Emp_Name LIKE 'R%'");

ResultSet rs = ps.executeQuery();

int total = 0;

out.println("<h2>Salary Report</h2>");
out.println("<hr>");

while(rs.next()) {
    int eno = rs.getInt(1);
    String name = rs.getString(2);
    int sal = rs.getInt(3);

    total += sal;

    out.println("Emp_No : " + eno + "<br>");
    out.println("Emp_Name : " + name + "<br>");
    out.println("Basic : " + sal + "<br>");
    out.println("<hr>");
}

out.println("<b>Grand Salary : " + total + "</b>");

rs.close();
ps.close();
con.close();
%>
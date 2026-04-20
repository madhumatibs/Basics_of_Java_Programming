<%@ page import="java.sql.*" %>
<%
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Employee","root","MADHU@2005");

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM Emp");

int total = 0;

out.println("<h2>Salary Report</h2>");

while(rs.next()) {
    int eno = rs.getInt(1);
    String name = rs.getString(2);
    int salary = rs.getInt(3);

    total += salary;

    out.println("Emp_No: " + eno + "<br>");
    out.println("Emp_Name: " + name + "<br>");
    out.println("Basic: " + salary + "<br>");
    out.println("<hr>");
}

out.println("Grand Salary: " + total);
%>
<%@ page import="java.sql.*" %>
<%
int eno = Integer.parseInt(request.getParameter("eno"));
String name = request.getParameter("ename");
int salary = Integer.parseInt(request.getParameter("salary"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Employee","root","");

PreparedStatement ps = con.prepareStatement(
"INSERT INTO Emp VALUES (?, ?, ?)");

ps.setInt(1, eno);
ps.setString(2, name);
ps.setInt(3, salary);

ps.executeUpdate();

out.println("Inserted Successfully!<br>");
out.println("<a href='report.jsp'>View Salary Report</a>");

ps.close();
con.close();
%>
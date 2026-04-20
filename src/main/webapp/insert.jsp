<%@ page import="java.sql.*" %>
<%
int eno = Integer.parseInt(request.getParameter("eno"));
String ename = request.getParameter("ename");
int salary = Integer.parseInt(request.getParameter("salary"));

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/Employee","root","password");

PreparedStatement ps = con.prepareStatement(
"INSERT INTO Emp VALUES (?, ?, ?)");

ps.setInt(1, eno);
ps.setString(2, ename);
ps.setInt(3, salary);

ps.executeUpdate();

out.println("Record Inserted Successfully!");
%>
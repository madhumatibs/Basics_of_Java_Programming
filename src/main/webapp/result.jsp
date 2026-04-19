<%--
10.a Build an Application to get Username, Email and Designation through JSP called index.jsp with
client sided validation and submit to the servlet called UserDataServlet and process all the fields with
server sided validation and display all the data through result.jsp with a link to move to the client side
--%>

<html>
<body>

<h2>User Details</h2>

<p>Username: <%= request.getAttribute("username") %></p>
<p>Email: <%= request.getAttribute("email") %></p>
<p>Designation: <%= request.getAttribute("designation") %></p>

<br>
<a href="index.jsp">Go Back</a>

</body>
</html>
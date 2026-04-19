<%--
10.b Build an Application to get Rollno, Studentname, Sub1, Sub2, Sub3, Sub4 and Sub5 through JSP
called index.jsp with client sided validation and submit to the servlet called ResultServlet and process all
the fields with server sided validation and display all the data along with result (Pass if all subjects
greater than 40%) and Average marks through result.jsp with a link to move to the client side
--%>

<html>
<body>

<h2>Student Result</h2>

<p>Roll No: <%= request.getAttribute("roll") %></p>
<p>Name: <%= request.getAttribute("name") %></p>

<p>Marks:
<%= request.getAttribute("s1") %>,
<%= request.getAttribute("s2") %>,
<%= request.getAttribute("s3") %>,
<%= request.getAttribute("s4") %>,
<%= request.getAttribute("s5") %>
</p>

<p>Average: <%= request.getAttribute("average") %></p>
<p>Result: <%= request.getAttribute("result") %></p>

<br>
<a href="index.jsp">Go Back</a>

</body>
</html>
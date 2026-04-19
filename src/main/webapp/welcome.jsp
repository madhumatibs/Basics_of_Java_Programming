<%--
7a. Build a Session Management using JSP program set with one minute session expiry time to
get your name through text box and press submit to display the message by greeting Hello your
name!. Check the expiry of the session after one minute.
--%>

<%
    String name = request.getParameter("username");

    if (name != null) {
        session.setAttribute("user", name);

        // Set session expiry to 60 seconds
        session.setMaxInactiveInterval(60);
    }

    String user = (String) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("expired.jsp");
        return;
    }
%>

<html>
<head>
    <title>Welcome</title>
</head>
<body>

<h2>Hello, <%= user %>!</h2>

<p>Session expires in 1 minute.</p>

<a href="welcome.jsp">Refresh</a>

</body>
</html>
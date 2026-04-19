<%--
9.c Build a Session Management using JSP program for getting session expiry time and your name
through text box and press submit to display the message by greeting Hello your name!.
Press the following link to check it within the set session time or wait to see the session expiry.
--%>

<%
    String name = request.getParameter("username");
    String timeStr = request.getParameter("time");

    if (name != null && timeStr != null) {
        int time = Integer.parseInt(timeStr);

        session.setAttribute("user", name);
        session.setMaxInactiveInterval(time);
    }

    String user = (String) session.getAttribute("user");

    if (user == null) {
%>
        <h2>Session Expired!</h2>
        <a href="input.jsp">Go Back</a>
<%
        return;
    }
%>

<html>
<body>

<h2>Hello, <%= user %>!</h2>

<p>Click below link within session time:</p>

<a href="check.jsp">Check Session</a>

<br><br>
<p><b>Wait for expiry time and click again to test session expiration.</b></p>

</body>
</html>
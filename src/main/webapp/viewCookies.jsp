<%--
7b. Construct a Cookie Management program using JSP to get the fields Name, Domain and Max
Expiry Age (in sec) and press the button Add Cookie for displaying the set cookie information.
Then it has to go to show the active cookie list when you press the link go to the active cookie list.
--%>

<%@ page import="javax.servlet.http.Cookie" %>

<html>
<head>
    <title>Active Cookies</title>
</head>
<body>

<h2>Active Cookie List</h2>

<%
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie c : cookies) {
%>
            <p>
                <b>Name:</b> <%= c.getName() %> <br>
                <b>Value:</b> <%= c.getValue() %> <br><br>
            </p>
<%
        }
    } else {
%>
        <p>No Cookies Found</p>
<%
    }
%>

<br>
<a href="cookieForm.jsp">Back</a>

</body>
</html>
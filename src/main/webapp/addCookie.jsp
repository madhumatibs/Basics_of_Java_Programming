<%--
7b. Construct a Cookie Management program using JSP to get the fields Name, Domain and Max
Expiry Age (in sec) and press the button Add Cookie for displaying the set cookie information.
Then it has to go to show the active cookie list when you press the link go to the active cookie list.
--%>

<%
    String name = request.getParameter("name");
    String domain = request.getParameter("domain");
    int age = Integer.parseInt(request.getParameter("age"));

    Cookie cookie = new Cookie(name, domain);

    cookie.setMaxAge(age); // expiry time
    response.addCookie(cookie);
%>

<html>
<head>
    <title>Cookie Added</title>
</head>
<body>

<h2>Cookie Added Successfully!</h2>

<p><b>Name:</b> <%= name %></p>
<p><b>Domain:</b> <%= domain %></p>
<p><b>Max Age:</b> <%= age %> seconds</p>

<br>
<a href="viewCookies.jsp">Go to Active Cookie List</a>

</body>
</html>
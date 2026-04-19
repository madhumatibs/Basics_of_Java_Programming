<%--
9.c Build a Session Management using JSP program for getting session expiry time and your name
through text box and press submit to display the message by greeting Hello your name!.
Press the following link to check it within the set session time or wait to see the session expiry.
--%>

<html>
<body>

<h2>Enter Details</h2>

<form action="check.jsp" method="post">
    Name: <input type="text" name="username" required><br><br>
    Expiry Time (sec): <input type="number" name="time" required><br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
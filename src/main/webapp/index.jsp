<%--
10.a Build an Application to get Username, Email and Designation through JSP called index.jsp with
client sided validation and submit to the servlet called UserDataServlet and process all the fields with
server sided validation and display all the data through result.jsp with a link to move to the client side
--%>

<html>
<head>
<script>
function validateForm() {
    let name = document.forms["form"]["username"].value;
    let email = document.forms["form"]["email"].value;
    let desig = document.forms["form"]["designation"].value;

    if (name == "" || email == "" || desig == "") {
        alert("All fields must be filled!");
        return false;
    }

    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!email.match(emailPattern)) {
        alert("Invalid Email!");
        return false;
    }

    return true;
}
</script>
</head>

<body>

<h2>User Form</h2>

<form name="form" action="user" method="post" onsubmit="return validateForm()">
    Username: <input type="text" name="username"><br><br>
    Email: <input type="text" name="email"><br><br>
    Designation: <input type="text" name="designation"><br><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
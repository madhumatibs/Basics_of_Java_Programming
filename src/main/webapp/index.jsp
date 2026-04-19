<%--
10.b Build an Application to get Rollno, Studentname, Sub1, Sub2, Sub3, Sub4 and Sub5 through JSP
called index.jsp with client sided validation and submit to the servlet called ResultServlet and process all
the fields with server sided validation and display all the data along with result (Pass if all subjects
greater than 40%) and Average marks through result.jsp with a link to move to the client side
--%>

<html>
<head>
<script>
function validateForm() {
    let fields = ["roll", "name", "s1", "s2", "s3", "s4", "s5"];

    for (let i of fields) {
        if (document.forms["form"][i].value == "") {
            alert("All fields required!");
            return false;
        }
    }

    return true;
}
</script>
</head>

<body>

<h2>Student Result Form</h2>

<form name="form" action="result" method="post" onsubmit="return validateForm()">
    Roll No: <input type="text" name="roll"><br><br>
    Name: <input type="text" name="name"><br><br>

    Sub1: <input type="number" name="s1"><br>
    Sub2: <input type="number" name="s2"><br>
    Sub3: <input type="number" name="s3"><br>
    Sub4: <input type="number" name="s4"><br>
    Sub5: <input type="number" name="s5"><br><br>

    <input type="submit" value="Calculate">
</form>

</body>
</html>
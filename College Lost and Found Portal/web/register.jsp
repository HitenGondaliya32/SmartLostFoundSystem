<%@ include file="dbconnect.jsp" %>
<%    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PreparedStatement ps = con.prepareStatement("INSERT INTO users(name,email,password) VALUES(?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.executeUpdate();
        out.println("<script>alert('Registered Successfully!');window.location='login.jsp';</script>");
    }
%>
<html>
    <head><title>Register</title></head>
    <body>
        <h2>Sign Up</h2>
        <form method="post">
            Name: <input type="text" name="name" required><br>
            Email: <input type="email" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" name="submit" value="Register" class="btn">
        </form>
        <a href="login.jsp">Already have account? Login</a>
    </body>
</html>
<link href="assets/style1.css" rel="stylesheet" type="text/css"/>
<%@ include file="dbconnect.jsp" %>
<%    if (request.getParameter("login") != null) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            session.setAttribute("email", email);
            session.setAttribute("name", rs.getString("name"));
            out.println("<script>alert('Login Successfully!');window.location='index.jsp';</script>");

        } else {
            out.println("<script>alert('Invalid Email or Password');</script>");
        }
    }
%>

<html>
    <head><title>Login</title></head>
    <body>
        <h2>Login</h2>
        <form method="post">
            Email: <input type="email" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" name="login" value="Login" class="btn">
        </form>
        <a href="register.jsp">Create New Account</a>
    </body>
</html>
<link href="assets/style1.css" rel="stylesheet" type="text/css"/>
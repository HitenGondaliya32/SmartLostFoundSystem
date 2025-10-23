<%
    String user = (String) session.getAttribute("name");
    if (user == null) {
        response.sendRedirect("register.jsp");
    }
%>

<html>
    <head><title>Home</title></head>
    <body>
        <h2>Welcome, <%=user%>!</h2>
        <a href="addItem.jsp">Add Lost/Found Item</a> | 
        <a href="viewItems.jsp">View All Items</a> | 
        <a href="login.jsp">Logout</a><link href="assets/style1.css" rel="stylesheet" type="text/css"/>
        <link href="assets/style1.css" rel="stylesheet" type="text/css"/>
    </body>
</html>

<%@ include file="dbconnect.jsp" %>
<%    String userEmail = (String) session.getAttribute("email");
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
    }
    if (request.getParameter("add") != null) {
        String item = request.getParameter("item_name");
        String desc = request.getParameter("description");
        String status = request.getParameter("status");
        String date = request.getParameter("date");

        PreparedStatement ps = con.prepareStatement("INSERT INTO items(item_name, description, status, date, user_email) VALUES(?,?,?,?,?)");
        ps.setString(1, item);
        ps.setString(2, desc);
        ps.setString(3, status);
        ps.setString(4, date);
        ps.setString(5, userEmail);
        ps.executeUpdate();
        out.println("<script>alert('Item Added Successfully!');window.location='viewItems.jsp';</script>");
    }
%>
<html>
    <head><title>Add Item</title></head>
    <body>
        <h2>Add Lost/Found Item</h2>
        <form method="post">
            Item Name: <input type="text" name="item_name" required><br>
            Description: <textarea name="description" required></textarea><br>
            Status:
            <select name="status" required>
                <option value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select><br>
            Date: <input type="date" name="date" required><br>
            <input type="submit" name="add" value="Add Item" class="btn">
        </form>
    </body>
    <link href="assets/style1.css" rel="stylesheet" type="text/css"/>
</html>

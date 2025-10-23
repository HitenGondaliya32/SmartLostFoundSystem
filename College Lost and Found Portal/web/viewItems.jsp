<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>

<html>
    <head>
        <title>View Items</title>
    </head>
    <body>
        <h2>All Items</h2>

        <table border="1" cellpadding="8">
            <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%    try {
                    Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lostfounddb", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM items");

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("item_name")%></td>
                <td><%= rs.getString("description")%></td>
                <td><%= rs.getString("status")%></td>
                <td>
                    <form action="deleteitem.jsp" method="post" onsubmit="return confirmDelete();">
                        <input type="hidden" name="id" value="<%= rs.getInt("id")%>">
                        <input type="submit" class="delete-btn" value="Delete">
                    </form>
                    <script>
                        function confirmDelete() {
                            return confirm("Are you sure you want to delete this item?");
                }</script>
                    <link href="assets/style1.css" rel="stylesheet" type="text/css"/>
                </td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e);
                }
            %>
        </table>

    </body>
</html>

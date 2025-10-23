<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>

<%   
    String idStr = request.getParameter("id");

    if (idStr != null) {
        try {
            int id = Integer.parseInt(idStr);

            Connection Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lostfounddb", "root", "");
            PreparedStatement ps = con.prepareStatement("DELETE FROM items WHERE id=?");

            ps.setInt(1, id);
            ps.executeUpdate();
            con.close();
            out.println("<script>alert('Item Delete Successfully!');window.location='viewItems.jsp';</script>");
            response.sendRedirect("viewItems.jsp");

        } catch (Exception e) {
            out.println("Error: " + e);
        }
    } else {
        out.println("Invalid item ID!");
    }
%>
<link href="assets/style1.css" rel="stylesheet" type="text/css"/>

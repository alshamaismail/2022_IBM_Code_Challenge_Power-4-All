<%-- 
    Document   : consumer_page
    Created on : 5 May, 2022, 6:13:12 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumer Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1>Welcome Consumer</h1>
        <hr>
        <a href="index.jsp" style="font-size: 16pt;"><em>Click here to Logout</em></a>
        <hr>
        <a href="complaint_reg.jsp" class="button">Complaint Registration</a>
        <a href="view_complaint.jsp" class="button">View Complaints</a>
        <% 
            String consumernumber=request.getParameter("consumernumber");
            session.setAttribute("consumernumber",consumernumber);
        %>
    </body>
</html>

<%-- 
    Document   : lineman_page
    Created on : 5 May, 2022, 7:10:49 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lineman Page</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <h1>Welcome</h1>
        <hr>
        <a href="index.jsp" style="font-size: 16pt;"><em>Click here to Logout</em></a>
        <hr>
        <a href="view_duties.jsp" class="button">View Duties</a>
        <% 
                String linemanid=request.getParameter("linemanid");
                session.setAttribute("linemanid",linemanid);
        %>
    </body>
</html>

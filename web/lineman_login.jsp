<%-- 
    Document   : lineman_login
    Created on : 5 May, 2022, 6:01:52 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumer Login</title>
        <style>
            div{margin: 5em 25em 5em 25em;}
        </style>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="border2">
            <h1>Login </h1>
            <form action="#" method="POST">
                <p>
                    <label>
                        <input name = "linemanid" type = "text" placeholder="Lineman ID" required/>
                    </label>
                </p>
                <p>
                    <label>
                        <input name = "password" type = "password" placeholder = "Password" required>
                    </label>
                </p>
                <p>
                    <input type = "submit" value = "Login">
                    <input type = "reset" value = "Clear">
                </p>
            </form>
            <%
                    if(request.getParameter("linemanid")!=null)
                    {
                        String linemanid=request.getParameter("linemanid");
                        String password=request.getParameter("password");
                        Class.forName("org.postgresql.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/electricityboard", "postgres", "@dbv_123");
                        PreparedStatement stmt=conn.prepareStatement("select * from lineman where lineman_id=? and password=?");

                        stmt.setString(1,linemanid);
                        stmt.setString(2,password);

                        ResultSet rs = stmt.executeQuery();
                        if(rs.next())
                        {
                                response.sendRedirect("lineman_page.jsp");
                        }
                        else
                        {%>
                            <p style="color: white;">Invalid Login Credentials</p>
                        <%}
                    }
                    
            %>
        </div>
    </body>
</html>
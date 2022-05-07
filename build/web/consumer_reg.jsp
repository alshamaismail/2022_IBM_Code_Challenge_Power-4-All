<%-- 
    Document   : consumer_reg
    Created on : 5 May, 2022, 5:57:17 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Consumer Registration</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="border2">
            <h1>New Consumer Registration</h1>
            <form action="#" method="POST">
                <p>
                    <label>
                        <input name = "consumernumber" type = "number" placeholder = "Consumer No." required>
                    </label>
                </p>
                <p>
                    <label>
                        <input name = "name" type = "text" placeholder = "Name" required>
                    </label>
                </p>
                <p>
                    <label>
                        <textarea name = "address" placeholder = "Address" required></textarea>
                    </label>
                </p>
                <p>
                    <label>
                        <input name = "mobile" type = "number" placeholder = "Mobile" required>
                    </label>
                </p>
                <p>
                    <label>
                        <input name = "locality" type = "text" placeholder="Locality" required>
                    </label>
                </p>
                <p>
                    <label>
                        <input name = "password" type = "password" placeholder = "Password" required>
                    </label>
                </p>
                <p>
                    <input type = "submit" value = "Register">
                    <input type = "reset" value = "Clear">
                </p>
            </form>
            <%
                if(request.getParameter("consumernumber")!=null)
                {
                    int consumernumber=Integer.parseInt(request.getParameter("consumernumber"));
                    String name=request.getParameter("name");
                    String address=request.getParameter("address");
                    long mobile=Long.parseLong(request.getParameter("mobile"));
                    String locality=request.getParameter("locality");
                    String password=request.getParameter("password");
                    try {
                        Class.forName("org.postgresql.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/electricityboard", "postgres", "@dbv_123");
                        PreparedStatement stmt=conn.prepareStatement("insert into consumer values(?,?,?,?,?,?)");
                        stmt.setInt(1,consumernumber);
                        stmt.setString(2,name);
                        stmt.setString(3,address);
                        stmt.setLong(4,mobile);
                        stmt.setString(5,locality);
                        stmt.setString(6,password);
                        int rows=stmt.executeUpdate();
                        if(rows>0)
                        {
                            out.println("<p>Registration successfull !!</p>");
                        }  
                        else
                        {
                            out.println("<p>Could Register !</p>");
                        }
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                    finally
                    {
                    }
                }
            %>
        </div>      
    </body>
</html>

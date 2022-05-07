<%-- 
    Document   : view_complaint
    Created on : 6 May, 2022, 5:19:19 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Complaints</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="border2">
            <h1>View Complaints</h1>
            <hr>
            <a href="index.jsp" style="font-size: 16pt;"><em>Click here to Logout</em></a>
            <hr>
            <table>
                <thead>
                    <tr> 
			<th>Complaint No</th> 
			<th>Complaint Type</th>
			<th>Complaint Date</th>
			<th>Complaint Time</th>
                    </tr>
                </thead>
                <%
                    int consumernumber = Integer.valueOf(session.getAttribute("consumernumber").toString());
                    Class.forName("org.postgresql.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/electricityboard","postgres","@dbv_123");
                    PreparedStatement stmt=conn.prepareStatement("SELECT * FROM COMPLAINT WHERE CONSUMER_NO=?");
                    stmt.setInt(1, consumernumber);
                    
                    ResultSet rs = stmt.executeQuery();
            
                    while(rs.next())
                    {
                %>
                <tbody>
                    <tr>
                        <td><%=rs.getInt("COMPLAINT_NO")%></td>
                        <td><%=rs.getString("COMPLAINT_TYPE")%></td>
                        <td><%=rs.getString("COMPLAINT_DATE")%></td> 
                        <td><%=rs.getString("COMPLAINT_TIME")%></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </body>
</html>
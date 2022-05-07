<%-- 
    Document   : view_duties
    Created on : 5 May, 2022, 8:48:19 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Duties</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <h1>View Duties</h1>
            <hr>
            <a href="index.jsp" style="font-size: 16pt;"><em>Click here to Logout</em></a>
            <hr>
            <table>
                <thead>
                    <tr> 
			<th>Complaint No</th> 
			<th>Consumer No</th>
			<th>Name</th>
			<th>Complaint Type</th>
                        <th>Address</th> 
			<th>Mobile</th>
			<th>Complaint Date</th>
			<th>Complaint Time</th>
                    </tr>
                </thead>
                <%
                    String linemanid=(String)(session.getAttribute("linemanid"));
                    out.println(linemanid);
                    Class.forName("org.postgresql.Driver");
                    Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/electricityboard","postgres","@dbv_123");
                    PreparedStatement stmt=conn.prepareStatement("SELECT c.COMPLAINT_NO, a.CONSUMER_NO, NAME, COMPLAINT_TYPE, ADDRESS, MOBILE, COMPLAINT_DATE, COMPLAINT_TIME FROM CONSUMER a, COMPLAINT b, DUTY c WHERE a.CONSUMER_NO=b.CONSUMER_NO AND b.COMPLAINT_NO=c.COMPLAINT_NO AND LINEMAN_ID=?");
                    stmt.setString(1, linemanid);
                    ResultSet rs = stmt.executeQuery();
            
                    while(rs.next())
                    {
                %>
                <tbody>
                    <tr>
                        <td><%=rs.getInt("COMPLAINT_NO")%></td>
                        <td><%=rs.getInt("CONSUMER_NO")%></td>
                        <td><%=rs.getString("NAME")%></td>
                        <td><%=rs.getString("COMPLAINT_TYPE")%></td> 
                        <td><%=rs.getString("ADDRESS")%></td>
                        <td><%=rs.getLong("MOBILE")%></td>
                        <td><%=rs.getString("COMPLAINT_DATE")%></td> 
                        <td><%=rs.getString("COMPLAINT_TIME")%></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </body>
</html>
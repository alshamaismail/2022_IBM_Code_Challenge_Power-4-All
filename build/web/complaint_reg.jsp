<%-- 
    Document   : complaint_reg
    Created on : 5 May, 2022, 6:16:09 PM
    Author     : DIVYA B VENUGOPAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Registration</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="border2">
            <form action="#" method="POST">
                <h1>Complaint</h1>
                <p>
                    <select class="select" name = "complaint">
			<option selected>Please Choose Complaint Type</option>
                        <option>NO POWER/CURRENT</option>
			<option>ELECTRIC POST RELATED</option>
			<option>ELECTRIC LINE RELATED</option>
			<option>METER RELATED</option>
                    </select>
		</p>
                <p>
                    <input type = "submit" value = "Submit Complaint">
                    <input type = "reset" value = "Clear">
                </p>
            </form>
            <%
                if(request.getParameter("complaint")!=null)
                {
                    int consumernumber = Integer.valueOf(session.getAttribute("consumernumber").toString());
                    String complaint = request.getParameter("complaint");
                    try {
                        Class.forName("org.postgresql.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/electricityboard", "postgres", "@dbv_123");
                        PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO complaint(CONSUMER_NO,COMPLAINT_TYPE,COMPLAINT_DATE,COMPLAINT_TIME) VALUES(?,?,CURRENT_DATE,CURRENT_TIME)");
                        stmt1.setInt(1, consumernumber);
                        stmt1.setString(2, complaint);
                        int rows1=stmt1.executeUpdate();
                          
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT COMPLAINT_NO FROM COMPLAINT WHERE CONSUMER_NO=? ORDER BY COMPLAINT_NO DESC LIMIT 1;");
                        stmt2.setInt(1, consumernumber);
                        ResultSet rs1 = stmt2.executeQuery();
                        int complaintno=0;
                        while(rs1.next())
                        {
                            complaintno=rs1.getInt("COMPLAINT_NO");
                        }
                        
                        PreparedStatement stmt3 = conn.prepareStatement("SELECT LOCALITY FROM CONSUMER WHERE CONSUMER_NO=?");
                        stmt3.setInt(1, consumernumber);
                        ResultSet rs2 = stmt3.executeQuery();
                        String locality="";
                        while(rs2.next())
                        {
                            locality=rs2.getString("LOCALITY");
                        }
                        
                        PreparedStatement stmt4 = conn.prepareStatement("INSERT INTO DUTY(LINEMAN_ID, COMPLAINT_NO) VALUES((SELECT a.LINEMAN_ID FROM (SELECT LINEMAN_ID FROM LINEMAN,CONSUMER WHERE LINEMAN.LOCALITY=?)a LEFT JOIN (SELECT LINEMAN_ID,COUNT(LINEMAN_ID) AS COUNT_DUTIES FROM DUTY GROUP BY LINEMAN_ID ORDER BY COUNT(LINEMAN_ID))b ON a.LINEMAN_ID=b.LINEMAN_ID ORDER BY COUNT_DUTIES LIMIT 1),(SELECT ? FROM COMPLAINT WHERE CONSUMER_NO=? ORDER BY COMPLAINT_NO DESC LIMIT 1))");
                        stmt4.setString(1, locality);
                        stmt4.setInt(2, complaintno);
                        stmt4.setInt(3, consumernumber);
                        int rows2=stmt4.executeUpdate();
                        
                        if(rows1>0 && rows2>0)
                        {
                            out.println("<h1>Complaint Registered</h1>");
                        }  
                        else
                        {
                            out.println("<h3>Error!!</h3>");
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

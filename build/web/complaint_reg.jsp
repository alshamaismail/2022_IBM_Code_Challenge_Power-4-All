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
                <hr>
                <a href="index.jsp" style="font-size: 16pt;"><em>Click here to Logout</em></a>
                <hr>
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
                          
                        
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT LOCALITY FROM CONSUMER WHERE CONSUMER_NO=?");
                        stmt2.setInt(1, consumernumber);
                        ResultSet rs1 = stmt2.executeQuery();
                        String locality="";
                        while(rs1.next())
                        {
                            locality=rs1.getString("LOCALITY");
                        }
                   
                        PreparedStatement stmt3 = conn.prepareStatement("INSERT INTO DUTY(LINEMAN_ID, COMPLAINT_NO) WITH t1 AS(SELECT a.LINEMAN_ID,(SELECT CASE WHEN b.COUNT_DUTIES IS NULL THEN 0 ELSE COUNT_DUTIES END AS COUNT_DUTIES )FROM (SELECT LINEMAN_ID FROM LINEMAN,CONSUMER WHERE lower(LINEMAN.LOCALITY)=lower(?))a LEFT JOIN (SELECT LINEMAN_ID,COUNT(LINEMAN_ID) AS COUNT_DUTIES FROM DUTY GROUP BY LINEMAN_ID ORDER BY COUNT(LINEMAN_ID))b ON a.LINEMAN_ID=b.LINEMAN_ID ORDER BY COUNT_DUTIES LIMIT 1), t2 AS(SELECT COMPLAINT_NO FROM COMPLAINT WHERE CONSUMER_NO=? ORDER BY COMPLAINT_NO DESC LIMIT 1) SELECT t1.LINEMAN_ID, t2.COMPLAINT_NO FROM t1,t2");
                        stmt3.setString(1, locality);
                        stmt3.setInt(2, consumernumber);
                        int rows2=stmt3.executeUpdate();
                        
                        if(rows1>0 && rows2>0)
                        {
                            out.println("<p>Complaint Registered</p>");
                        }  
                        else
                        {
                            out.println("<p>Error!!</p>");
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
<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("Username");
	String station = request.getParameter("listofstations");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
 	rs = st.executeQuery("select * from personCustomerEmployee p, trainHas h, trainSchedule s,stations t where h.trainScheduleID = s.trainScheduleID and p.username = '" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update stations set stationName='" + station +"' where username='"+ userid+"'");
    	out.println("The new station name has been updated<br>");
    	out.println("<a href='EditTrainSchedule4.jsp'>Return to make more changes</a><br>");
    	
    }
    else{
    out.println("Invalid Entry! <a href='EditTrainSchedule4.jsp'> Try Again</a>");
    }
    
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>
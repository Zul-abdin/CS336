<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("Username");
	String street = request.getParameter("StreetName");
	String city = request.getParameter("City");
	String state = request.getParameter("State");
	String zipcode = request.getParameter("ZipCode");
	Connection con = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
		
	}
	catch (Exception e){
			e.printStackTrace();
			
	}
	Statement st = con.createStatement();
	ResultSet rs;
 	
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update personCustomerEmployee set streetName='" + street + "' ,city='" + city+ "' ,state='" + state + "',zipCode='" +zipcode+ "' where username='"+ userid+"'");
    	response.sendRedirect("editaddresschanged.jsp");
    }
    else{
    out.println("This username does not exist! <a href='enterusername.jsp'> Try Again</a>");
    }
    
%>

<%
	rs.close();
	st.close();
	con.close();
%>

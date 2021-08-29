<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>

<html>
<head><title> Login Authentication</title></head>
<body background="background.jpg">
<hr color=#bb055E>

<% 
	    
     String acc = request.getParameter("account").trim();
     String pass = request.getParameter("upass").trim();
     

	 try { 
 // Class.forName("oracle.jdbc.driver.OracleDriver");
  //Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
           String accno=" ";
		  PreparedStatement ps=con.prepareStatement("select username from users where password=?");
		  ps.setString(1,pass);
		  ResultSet rs=ps.executeQuery();
		  if(rs.next())
		  {
			  accno=rs.getString(1);
		  }
		  if(accno.equals("admin"))
			response.sendRedirect("home.htm");
		else if(accno.equalsIgnoreCase(acc))
			response.sendRedirect("home_client.htm");	
		  else
				out.println("<html><body bgcolor=pink><h2>Not Successful");
	
		   ps.close();
           con.close();
         } catch (Exception e) {out.println("error"+e);}  
	 	 
		 %>

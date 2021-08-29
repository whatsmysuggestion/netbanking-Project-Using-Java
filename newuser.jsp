<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>

<html>
<head><title> Login Authentication</title></head>
<body background="background.jpg">
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=1,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:120px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top>Online Net Banking Solutions For Life Time</td></tr></table>
<hr color=#bb055E>

<% 
	    
     String uname = request.getParameter("account").trim();
     String pass = request.getParameter("upass").trim();
     String repass = request.getParameter("repass").trim();
	 if(pass.equalsIgnoreCase(repass)) {

    try { 
 // Class.forName("oracle.jdbc.driver.OracleDriver");
 // Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
           int accno=-1;
		  PreparedStatement ps=con.prepareStatement("INSERT INTO USERS VALUES(?,?)");
		  ps.setString(1,uname);
		  ps.setString(2,pass);
		  int n=ps.executeUpdate();
		  if(n>0){ 
			  out.println("User Successfully Registered");
			  out.println("<a href='login.html'>Back to Login</a>");}
		  ps.close();
          con.close();
         } catch (Exception e) {out.println("error"+e);}  
	 }
	 %>

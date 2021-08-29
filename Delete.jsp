<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>

<body id=body>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:50px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>
<%
    String accno=request.getParameter("account");
	String custcode=request.getParameter("custcode");

    try { 
//  Class.forName("oracle.jdbc.driver.OracleDriver");
 // Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
		  PreparedStatement pst=con.prepareStatement("Delete from customers where cust_code=?");
		  pst.setString(1,custcode);
		  int n1=pst.executeUpdate();

             // Connection con1= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 
Connection con1=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
		  PreparedStatement ps=con1.prepareStatement("delete from accounts where account_no=?");
		  ps.setString(1,accno);
		  int n=ps.executeUpdate();


		  if(n>0 && n1>0)
			  out.println("<html><body color='pink'><h2>Deleted</html>");
		  else
			  out.println("<html><body color='pink'><h2>not</body></html>");
	}catch(Exception e){out.println("Error"+e);}
	%>

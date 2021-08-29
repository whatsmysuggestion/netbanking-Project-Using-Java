<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%  
	String accno=request.getParameter("accno").trim();
	String ddcheq=request.getParameter("ddcheq").trim();
	String payee=request.getParameter("payee").trim();
	String drawnon=request.getParameter("drawnon").trim();
	String ddcheqno = request.getParameter("ddcheqno").trim();
	float amount = Float.parseFloat(request.getParameter("amount").trim());
	String deliv= request.getParameter("deliv").trim();
	String payeedno= request.getParameter("payeedno").trim();
	String payeestr= request.getParameter("payeestr").trim();
	String payeearea= request.getParameter("payeearea").trim();
	String payeecity= request.getParameter("payeecity").trim();
	String payeepin=request.getParameter("payeepin").trim();
	String status=request.getParameter("status").trim();

	Connection con=null;
	PreparedStatement pst=null;
	Statement sst=null;
	ResultSet rs=null;
	try {
//  Class.forName("oracle.jdbc.driver.OracleDriver");
//con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
		String cmd="INSERT INTO DRAFT_CHEQUE VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pst=con.prepareStatement(cmd);
	    pst.setString(1,accno);
		pst.setString(2,ddcheq);
		pst.setString(3,payee);
		pst.setString(4,drawnon);
		pst.setString(5,ddcheqno);
		pst.setFloat(6,amount);
		pst.setString(7,deliv);
		pst.setString(8,payeedno);
		pst.setString(9,payeestr);
		pst.setString(10,payeearea);
		pst.setString(11,payeecity);
		pst.setString(12,payeepin);
		pst.setString(13,status);
		pst.execute();
		sst=con.createStatement();
		rs=	sst.executeQuery("Select * from draft_cheque");
    	out.println("<h1>Record Inserted</h1>");
		out.println("<h4><a href=\"javascript:self.close()\">Back to Home Page</a></h4>");
	} catch(Exception e)	{
			out.println("<br><h1>Error Occured</h1>"+e);}
%>
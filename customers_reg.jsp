<%@ page import="java.sql.*,java.util.*"%>
<%  
   String type=(String)session.getAttribute("account");
   //String type=request.getParameter("account").toLowerCase();
   String top="";

 %>
<HTML>
<HEAD>
<body id=body>
<TITLE> SavingsAccount </TITLE>
<SCRIPT Language="JavaScript" Purpose="Dom" Runat="Browser" SRC="validate.js"></SCRIPT>
<SCRIPT Language="VBScript" Purpose="Dom" Runat="Browser" SRC="warn.vbs"></SCRIPT>
<SCRIPT Language="JavaScript">onload=function() {
elementEffect();
document.getElementById('grad').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px;height:60px";
document.getElementById('body').style.cssText="margin:0px;background:floralwhite";}
</script>
<Table width=100% cellspacing=0 cellpadding=0><TR><Td id=grad valign=top align=center>Online Net Banking Solutions For Life Time</td></tr></table>
</HEAD>
<fieldset><legend align=center>Register Form</legend><br>
<table id=register align ="center" width=200 cellspacing=0 cellpadding=2><form action='customers.jsp' method='post' onsubmit="return validate(this)">
<% 
   int custcode=10;
   try { 
//  Class.forName("oracle.jdbc.driver.OracleDriver");
 // Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:netbank","root","root");
    Statement st=con.createStatement();
	ResultSet rs=null;
    PreparedStatement pst=null;
    rs=st.executeQuery("select accno,max(cust_code) from auto group by accno");
    if(rs.next()) {
	custcode=rs.getInt(2);
	custcode+=1;
    pst=con.prepareStatement("update auto set cust_code=? where accno=?"); 
	pst.setInt(1,custcode);
	pst.setInt(2,rs.getInt(1)+1);
    pst.execute();
	} else custcode=1000;
	top="cd"+custcode;
   }catch(Exception e){	out.println("Error Occured" +e);	}
%>
<Tr><Td colspan=4 align=right><a href="nomine.jsp" style="font-size:15px">Nominee Details</a></td></tr>		
<tr><td align=right nowrap>Customer Code:</td><td><input type="text" name="customercode" value='<%=top%>' maxlength=7 readonly></td><td align=right nowrap>Profession</td><td><input type="text" name="profession" value=""></td></tr>
	    <tr><td align=right nowrap>Applicant No</td><td><input type="text" name="applnum" value="" maxlength=1 onkeypress="return blockkey(this)"></td><td align=right nowrap>Organization</td><td><input type="text" name="orgni" value=""></td></tr>
        <tr><td align=right nowrap>Account No</td><td><input type="text" name="accnum" value="<%=type%>" maxlength=8 readonly></td><td align=right nowrap>Working Since</td><td nowrap><input type="text" name="worksin" value="">*dd-mmm-yy</td></tr>
		<tr><td align=right nowrap>Second Account No</td><td><input type="text" name="secondappno" value="" maxlength=8>(optional)</td><td align=right nowrap>Designation</td><td><input type="text" name="designation" value=""></td></tr>
		<tr><td align=right nowrap>Cust FirstName</td><td><input type="text" name="ftname" value=""></td><td align=right nowrap>OFF Door_No</td><td><input type="text" name="offdoorno" value=""></td></tr>
		<tr><td align=right nowrap>Cust MiddleName</td><td><input type="text" name="midname" value=""></td><td align=right nowrap>OFF Street</td><td><input type="text" name="offstreet" value=""></td></tr>
		<tr><td align=right nowrap>Cust LastName</td><td><input type="text" name="lstname" value=""></td><td align=right nowrap>OFF Area</td><td><input type="text" name="offarea" value=""></td></tr>
        <tr><td align=right nowrap>House No</td><td><input type="text" name="houseno" value=""></td><td align=right nowrap>OFF City</td><td><input type="text" name="offcity" value=""></td></tr>
        <tr><td align=right nowrap>Street1</td><td><input type="text" name="street1" value=""></td><td align=right nowrap>OFF Pin</td><td><input type="text" name="offpin" value="" maxlength=6></td></tr>
		<tr><td align=right nowrap>Street2</td><td><input type="text" name="street2" value=""></td>		<td align=right nowrap>OFF State Code </td><td><input type="text" name="offstatecd" value="" maxlength=2></td></tr>
        <tr><td align=right nowrap>Area</td><td><input type="text" name="area" value=""></td><td align=right nowrap>OFF Phone_No</td><td><input type="text" name="offphone" value=""></td></tr>
        <tr><td align=right nowrap>City</td><td><input type="text" name="city" value=""></td><td align=right nowrap>Pan Girn</td><td><input type="text" name="pangrin" value=""></td></tr>
        <tr><td align=right nowrap>Pin No</td><td><input type="text" name="pin" value="" maxlength=6></td><td align=right nowrap>Gender</td><td><select name="gender"><option value="m">Male<option value="f">Female</select></td></tr>
        <tr><td align=right nowrap>State Code</td><td><input type="text" name="statecd" value="" maxlength=2></td><td align=right nowrap>Birth Date</td><td><input type="text" name="datebirth" value="">*dd-mmm-yy</td></tr>
        <tr><td align=right nowrap>Res Phone</td><td><input type="text" name="resphn" value=""></td>		<td align=right nowrap>Marital Status</td><td><select name="marstatus"><option value="m">Married<option value="u">Unmarried</select></td></tr>
        <tr><td align=right nowrap>Cell Phone</td><td><input type="text" name="cellphn" value=""></td>		<td align=right nowrap>Relation Ship</td><td><input type="text" name="relshipapp" value=""></td></tr></tr>
        <tr><td align=right nowrap>E-Mail</td><td><input type="email" name="email" value=""></td>		<td align=right nowrap>Educational Qualification</td><td><input type="text" name="eduquali" value=""></td></tr>
        <tr><td align=right nowrap>No Years Residing At</td><td><input type="text" name="noyersadds" value="" maxlength=2 onkeypress="return blockkey(this)"></td>		<td align=right nowrap>Montly Income</td><td><input type="text" name="monthincome" value="" maxlength=6 onkeypress="return blockkey(this)"></td></tr>
		<td align=right nowrap>GuardianName</td><td><input type="text" name="garname" value=""></td><td align=center nowrap colspan=2><button type="submit" accesskey="S"><u>S</u>ubmitt</button>&nbsp;&nbsp;<button type="reset" accesskey="R"><u>R</u>eset</button></td><td></td></tr>
		</td></tr></form></table>
		<script>setColor();</script>
</BODY>
</HTML>

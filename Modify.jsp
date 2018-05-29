<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" import="java.sql.*" import="java.time.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
     <%Class.forName("oracle.jdbc.driver.OracleDriver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modification Page </title>
</head>


<style>
body {
   margin:0;
   padding:0;
   height:100%;
   text-align:center;
    align:center;
    background:oldlace;
}
#container {
   min-height:100%;
   position:relative;
}
#header {
   background:#006699;
   color:white;
   padding:10px;
}
#body {
   padding:10px;
   padding-bottom:60px;   /* Height of the footer */
}
#footer {
   position:absolute;
   bottom:0;
   width:100%;
   height:40px;   /* Height of the footer */
   color:white;
   background:#006699;
}
input[type=text], select {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 10%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: 	#228B22;
}



</style>

<BODY>

<div id="container">
   <div id="header">
   <h1>Train Reservation System</h1>
   </div>
<div id="body">
<%
String dates = request.getParameter("Selectdate");


	
	Date today = new Date();
	SimpleDateFormat Date_Format =new SimpleDateFormat("yyyy-MM-dd");
	String yyyymmddtoday =Date_Format.format(today);
	
	%>
	<%=today %><BR>
	Modify the reservation on which date you want to travel<BR>
	<form>
 <input type="date" id="Selectdate" name="Selectdate" min="<%=yyyymmddtoday %>"><p id="lblSelectdate" style="color:red;"></p>
<input type='submit'>
</form>


<% 
	String ssnc = (String)session.getAttribute("ssnc");
	
    if(ssnc != null ){%>
	<%=runQuery(ssnc)%>
	<%} 
	
	 if(dates!= null ){%>
	<%=runQuery1(ssnc,dates)%>
	<%} %>
	
</div>
<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
</body>
</html>



<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery(String ssn) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     String command = null;
     String command1 =  null;
     String command2 = null;
     String command3 =  null;
     String command4 =  null;
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        
        command = ("UPDATE SEAT_STATUS SET Seats_available = 1 + (SELECT DISTINCT seats_available FROM SEAT_STATUS WHERE S_Train_id = (SELECT S_TRAIN_ID FROM SEAT_STATUS WHERE S_SSN='"+ssn+"') AND DATES=(SELECT DATES FROM SEAT_STATUS WHERE S_SSN='"+ssn+"')) WHERE S_Train_id = (SELECT S_TRAIN_ID FROM SEAT_STATUS WHERE S_SSN='"+ssn+"') AND DATES=(SELECT DATES FROM SEAT_STATUS WHERE S_SSN='"+ssn+"')");
        stmt.executeUpdate(command);
        command1 = ("UPDATE SEAT_STATUS SET STATUS='AVAILABLE', S_SSN =null WHERE S_SSN='"+ssn+"' AND STATUS='BOOKED'");
        stmt.executeUpdate(command1);
       
        //command4 = ("DELETE FROM PAYMENT WHERE STATUS ='error'");
       // stmt.executeUpdate(command4);
	 return ("<p> </p>");     
        
       	
     } 
     catch (SQLException e)
     { 
         return ("<P> SQL error: <PRE> " + e + " </PRE> </P>\n");
     } 
     finally {
         if (rset!= null) rset.close(); 
         if (stmt!= null) stmt.close();
         if (conn!= null) conn.close();
     }
  }



%>


<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery1(String ssn,String dates) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     StringBuffer sb = new StringBuffer();
     int temp=0;
     int count;
try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        
     	rset =stmt.executeQuery("SELECT COUNT(*) FROM SEAT_STATUS WHERE STATUS ='AVAILABLE' AND S_Train_id=(SELECT P_Train_id FROM PASSENGER WHERE ssn='"+ssn+"') AND dates =TO_DATE('"+dates+"','YYYY/MM/DD')");
       	while(rset.next()){
     	temp=rset.getInt(1);
       	}
        int seat_no = ((5-temp)+1);
        String command = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID=(SELECT P_Train_id FROM PASSENGER WHERE ssn='"+ssn+"') AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no);
        
        stmt.executeUpdate(command);
        int seats_available = (temp-1);
        
        String command1 = ("UPDATE SEAT_STATUS SET Seats_available='"+seats_available+"' WHERE S_TRAIN_ID=(SELECT P_Train_id FROM PASSENGER WHERE ssn='"+ssn+"') AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD')");
        stmt.executeUpdate(command1);
        
    
        
        return ("<p>your reservation has been modified</p>");
        
        
	       
       	
     } 
     catch (SQLException e)
     { 
         return ("<P> SQL error: <PRE> " + e + " </PRE> </P>\n");
     } 
     finally {
         if (rset!= null) rset.close(); 
         if (stmt!= null) stmt.close();
         if (conn!= null) conn.close();
     }
  }



%>



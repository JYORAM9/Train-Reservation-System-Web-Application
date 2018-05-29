<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation Page</title>
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
    width: 50%;
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

String ssn31=(String)session.getAttribute("ssn31");
String ssn32=(String)session.getAttribute("ssn32");
String ssn33=(String)session.getAttribute("ssn33");
String ssn21=(String)session.getAttribute("ssn21");
String ssn22=(String)session.getAttribute("ssn22");
String ssn11=(String)session.getAttribute("ssn11");

String fname31=(String)session.getAttribute("fname31");
String fname32=(String)session.getAttribute("fname32");
String fname33=(String)session.getAttribute("fname33");
String fname21=(String)session.getAttribute("fname21");
String fname22=(String)session.getAttribute("fname22");
String fname11=(String)session.getAttribute("fname11");



String temp = (String)session.getAttribute("seatno");

int seatnos=Integer.parseInt(temp);
 
String train_id= (String)session.getAttribute("train_id");




String dates= (String)session.getAttribute("dates");
Integer ticket_no=(Integer)session.getAttribute("ticket");

String arrtime=(String)session.getAttribute("arrtime");
String deptime=(String)session.getAttribute("deptime");
String source=(String)session.getAttribute("source");
String destination=(String)session.getAttribute("destination");

 if(seatnos==1){%>
				<B> <%= runQuery1(train_id,ssn11,dates)%> </B>
			<%} 
            if(seatnos==2){%>
        		<B> <%= runQuery2(train_id,ssn21,ssn22,dates)%> </B>
        	<%} 
			if(seatnos==3){%>
              	<B> <%= runQuery3(train_id,ssn31,ssn32,ssn33,dates)%> </B>
        	<%} 
        	
        	 if(seatnos==1){%>%>
<%
ResultSet rset1=null;
Connection conn = null; 
Statement stmt = null; 
ResultSet rset=null;
int seatno11=0;
try {
	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
    stmt = conn.createStatement();
    rset = stmt.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn11+"'");
		while(rset.next()){
			seatno11=rset.getInt(1);
		}
		 if (rset!= null) rset.close();
 } 
 catch (SQLException e)
 { 
     e.printStackTrace();
 } 
%>



<b >CONFIRMED </b> 
<b >Date:</b><%out.print(dates); %><br>
<b >Ticket Number :</b><%out.print(ticket_no); %><br><BR>
<b>TRAIN DETAILS</b><br>

<table style="width:100%" border="1">
<tr>
<th>Passenger Name</th>
<th>Train_id</th>
<th>Source</th>
<th>Destination</th>
<th>Arrival time</th>
<th>Departure time</th>
<th>Seat Number</th>
</tr>

<tr>
<th><% out.print(fname11);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno11); %></th>

</tr>
</table>
<%} 



 if(seatnos==2){%>

<b >CONFIRMED </b> 
<b >Date:</b><%out.print(dates); %><br>
<b >Ticket Number :</b><%out.print(ticket_no); %><br><BR>
<b>TRAIN DETAILS</b><br>

<%
Connection conn = null; 
Statement stmt = null; 
Statement stmt1 = null; 
ResultSet rset=null;
ResultSet rset1=null;
int seatno21=0;
int seatno22=0;
try {
	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
    stmt = conn.createStatement();
    stmt1 = conn.createStatement();
    rset = stmt.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn21+"'");
    rset1 = stmt1.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn22+"'");
		while(rset.next()){
			seatno21=rset.getInt(1);
		}
		
		while(rset1.next()){
			seatno22=rset1.getInt(1);
		}
		 
 } 
 catch (SQLException e)
 { 
     e.printStackTrace();
 } 
%>

<table style="width:100%" border="1">
<tr>
<th>Passenger Name</th>
<th>Train_id</th>
<th>Source</th>
<th>Destination</th>
<th>Arrival time</th>
<th>Departure time</th>
<th>Seat Number</th>
</tr>


<tr>
<th><% out.print(fname21);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno21); %></th>


</tr>

<tr>
<th><% out.print(fname22);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno22); %></th>


</tr>
</table>

<%}



 if(seatnos==3){%>


<%
Connection conn = null; 
Statement stmt = null; 
Statement stmt1 = null; 
Statement stmt2 = null; 
ResultSet rset=null;
ResultSet rset1=null;
ResultSet rset2=null;
int seatno31=0;
int seatno32=0;
int seatno33=0;
try {
	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
    stmt = conn.createStatement();
    stmt1 = conn.createStatement();
    stmt2 = conn.createStatement();
    rset = stmt.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn31+"'");
    rset1 = stmt1.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn32+"'");
    rset2 = stmt2.executeQuery ("SELECT SEAT_NO FROM SEAT_STATUS WHERE S_SSN ='"+ssn33+"'");
		while(rset.next()){
			seatno31=rset.getInt(1);
		}
		
		while(rset1.next()){
			seatno32=rset1.getInt(1);
		}
		
		while(rset2.next()){
			seatno33=rset2.getInt(1);
		}
		
 } 
 catch (SQLException e)
 { 
     e.printStackTrace();
 } 
%>


<b >CONFIRMED </b> 
<b >Date:</b><%out.print(dates); %><br>
<b >Ticket Number :</b><%out.print(ticket_no); %><br><BR>
<b>TRAIN DETAILS</b><br>
<table style="width:100%" border="1">
<tr>
<th>Passenger Name</th>
<th>Train_id</th>
<th>Source</th>
<th>Destination</th>
<th>Arrival time</th>
<th>Departure time</th>
<th>Seat Number</th>
</tr>


<tr>
<th><% out.print(fname31);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno31); %></th>

</tr>

<tr>
<th><% out.print(fname32);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno32); %></th>


</tr>


<tr>
<th><% out.print(fname33);%></th>
<th><%out.print(train_id);%></th>
<th><%out.print(source); %></th>
<th><%out.print(destination); %></th>
<th><%out.print(arrtime); %></th>
<th><%out.print(deptime); %></th>
<th><%out.print(seatno33); %></th>


</tr>

</table>

<%}%>


</div>






<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
</body>
</html>






<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery1(String train_id,String ssn,String dates) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
    int temp=0;
     ResultSet rset = null;
     ResultSet rset1 = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
      
     	rset =stmt.executeQuery("SELECT COUNT(*) FROM SEAT_STATUS WHERE STATUS ='AVAILABLE' AND S_Train_id='"+train_id+"' AND dates =TO_DATE('"+dates+"','YYYY/MM/DD')");
       	while(rset.next()){
     	temp=rset.getInt(1);
       	}
        int seat_no = ((5-temp)+1);
        String command = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no);
        
        stmt.executeUpdate(command);
        
        int seats_available = (temp-1);
       
        String command1 = ("UPDATE SEAT_STATUS SET Seats_available='"+seats_available+"' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD')");
        stmt.executeUpdate(command1);
        
        return ("<p>no of rows inserted is 1</p>");
        
        
	       
       	
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
<%! private String runQuery2(String train_id,String ssn1,String ssn2, String dates) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
    int temp=0;
     ResultSet rset = null;
     ResultSet rset1 = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
      
     	rset =stmt.executeQuery("SELECT COUNT(*) FROM SEAT_STATUS WHERE STATUS ='AVAILABLE' AND S_Train_id='"+train_id+"' AND dates =TO_DATE('"+dates+"','YYYY/MM/DD')");
       	while(rset.next()){
     	temp=rset.getInt(1);
       	}
        int seat_no = ((5-temp)+1);
        String command = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn1+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no);
        
        stmt.executeUpdate(command);
        
        int seat_no1 = ((5-temp)+2);
        
		String command1 = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn2+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no1);
       
        stmt.executeUpdate(command1);
        
        int seats_available = (temp-2);
       
        String command2 = ("UPDATE SEAT_STATUS SET Seats_available='"+seats_available+"' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD')");
        stmt.executeUpdate(command2);
        
        
        
        return ("<p>no of rows inserted is 1</p>");
        
        
	       
       	
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
<%! private String runQuery3(String train_id,String ssn1,String ssn2,String ssn3,String dates) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
    int temp=0;
     ResultSet rset = null;
     ResultSet rset1 = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
      
     	rset =stmt.executeQuery("SELECT COUNT(*) FROM SEAT_STATUS WHERE STATUS ='AVAILABLE' AND S_Train_id='"+train_id+"' AND dates =TO_DATE('"+dates+"','YYYY/MM/DD')");
       	while(rset.next()){
     	temp=rset.getInt(1);
       	}
        int seat_no = ((5-temp)+1);
        String command = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn1+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no);
        
        stmt.executeUpdate(command);
        int seat_no1 = ((5-temp)+2);
 		String command1 = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn2+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no1);
        
        stmt.executeUpdate(command1);
        int seat_no2 = ((5-temp)+3);
		String command2 = ("UPDATE SEAT_STATUS SET S_SSN='"+ssn3+"' , STATUS = 'BOOKED' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD') AND seat_no="+seat_no2);
        
        stmt.executeUpdate(command2);
        
        int seats_available = (temp-3);
       
        String command3 = ("UPDATE SEAT_STATUS SET Seats_available='"+seats_available+"' WHERE S_TRAIN_ID='"+train_id+"' AND DATES=TO_DATE('"+dates+"','YYYY/MM/DD')");
        stmt.executeUpdate(command3);
        
        return ("<p>no of rows inserted is 1</p>");
        
        
	       
       	
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
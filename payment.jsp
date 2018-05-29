<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page language="java" import="java.sql.*" import="java.time.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Passenger Details Page</title>


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
   padding-bottom:100px;   /* Height of the footer */
}
#footer {
   position:absolute;
   bottom:0;
   width:100%;
   height:40px;   /* Height of the footer */
   color:white;
   background:#006699;
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
</head>

<BODY>

<div id="container">
   <div id="header">
   <h1>Train Reservation System</h1>
   </div>
<div id="body">


<%
String ssn = null;
ssn= (String)session.getAttribute("ssn");
String name = request.getParameter("Name");
	String credit_number = request.getParameter("Credit_number");
	String mode= request.getParameter("Mode");
	String ssn31=(String)session.getAttribute("ssn31");
	String ssn32=(String)session.getAttribute("ssn32");
	String ssn33=(String)session.getAttribute("ssn33");
	String ssn21=(String)session.getAttribute("ssn21");
	String ssn22=(String)session.getAttribute("ssn22");
	String ssn11=(String)session.getAttribute("ssn11");
	String temp = (String)session.getAttribute("seatno");
	
	int seatno=Integer.parseInt(temp);
	 
    if(name!= null && credit_number != null && mode != null){ 
    
    Integer payment_id= (Integer)session.getAttribute("payment_id");
   payment_id=50006;
  Integer ticket_no1=(Integer)session.getAttribute("ticket");
   // ticket_no1=0;
        if( ticket_no1==null ||ticket_no1== 0 )
        {
               /* First visit */
               
               ticket_no1=10000+ 1;
            }else
            {
            	ticket_no1=ticket_no1+ 1;
 
			}
        
        session.setAttribute("ticket", ticket_no1);
        if(payment_id==null ||payment_id== 0 )
        {
               /* First visit */
               
               payment_id=50000+ 1;
            }else
            {
            	payment_id=payment_id+ 2;
 
			}
            session.setAttribute("payment_id", payment_id);
            
            if(seatno==1){%>
				<B> <%= runQuery1(name,credit_number, mode,ssn11, payment_id,ticket_no1)%> </B>
			<%} 
            if(seatno==2){%>
        		<B> <%= runQuery2(name,credit_number, mode,ssn21,ssn22, payment_id,ticket_no1)%> </B>
        	<%} 
			if(seatno==3){%>
              	<B> <%= runQuery3(name,credit_number, mode,ssn31,ssn32,ssn33, payment_id,ticket_no1)%> </B>
        	<%} 
	}%>

<h2 align="center"> Payment Details </h2>
<form>
  <label for="Name">Card Holder Name</label>
  <input type="text" id="Name" name="Name" ><p id="lblName" style="color:red;"></p>
  <label for="Credit_number">Credit Card Number</label>
  <input type="text" id="Credit_number" name="Credit_number" minlength="15" maxlength="16" size ="16"><p id="lblCredit_number" style="color:red;"></p>
  <label for="Expires">Expires on</label>
	  <span class="expiration">
	   
	    <select id="month" name="Expires" >
	    	 <option value=""></option>
		  <option value="01">January</option>
		  <option value="02">February</option>
		  <option value="03">March</option>
		  <option value="04">April</option>
		   <option value="05">May</option>
		  <option value="06">June</option>
		  <option value="07">July</option>
		  <option value="08">August</option>
		   <option value="09">September</option>
		  <option value="10">October</option>
		  <option value="11">November</option>
		  <option value="12">December</option>
		</select>
	    <span>/</span>
	     <select id="year" name="Expires" >
	     <option value=""></option>
		  <option value="2017">2017</option>
		  <option value="2018">2018</option>
		  <option value="2019">2019</option>
		  <option value="2020">2020</option>
		   <option value="2021">2021</option>
		  <option value="2022">2022</option>
		  <option value="2023">2023</option>
		  <option value="2024">2024</option>
		   <option value="2025">2025</option>
		  <option value="2026">2026</option>
		  <option value="2027">2027</option>
		  <option value="2028">2028</option>
		</select>
	  </span>
  <p id="lblExpires" style="color:red;"></p>
  <label for="Mode">Payment Mode</label>
  <input type="radio" id="ModeV" name="Mode" value="V"> Visa<br>
  <input type="radio" id="ModeM" name="Mode" value="M"> Master<br>
  <input type="radio" id="ModeC" name="Mode" value="C"> Credit<p id="lblMode" style="color:red;" ></p><br>
  
<input type="submit" onClick = "ValidateForm()" value="Submit">
</form>	
<a href='confirmation.jsp'>confirm</a>


</div>
<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
  
</body>


<script type="text/JavaScript" language="JavaScript">
function ValidateForm()
{
    var ret = true;
    if (document.getElementById("Name").value == "")
    {
        document.getElementById("lblName").innerText = "Name is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblName").innerText = "";
    }
    if (document.getElementById("Credit_number").value == "")
    {
        document.getElementById("lblCredit_number").innerText = "Credit number is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblCredit_number").innerText = "";
    }
    if (document.getElementById("Expires").value == "")
    {
        document.getElementById("lblExpires").innerText = "Expire is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblExpires").innerText = "";
    }
   	if(document.getElementById("ModeV").checked == true||document.getElementById("ModeV").checked == true||document.getElementById("ModeV").checked == true)
  		{
  			document.getElementById("lblMode").innerText = ""; 
  			ret=false;
  		}
  	else
  		{
  			document.getElementById("lblMode").innerText = "Mode is required";
  		}
  	

    return ret;
}


</script>

</html>



<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery1(String name, String credit_number, String mode, String ssn, Integer payment_id,Integer ticket_no) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
    
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        
     
	        //double payment_id1 = 50000+1;
	        //String payment_id = Double.toString(payment_id1);
	             
	        
	      
	    	Date today = new Date();
	    	SimpleDateFormat Date_Format =new SimpleDateFormat("yyyy-MM-dd");
	    	String yyyymmddtoday =Date_Format.format(today);
	    	
	    	String status ="Successfull";
	    	
	    	
	        String command = ("INSERT INTO PAYMENT (Payment_id, Holder_name, Credit_num, Modes, Payment_date, Status) VALUES " + "('" +payment_id+"','"+name + "','" +credit_number+"','" + mode +"',to_date('"+yyyymmddtoday+"','yyyy/mm/dd'),'"+status+"')");
	        stmt.executeUpdate(command); 
	        
	        String command1 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn+"'");
	        stmt.executeUpdate(command1);
	        return ("<p>no of rows insert is 1 </p>");
        	
        	
       	
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
<%! private String runQuery2(String name, String credit_number, String mode, String ssn1,String ssn2, Integer payment_id,Integer ticket_no) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
       
     
	        //double payment_id1 = 50000+1;
	        //String payment_id = Double.toString(payment_id1);
	             
	        
	      
	    	Date today = new Date();
	    	SimpleDateFormat Date_Format =new SimpleDateFormat("yyyy-MM-dd");
	    	String yyyymmddtoday =Date_Format.format(today);
	    	
	    	String status ="Successfull";
	    	
	    	
	        String command = ("INSERT INTO PAYMENT (Payment_id, Holder_name, Credit_num, Modes, Payment_date, Status) VALUES " + "('" +payment_id+"','"+name + "','" +credit_number+"','" + mode +"',to_date('"+yyyymmddtoday+"','yyyy/mm/dd'),'"+status+"')");
	        stmt.executeUpdate(command); 
	        
	        String command1 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn1+"'");
	        stmt.executeUpdate(command1);
	        
	        String command2 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn2+"'");
	        stmt.executeUpdate(command2);
	        return ("<p>no of rows insert is 1 </p>");
        	
        	
       	
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
<%! private String runQuery3(String name, String credit_number, String mode, String ssn1,String ssn2,String ssn3, Integer payment_id,Integer ticket_no) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
   
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        
	        //double payment_id1 = 50000+1;
	        //String payment_id = Double.toString(payment_id1);
	             
	        
	      
	    	Date today = new Date();
	    	SimpleDateFormat Date_Format =new SimpleDateFormat("yyyy-MM-dd");
	    	String yyyymmddtoday =Date_Format.format(today);
	    	
	    	String status ="Successfull";
	    	
	    	
	        String command = ("INSERT INTO PAYMENT (Payment_id, Holder_name, Credit_num, Modes, Payment_date, Status) VALUES " + "('" +payment_id+"','"+name + "','" +credit_number+"','" + mode +"',to_date('"+yyyymmddtoday+"','yyyy/mm/dd'),'"+status+"')");
	        stmt.executeUpdate(command); 
	        
	        String command1 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn1+"'");
	        stmt.executeUpdate(command1);
	        String command2 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn2+"'");
	        stmt.executeUpdate(command2);
	        String command3 = ("UPDATE PASSENGER SET P_Payment_id="+payment_id+", Ticket_no='"+ticket_no+"' WHERE SSN='"+ssn3+"'");
	        stmt.executeUpdate(command3);
	        return ("<p>no of rows insert is 1 </p>");
        	
        	
       	
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
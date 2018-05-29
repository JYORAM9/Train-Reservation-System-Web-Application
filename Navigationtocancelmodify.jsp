<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancellation Page </title>
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
<h1 align="center"> Details </h1>
<form >
  <label for="Ticket">Ticket Number   </label>
  <input type="text" id="Ticket" name="Ticket""><p id="lblTicket" style="color:red;"></p>
<input type="submit" onclick="ValidateForm()" value="Submit">

</form>
<%if(request.getParameter("Ticket")!= null){
String ticket=request.getParameter("Ticket");
 Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        
       rset = stmt.executeQuery("SELECT SSN FROM PASSENGER WHERE TICKET_NO ="+ticket);  
       %>
       <form>
       <table  style="width:100%" border="1">
       <tr bgcolor="#8FBC8F">
   	   <th>SSN</th>
   	   <th>select</th>
   	   <th>submit</th>
   	   </tr>
       <%while(rset.next()){%> 
     <tr bgcolor="#D3D3D3" >
   
   	   		<th><%=rset.getString(1)%></th>
   	   		<th><input type='radio' id='checking' name='checking' value='<%=rset.getString(1) %>'></th>
   	   		<th><input type='submit' value='select'></th>
   	  </tr>
   	   	<%} %>	
	     </table>
	     </form>
      
       	
       	<br>
       	<br>


       	
       	
   <%  }
     catch (SQLException e)
     { 
    	 e.printStackTrace();
     } 
}%>

 	<%
       	
       	String ssnc= request.getParameter("checking");
       	session.setAttribute("ssnc",ssnc);
       	
       if(ssnc!=null){%>
<a href='modify.jsp'>Modify</a>
<a href='cancel.jsp'>Cancel</a>
<%} %>
</div>
<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
</body>





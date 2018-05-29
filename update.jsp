<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.sql.*" import="java.time.*" import="java.util.Date" import="java.text.SimpleDateFormat"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Site under construction</title>



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


</head>
<BODY>

<div id="container">
   <div id="header">
   <h1>Train Reservation System</h1>
   </div>


<div id="body">

<a href='#insert'> INSERT</a>
<a href='#delete'> DELETE</a>
<a href='#update'> UPDATE</a>
<br><BR><br>




<% String train_name = request.getParameter("Train_Name");
	String train_id = request.getParameter("Train_id");
	String train_type = request.getParameter("Train_Type");
	String source = request.getParameter("Source");
	String destination = request.getParameter("Destination");
	String temp1 = request.getParameter("Fare");
	 String arr_time=request.getParameter("Arr_Time");
 	String dep_time=request.getParameter("Dep_Time");
 	
    if(train_name!= null && train_id != null && train_type != null && source != null && destination != null && temp1 != null && arr_time != null && dep_time != null){
    		%>
	<B> <%= Insertt(train_name,train_id,train_type,source,destination,temp1,arr_time,dep_time)%> </B>
	
	<%}%>
	
	
        
        
<B> INSERT TRAIN DETAILS</B>
<form id='insert' name='insert'>
<label for="Train_Name">Train name</label>
  <input type="text" id="Train_Name" name="Train_Name"><p id="lblTrain_Name" style="color:red;"></p>
  <label for="Train_id">Train id</label>
  <input type="text" id="Train_id" name="Train_id" ><p id="lblTrain_id" style="color:red;"></p>
  <label for="Train_Type">Train Type</label>
  <input type="text" id="Train_Type" name="Train_Type"  ><p id="lblTrain_Type" style="color:red;"></p>
  <label for="Source">Source</label>
  <input type="text" id="Source" name="Source"><p id="lblSource" style="color:red;"></p>
  <label for="Destination">Destination   </label>
  <input type="text" id="Destination" name="Destination"><p id="lblDestination" style="color:red;"></p>
  <label for="Fare">Fare</label>
	<input type="text" id="Fare" name="Fare"><p id="lblFare" style="color:red;"></p> 
	<label for="Arr_Time">Arrival time   </label>
  <input type="time" id="Arr_Time" name="Arr_Time"  ><p id="lblArr_Time" style="color:red;"></p>
  <label for="Dep_Time">Departure time</label>
	<input type="time" id="Dep_Time" name="Dep_Time" ><p id="lblDep_Time" style="color:red;"></p>
	<input type="submit" onClick = "ValidateForm()" value="Submit"> 
</form>




<script type="text/JavaScript" language="JavaScript">
function ValidateForm()
{
    var ret = true;
    if (document.getElementById("Train_Name").value == "")
    {
        document.getElementById("lblTrain_Name").innerText = "Train_name is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblTrain_Name").innerText = "";
    }
    if (document.getElementById("Train_id").value == "")
    {
        document.getElementById("lblTrain_id").innerText = "Train_id is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblTrain_id").innerText = "";
    }
    if (document.getElementById("Train_ids").value == "")
    {
        document.getElementById("lblTrain_ids").innerText = "Train_ids is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblTrain_ids").innerText = "";
    }
    if (document.getElementById("Train_idss").value == "")
    {
        document.getElementById("lblTrain_idss").innerText = "Train_idss is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblTrain_idss").innerText = "";
    }
    if (document.getElementById("Train_Type").value == "")
    {
        document.getElementById("lblTrain_Type").innerText = "Train_Type is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblTrain_Type").innerText = "";
    }
    if (document.getElementById("Source").value == "")
    {
        document.getElementById("lblSource").innerText = "Source is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblSource").innerText = "";
    }

    if (document.getElementById("Destination").value == "")
    {
        document.getElementById("lblDestination").innerText = "Destination is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblDestination").innerText = "";
    }
    if (document.getElementById("Fare").value == "")
    {
        document.getElementById("lblFare").innerText = "Fare is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblFare").innerText = "";
    }
    if (document.getElementById("Arr_Time").value == "")
    {
        document.getElementById("lblArr_Time").innerText = "Arr_Time is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblArr_Time").innerText = "";
    }
    if (document.getElementById("Dep_Time").value == "")
    {
        document.getElementById("lblDep_Time").innerText = "Dep_Time is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblDep_Time").innerText = "";
    }
    
    if (document.getElementById("Arr_Times").value == "")
    {
        document.getElementById("lblArr_Times").innerText = "Arr_Times is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblArr_Times").innerText = "";
    }
    if (document.getElementById("Dep_Times").value == "")
    {
        document.getElementById("lblDep_Times").innerText = "Dep_Times is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblDep_Times").innerText = "";
    }
    


  	

    return ret;
}
</script>


<% String train_ids = request.getParameter("Train_ids");
if(train_ids != null){  %>
		<B> <%= deletee(train_ids)%> </B>
		
		<%} %>
		
<form id='delete' name='delete'>
<B> DELETE TRAIN DETAILS</B><br>
<label for="Train_ids">Train ID</label>
  <input type="text" id="Train_ids" name="Train_ids"><p id="lblTrain_ids" style="color:red;"></p>
  <input type="submit" onClick = "ValidateForm()" value="Submit"> 
</form>

<% 	String train_idss = request.getParameter("Train_idss");
	 String arr_times=request.getParameter("Arr_Times");
 	String dep_times=request.getParameter("Dep_Times");
 	
    if( train_idss != null && arr_times != null && dep_times != null ){
   %>
	<B> <%= updatee(train_idss,arr_times,dep_times)%> </B>
	
	<%} %>

<form id='update' name='update'>
<B> UPDATE TRAIN DETAILS</B><br>
<label for="Train_idss">Train ID</label>
  <input type="text" id="Train_idss" name="Train_idss"><p id="lblTrain_idss" style="color:red;"></p>
  <label for="Arr_Times">Arrival times   </label>
  <input type="time" id="Arr_Times" name="Arr_Times"  ><p id="lblArr_Times" style="color:red;"></p>
  <label for="Dep_Times">Departure time</label>
	<input type="time" id="Dep_Times" name="Dep_Times" ><p id="lblDep_Times" style="color:red;"></p>
  <input type="submit" onClick = "ValidateForm()" value="Submit"> 
</form>
</div>
<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
</body>
</html>


<%-- Declare and define the Insert() method. --%>
<%! private String Insertt(String train_name,String train_id,String train_type, String source, String destination,String temp1,String arr_time,String dep_time) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
     
      double fare=Double.parseDouble(temp1); 
       
       String command = ("INSERT INTO TRAIN_ROUTE (Train_name,Train_id,Train_type,Source,Destination,Fare,Arr_time,Dep_time) VALUES " + "('"+train_name+"','" +train_id+"','"+train_type + "','" +source+"','" + destination +"',"+fare+",to_date('"+arr_time+"', 'HH24:MI'),to_date('"+dep_time+"', 'HH24:MI'))");
	        stmt.executeUpdate(command); 
       
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



<%-- Declare and define the delete() method. --%>
<%! private String deletee(String train_ids) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
          
    	
	        String command = ("DELETE FROM TRAIN_ROUTE WHERE Train_id='"+train_ids+"'");
	        stmt.executeUpdate(command); 
        	return ("<p>no of rows deleted is 1 </p>");
        
       	
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


<%-- Declare and define the delete() method. --%>
<%! private String updatee(String train_idss,String arr_times,String dep_times) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
          
    	
	        String command = ("UPDATE TRAIN_ROUTE SET Arr_time=to_date('"+arr_times+"', 'HH24:MI'),Dep_time=to_date('"+dep_times+"', 'HH24:MI') WHERE Train_id='"+train_idss+"'");
	        stmt.executeUpdate(command); 
        	return ("<p>no of rows updated is 1 </p>");
        
       	
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



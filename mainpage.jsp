<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" import="java.sql.*" import="java.time.*" import="java.util.Date" import="java.text.SimpleDateFormat" %>
     <%Class.forName("oracle.jdbc.driver.OracleDriver"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
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

    width: 20%;
    padding: 6px 10px;
   
    text-align: right;
     center: 40px;
   
    margin: 4px 0;
    border: 1px solid #ccc;
    border-radius: 20px;
    box-sizing: border-box;
}


.right {
    text-align: right;
    float: right;
}

input[type=submit] {
    width: 20%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}




input[type=submit]:hover {
    background-color: 	#228B22;
}


</style>

<body>


<div id="container">
   <div id="header">
   <h1>Train Reservation System</h1>
   </div>
   
    <div class="right">
       <a href='navigation.jsp'>CANMOD</a>
    </div>

<div id="body">
<% ResultSet tab = null;%> 
 
	<%
	
	Date today = new Date();
	SimpleDateFormat Date_Format =new SimpleDateFormat("yyyy-MM-dd");
	String yyyymmddtoday =Date_Format.format(today);
	
	%>
	<%=today %>
	<form>
	  <label for="Source">Source Station</label><br>
	  
		   <select  name="Source">
						  <%  
						  Tabs tab4 =new Tabs();
					   		ResultSet tab3=tab4.tab2();
						  while(tab3.next())
						  { %>
				            <option><%= tab3.getString(4)%></option>
				        <% } %>
	       </select><p id="lblSource" style="color:red;"></p>
	  <label for="Destination">Destination Station</label><br>
		 	<select name="Destination">
						  <%  
						  Tabs tab6 =new Tabs();
					   		ResultSet tab7=tab6.tab2();
						  while(tab7.next())
						  { %>
				            <option><%= tab7.getString(5)%></option>
				        <% } %>
	        </select><p id="lblDestination" style="color:red;"></p>
	  <label for="Seatno">No of Seats</label><br>
	    <select id="" name="Seatno" >
	    	 
		  <option value="01">01</option>
		  <option value="02">02</option>
		  <option value="03">03</option>
		</select>
		<p id="lblSeatno" style="color:red;"></p><br>
	  <label for="Selectdate">Date</label>
	  <input type="date" id="Selectdate" name="Selectdate" min="<%=yyyymmddtoday %>"><p id="lblSelectdate" style="color:red;"></p>
	<input type="submit" onClick = "ValidateForm()" value="Search Trains">
	</form>
	
	<p> Are you an Admin? <a href="login.jsp">Login</a></p> 
	
	
	<%-- Declare and define the runQuery() method. --%>
<%!public class Tabs{
	Connection conn = null; 
    Statement stmt = null; 
    ResultSet rset = null;
	public ResultSet tab1(String source,String destination) 
	{
				try {
					DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
			        stmt = conn.createStatement();
			        rset = stmt.executeQuery ("SELECT Train_name,Train_id,Train_type,Source,Destination,Fare,to_char(Arr_time,'HH24:MI'),to_char(Dep_time,'HH24:MI') FROM TRAIN_ROUTE WHERE (LOWER(Source) ='" + source +"' OR Source ='"+source+"') AND (LOWER(Destination) = '" +destination+ "' OR Destination ='"+destination+"')");
						
			     } 
			     catch (SQLException e)
			     { 
			         e.printStackTrace();
			     } 
				
			     
		return rset;
	  }
	
	public ResultSet tab2() 
	{
				try {
					DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
			        stmt = conn.createStatement();
			        rset = stmt.executeQuery ("SELECT * FROM TRAIN_ROUTE ");
						
			     } 
			     catch (SQLException e)
			     { 
			         e.printStackTrace();
			     } 
				
			     
		return rset;
	  }
}

%>


	
	
	<%
	
	String source=new String();
	String destination=new String();
	String dates=new String();
	
	    if(request.getParameter("Source") != null && request.getParameter("Destination")!= null && request.getParameter("Selectdate") != null){
	    	source = request.getParameter("Source");
	    	destination = request.getParameter("Destination");
	    	dates = request.getParameter("Selectdate");
	    	String temp2= request.getParameter("Seatno");
	    	session.setAttribute("seatno",temp2);
	    	session.setAttribute("dates", dates);
	    	session.setAttribute("source", source);
	    	session.setAttribute("destination", destination);
	    }
	    Tabs tab5 =new Tabs();
	   		tab=tab5.tab1(source,destination);
	%>
	
 <form >
<table style="width:100%" border="1">
  <tr bgcolor="#8FBC8F"  >
  	<th> check box </th>
    <th >Train Name</th>
    <th>Train Id</th> 
    <th>Train Type</th>
    <th>Source</th>
    <th>Destination</th> 
    <th>Fare</th>
    <th>Arrival Time</th>
    <th>Departure Time</th> 
	<th>submit<th>
  </tr>
 
  <% while (tab.next()){ %>
  <tr bgcolor="#D3D3D3" >
  	<th><input type='radio' id='checking' name='checking' value ='<%=tab.getInt(2) %>'></th>

    <th> <%= tab.getString(1)%></th> 
    <th><%= tab.getInt(2)%></th>
    <th><%= tab.getString(3)%></th>
    <th><%= tab.getString(4)%></th> 
    <th><%= tab.getString(5)%></th>
   <%
   String seatnum=(String)session.getAttribute("seatno");
   int seatno =Integer.parseInt(seatnum);
   if(seatno == 01){%>
   <th><%= tab.getDouble(6)%></th>
   <% }%>
    <% if(seatno == 02){%>
   <th><%= 2*tab.getDouble(6)%></th>
   <% }%>
    <% if(seatno == 03){%>
   <th><%= 3*tab.getDouble(6)%></th>
   <% }%>
    
    <th><%= tab.getString(7)%></th> 
    <%String arrtime = tab.getString(7);
    session.setAttribute("arrtime",arrtime);
    String deptime= tab.getString(8);
    session.setAttribute("deptime",deptime);%>
    <th><%= tab.getString(8)%></th> 
    
    <th><input type='submit' value='select' onClick=ValidateForm()></th>
  </tr>
  <%} %>
</table>
</form>
<p id="lblchecking" style="color:red;" ></p><br>
<%
String train_id= request.getParameter("checking");
session.setAttribute("train_id",train_id);
%>


<% 
String train_id1=(String)session.getAttribute("train_id");
String dates1=(String)session.getAttribute("dates");
String seatno1=(String)session.getAttribute("seatno");

if(train_id1 != null && dates1 != null){
	ResultSet rset1=null;
	Connection conn = null; 
    Statement stmt = null; 
    int count=0;

try {
	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
    stmt = conn.createStatement();
    rset1 = stmt.executeQuery ("SELECT COUNT(*) FROM SEAT_STATUS WHERE S_Train_id='"+train_id1+"' AND DATES =to_date('"+dates1+"','yyyy/mm/dd')");
    while(rset1.next())
	  { 
   			 count=rset1.getInt(1);
	  }
    	
		int seatno=Integer.parseInt(seatno1);
    if(count>= seatno){ %>
   			 
   	<div class="right">
       <a href='register.jsp'>NEXT</a>
    </div>
    <%}
    else{%>
    	<p>seats are not available!! please choose another date</p>
	<%}

	  }	
 
 catch (SQLException e)
 { 
     e.printStackTrace();
 } 
}
%>





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
    if (document.getElementById("Selectdate").value == "")
    {
        document.getElementById("lblSelectdate").innerText = "Date is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblSelectdate").innerText = "";
    }
    return ret;
    if(document.getElementById("checking").checked == true)
		{
			document.getElementById("lblchecking").innerText = ""; 
			ret=false;
		}
	else
		{
			document.getElementById("lblchecking").innerText = "check box is required";
		}
    
    
    if (document.getElementById("Seatno").value == "")
    {
        document.getElementById("lblSeatno").innerText = "Seatno is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblSeatno").innerText = "";
    }
}


</script>


</html>



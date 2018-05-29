<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.sql.*" %>
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
position:absolute;
    width: 20%;
    padding: 6px 10px;
    margin: 4px 0;
    border: 1px solid #ccc;
    border-radius: 20px;
    box-sizing: border-box;
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


.right {
    text-align: right;
    float: right;
}

input[type=submit]:hover {
    background-color: 	#228B22;
}


</style>
</head>

<BODY>

<div id="container" style="text-align:center">
   <div id="header">
   <h1>Train Reservation System</h1>
   </div>
<div id="body" >

 
<%
String train_id =null;
int seatno=0;
String ssn = request.getParameter("SSN");
	String firstname = request.getParameter("FirstName");
	String middlename = request.getParameter("MiddleName");
	String lastname = request.getParameter("LastName");
	String phn = request.getParameter("Phn");
	String age1=request.getParameter("Age");
	String Gender= request.getParameter("gender");
	train_id= (String)session.getAttribute("train_id");
	//out.print(train_id);
	String temp= (String)session.getAttribute("seatno");
	seatno =Integer.parseInt(temp);
	//out.print(temp);
	
	session.setAttribute("fname",firstname);
	
	
    if(firstname != null && lastname != null && age1 != null && ssn!= null && phn !=null&& Gender != null){ 
     
            session.setAttribute("ssn",ssn);%>
	<B> <%= runQuery(ssn,firstname,middlename,lastname,phn,age1,Gender,train_id)%> </B>
	<%} %>
	
	
	
<h2 align="center"> Passenger Details </h2>
<%if(seatno==1||seatno==2||seatno==3){
if(seatno==3){%>

	<form>
	
	 <label for="check1">check this box</label>
	  <input type="checkbox" id="check1" name="check1" ><p id="lblcheck" style="color:red;"></p>
	  <label for="SSN">Passenger 1 Social Security Number</label>
	  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
	  <label for="FirstName">Passenger 1 First Name</label>
	  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
	  <label for="MiddleName">Passenger 1 Middle Initial</label>
	  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
	  <label for="LastName">Passenger 1 Last Name</label>
	  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
	  <label for="Phn">Passenger 1 phone number   </label>
	  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
	  <label for="Age">Passenger 1 Age</label>
		<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

	  <label for="gender" >Passenger 1 gender</label>
	  <input type="radio" id="genderm" name="gender" value="M"> Male
	  <input type="radio" id="genderf" name="gender" value="F"> Female
	  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

	<input type="submit" onClick = "ValidateForm()" value="submit">
	</form>	
	
	<%if(request.getParameter("check1")!=null){
	String ssn31 = request.getParameter("SSN");
	 session.setAttribute("ssn31",ssn31);
	 String fname31 = request.getParameter("FirstName");
	 session.setAttribute("fname31",fname31);
	 }%>
	
	<form>
	 <label for="check2">check this box</label>
	  <input type="checkbox" id="check2" name="check2"><p id="lblcheck" style="color:red;"></p>
	  <label for="SSN">Passenger 2 Social Security Number</label>
	  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
	  <label for="FirstName">Passenger 2 First Name</label>
	  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
	  <label for="MiddleName">Passenger 2 Middle Initial</label>
	  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
	  <label for="LastName">Passenger 2 Last Name</label>
	  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
	  <label for="Phn">Passenger 2 phone number   </label>
	  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
	  <label for="Age">Passenger 2 Age</label>
		<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

	  <label for="gender" >Passenger 2 gender</label>
	  <input type="radio" id="genderm" name="gender" value="M"> Male
	  <input type="radio" id="genderf" name="gender" value="F"> Female
	  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

	<input type="submit" onClick = "ValidateForm()" value="submit">
	</form>	
	<%if(request.getParameter("check2")!=null){
	String ssn32 = request.getParameter("SSN");
	 session.setAttribute("ssn32",ssn32);
	 String fname32 = request.getParameter("FirstName");
	 session.setAttribute("fname32",fname32);
	}
	 %>
	
	<form>
	 <label for="check3">check this box</label>
	  <input type="checkbox" id="check3" name="check3"><p id="lblcheck" style="color:red;"></p>
	  <label for="SSN">Passenger 3 Social Security Number</label>
	  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
	  <label for="FirstName">Passenger 3 First Name</label>
	  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
	  <label for="MiddleName">Passenger 3 Middle Initial</label>
	  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
	  <label for="LastName">Passenger 3 Last Name</label>
	  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
	  <label for="Phn">Passenger 3 phone number   </label>
	  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
	  <label for="Age">Passenger 3 Age</label>
		<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

	  <label for="gender" >Passenger 3 gender</label>
	  <input type="radio" id="genderm" name="gender" value="M"> Male
	  <input type="radio" id="genderf" name="gender" value="F"> Female
	  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

	<input type="submit" onClick = "ValidateForm()" value="submit">
	</form>	
	<%if(request.getParameter("check3")!=null){
	String ssn33 = request.getParameter("SSN");
	 session.setAttribute("ssn33",ssn33);
	 String fname33 = request.getParameter("FirstName");
	 session.setAttribute("fname33",fname33);
	}
	 %>
	 
	<%} %>
<%if(seatno==2){%>
	<form>
	 <label for="check1">check this box</label>
	  <input type="checkbox" id="check1" name="check1"><p id="lblcheck" style="color:red;"></p>
	  <label for="SSN">Passenger 1 Social Security Number</label>
	  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
	  <label for="FirstName">Passenger 1 First Name</label>
	  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
	  <label for="MiddleName">Passenger 1 Middle Initial</label>
	  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
	  <label for="LastName">Passenger 1 Last Name</label>
	  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
	  <label for="Phn">Passenger 1 phone number   </label>
	  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
	  <label for="Age">Passenger 1 Age</label>
		<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

	  <label for="gender" >Passenger 1 gender</label>
	  <input type="radio" id="genderm" name="gender" value="M"> Male
	  <input type="radio" id="genderf" name="gender" value="F"> Female
	  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

	<input type="submit" onClick = "ValidateForm()" value="submit">
	</form>	
<%if(request.getParameter("check1")!=null){
	String ssn21 = request.getParameter("SSN");
	 session.setAttribute("ssn21",ssn21);
	 String fname21 = request.getParameter("FirstName");
	 session.setAttribute("fname21",fname21);
	}
	 %>
	<form>
	 <label for="check2">check this box</label>
	  <input type="checkbox" id="check2" name="check2"><p id="lblcheck" style="color:red;"></p>
	  <label for="SSN">Passenger 2 Social Security Number</label>
	  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
	  <label for="FirstName">Passenger 2 First Name</label>
	  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
	  <label for="MiddleName">Passenger 2 Middle Initial</label>
	  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
	  <label for="LastName">Passenger 2 Last Name</label>
	  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
	  <label for="Phn">Passenger 2 phone number   </label>
	  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
	  <label for="Age">Passenger 2 Age</label>
		<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

	  <label for="gender" >Passenger 2 gender</label>
	  <input type="radio" id="genderm" name="gender" value="M"> Male
	  <input type="radio" id="genderf" name="gender" value="F"> Female
	  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

	<input type="submit" onClick = "ValidateForm()" value="submit">
	</form>	
	<%if(request.getParameter("check2")!=null){
	String ssn22 = request.getParameter("SSN");
	 session.setAttribute("ssn22",ssn22);
	 String fname22 = request.getParameter("FirstName");
	 session.setAttribute("fname22",fname22);
	}
	 %>
	<%} %>
<%if(seatno==1){ %>
<form>
 <label for="check1">check this box</label>
	  <input type="checkbox" id="check1" name="check1"><p id="lblcheck" style="color:red;"></p>
  <label for="SSN">Passenger 1 Social Security Number</label>
  <input type="text" id="SSN" name="SSN" minlength="9" maxlength="9" pattern="[0-9]{9}"><p id="lblSSN" style="color:red;"></p>
  <label for="FirstName">Passenger 1 First Name</label>
  <input type="text" id="FirstName" name="FirstName"><p id="lblFirstName" style="color:red;"></p>
  <label for="MiddleName">Passenger 1 Middle Initial</label>
  <input type="text" id="MiddleName" name="MiddleName" pattern="[A-Za-z]{1}"><p id="lblMiddleName" style="color:red;"></p>
  <label for="LastName">Passenger 1 Last Name</label>
  <input type="text" id="LastName" name="LastName"><p id="lblLastName" style="color:red;"></p>
  <label for="Phn">Passenger 1 phone number   </label>
  <input type="text" id="Phn" name="Phn" minlength="10" maxlength="10" pattern="[0-9]{10}" ><p id="lblPhn" style="color:red;"></p>
  <label for="Age">Passenger 1 Age</label>
	<input type="text" id="Age" name="Age" ><p id="lblAge" style="color:red;"></p>

  <label for="gender" >Passenger 1 gender</label>
  <input type="radio" id="genderm" name="gender" value="M"> Male
  <input type="radio" id="genderf" name="gender" value="F"> Female
  <input type="radio" id="gendero" name="gender" value="O"> Other<p id="lblgender" style="color:red;" ></p><br>

<input type="submit" onClick = "ValidateForm()" value="submit">
</form>	
<%if(request.getParameter("check1")!=null){
	String ssn11 = request.getParameter("SSN");
	 session.setAttribute("ssn11",ssn11);
	 String fname11 = request.getParameter("FirstName");
	 session.setAttribute("fname11",fname11);
	}
	 %>
<%} %>
<% } %>
	<div class="right">
       <a href='payment.jsp'> NEXT PAGE</a>
    </div>
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
    if (document.getElementById("SSN").value == "")
    {
        document.getElementById("lblSSN").innerText = "SSN is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblSSN").innerText = "";
    }
    if (document.getElementById("FirstName").value == "")
    {
        document.getElementById("lblFirstName").innerText = "First Name is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblFirstName").innerText = "";
    }
    if (document.getElementById("MiddleName").value == "")
    {
        document.getElementById("lblMiddleName").innerText = "Middle initial is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblMiddleName").innerText = "";
    }
    if (document.getElementById("LastName").value == "")
    {
        document.getElementById("lblLastName").innerText = "Last Name is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblLastName").innerText = "";
    }

    if (document.getElementById("Phn").value == "")
    {
        document.getElementById("lblPhn").innerText = "phone number is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblPhn").innerText = "";
    }
    if (document.getElementById("Age").value == "")
    {
        document.getElementById("lblAge").innerText = "Age is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblAge").innerText = "";
    }

  	if(document.getElementById("genderm").checked == true||document.getElementById("genderf").checked == true||document.getElementById("gendero").checked == true)
  		{
  			document.getElementById("lblgender").innerText = ""; 
  			ret=false;
  		}
  	else
  		{
  			document.getElementById("lblgender").innerText = "gender is required";
  		}
  	
  	if(document.getElementById("check1").checked == true||document.getElementById("check2").checked == true||document.getElementById("check3").checked == true)
		{
			document.getElementById("lblcheck").innerText = ""; 
			ret=false;
		}
	else
		{
			document.getElementById("lblcheck").innerText = "gender is required";
		}
  	

    return ret;
}


</script>
</html>


<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery(String ssn,String firstname,String middlename, String lastname, String phn,String age1, String Gender,String train_id) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
    
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
     
        
        
        
        int ticket_no=0;
	       // static double ticket_no1 = 10000+1;
	        //String ticket_no = Double.toString(ticket_no1);
	        int age=Integer.parseInt(age1);
	      	String payment_id = null;
	        String command = ("INSERT INTO PASSENGER (SSN,Ticket_no,Fname,Minit,Lname,Gender,Age,phn_num,P_Train_id,P_payment_id) VALUES " + "('"+ssn+"','" +ticket_no+"','"+firstname + "','" +middlename+"','" + lastname +"','"+Gender+"'," +age +",'" +phn + "','"+train_id+"',"+payment_id+")");
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



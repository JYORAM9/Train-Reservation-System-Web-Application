<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN Login </title>
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
<h1 align="center"> Login@trs.com </h1>
<form >
  <label for="Email">Email   </label>
  <input type="text" id="Email" name="Email" placeholder="Your email address.."><p id="lblEmail" style="color:red;"></p>
  <label for="Psw">Password</label>
<input type="password" id="Psw" name="Psw" placeholder="Your password.."><p id="lblpsw" style="color:red;"></p>
<input type="submit" onclick="ValidateForm()" value="Submit">

</form>


<% String email = request.getParameter("Email");
	String psw = request.getParameter("Psw");
    if(email != null && psw != null ){%>
	<%=runQuery(email,psw)%>
	<%} %>


</div>
<div id="footer">
<p> Copy rights trs.com</p>
</div>
</div>
</body>

<script type="text/JavaScript" language="JavaScript">
function ValidateForm()
{
	 var x = document.getElementById("Email").value;
	 var atpos = x.indexOf("@");
	 var dotpos = x.lastIndexOf(".");
    var ret = true;
    
    if (atpos<1 || dotpos< atpos+2 || (dotpos+2)>= x.length) {
        alert("Not a valid e-mail address");
        ret = false;
    }  
    if (document.getElementById("Email").value == "")
    {
        document.getElementById("lblEmail").innerText = "Email is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblEmail").innerText = "";
    }
    if (document.getElementById("psw").value == "")
    {
        document.getElementById("lblpsw").innerText = "password is required";
        ret = false;
    }
    else
    {
        document.getElementById("lblpsw").innerText = "";
    }
    return ret;
}
</script>

</html>


<%-- Declare and define the runQuery() method. --%>
<%! private String runQuery(String email,String psw) throws SQLException{
     Connection conn = null; 
     Statement stmt = null; 
     ResultSet rset = null;
     
     StringBuffer sb = new StringBuffer();
     int count;
     try {
    	 
    	 DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/project","project", "project");
        stmt = conn.createStatement();
        rset = stmt.executeQuery ("SELECT * FROM ADMIN WHERE User_id ='" + email +"' AND Pwd = '" +psw+ "'");
			return (formatResult(rset));
	      
        
       	
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

private String formatResult(ResultSet rset) throws SQLException {
    StringBuffer sb = new StringBuffer();
    
    if (!rset.next()){
      sb.append("No user with that details!!!! Try Again ");
    }
    else { 
    	sb.append("<a href=Update.jsp>Login sucessfull</a>");
    	    	
        }
    return sb.toString();
  }

%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<html>
<head>
<script>
function validate_form()							 
{
	var ps=document.forms["RegForm"]["pref_start"];
	var pl=document.forms["RegForm"]["pref_loc"];
	var se=document.forms["RegForm"]["sal_exp"];
	var pa=document.forms["RegForm"]["post_app"];
	

   	if (ps.value==" "){
        	window.alert("Please enter start date.");
		fn.focus();
        	return false;
    	}

	if (pl.value==" ")
	{
		window.alert("Please enter preferred location.");
		mn.focus();
		return false;
	}
	else if(!/^[a-zA-Z\s]*$/g.test(pl.value)) 
	{
        	alert("Invalid characters");
        	mn.focus();
        	return false;
	}
        if (se.value==" ")
	{
		window.alert("Please enter salary expected.");
		mn.focus();
		return false;
	}
	else if(!/^[a-zA-Z\s]*$/g.test(se.value)) 
	{
        	alert("Invalid characters");
        	mn.focus();
        	return false;
	}
        if (pa.value==" ")
	{
		window.alert("Please enter post that you are applying for.");
		mn.focus();
		return false;
	}
	else if(!/^[a-zA-Z\s]*$/g.test(pa.value)) 
	{
        	alert("Invalid characters");
        	mn.focus();
        	return false;
	}
	
	return true;
}
</script>
<script>
$("input[required]").parent("label").addClass("required");
</script>
<script>
function isNumberKey(evt){ 
	var e = evt || window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode
	if(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        	return false;	
	return true;
}
</script>
<script>
function ValidateAlpha(evt)
    {
        var keyCode = (evt.which) ? evt.which : evt.keyCode
        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode !=32)
           return false;
        return true;
    }
    function close1(){
    
        var x = document.getElementById("abc");
        var z = document.getElementById("ghi");
        var y = document.getElementById("def");
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "none"; 
        window.alert("data saved successfully!");
}

</script>

<style>
h1{

font-family: "Georgia";
text-align:center;
color:  #1C98B2;



}

div#pqr
{
 position: fixed;
  top: 0;
  left: 0;
  bottom: 70px;
  width: 100%;
  
  
  height: 75px;
  padding: 5px 10px; /* some styling, please note overall height of the object will be 35px due to 5px padding on top/bottom. */
  background: 	#24bdde; /* some styling */
   border-bottom: 1px solid #333; /* some styling */

}

body {font-family: Arial, Helvetica, sans-serif;}
input[type=text],  input[type=number],input[type=date] {
	width: 30%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
    	border: none;
    	background: #f1f1f1;
       
}

input[type=text]:focus, input[type=number]:focus,input[type=date]:focus{
    background-color:#B4E8F3;
    outline: none;
}


button {
    background-color:#24bdde;
    color: white;
    align-items: center;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.9;
   
}

button:hover {
    opacity:1;
    
}


.cancelbtn {
    padding: 14px 20px;
    background-color: #708090;
}

.cancelbtn, .signupbtn {
  float: left;
  width: 25%;
}

.container{
padding: 10px;
}




.model {
    display: none;
    position: fixed; 
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto;
 background-color: beige;
    padding-top: 50px;
   
}


form{
    background-color: #fefefe;
    margin: 5% auto 15% auto;
    border: 1px solid #888;
    width: 50%;
     padding-left:3em;
     
}


hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
 

.close {
    position: absolute;
    right: 35px;
    top: 15px;
    font-size: 40px;
    font-weight: bold;
    color: #f1f1f1;
}

.close:hover,
.close:focus {
    color: #f44336;
    cursor: pointer;
}


.clearfix::after {
    content: "";
    clear: both;
    display: table;
}
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>
</head>
             
<body style="background-image: url('http://designtowwebberz.com/images/slider/development.jpg')" >
 <%
            String s =(String)request.getAttribute("username");
         
           
         try {
             
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
       if(rs.next())
       {
            
      rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+rs.getString(1)+"'");
        }
   }

   catch (Exception e) {
    e.printStackTrace();
   }
            
session.setAttribute("username",s);

%>
<div class="container" >
<form name="AppForm" class="form-inline" onsubmit="return validate_form()">
    
     
   <div  id="pqr">
        
        <%String b=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=b%>"  width="80" height="80"/> &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
       
        
  
         
        </div>
   
    <br>
  
    
      <h1> JOB APPLICATION</h1>
     
      <hr>
	<label for="pref_start"><b>Preferred Start Date</b></label><span style="color:red;">*</span>
	<input type="date" placeholder="Enter preferred start date" name="pref_start"  min="2018-10-17" max="2020-10-17" >
	<br>
	<br>
        <label for="pref_loc"><b>Preferred Work Location</b></label><span style="color:red;">*</span>
	<input type="text" placeholder="Enter Preferred Work Location" name="pref_loc" >
	<br>
	<br>
        <label for="sal_exp"><b>Salary Expected</b><span style="color:red;">*</span></label>
	<input type="number" placeholder="Enter Expected Salary" name="sal_exp" >
	<br>
        <label for="post_app"><b>Designation</b><span style="color:red;">*</span></label>
     	 <input type="text" placeholder="Enter designation opted" name="post_app" >
      	<br>

    	<div class="clearfix">
            <button type="submit" class="signupbtn" formaction="apply">SUBMIT</button>
            <button type="reset"  class="cancelbtn" onclick="close1()" formaction="a_home.jsp">CANCEL</button>
        
       
 </div>
         <span class="text-muted"><em><span style="color:red;">*</span> Indicates required field</em></span>
</form>
   
</div>
</body>
</html>
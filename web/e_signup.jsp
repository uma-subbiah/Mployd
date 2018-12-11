<html>
<head>
<script>
function validate_form()							 
{
	var on=document.forms["RegForm"]["oname"];
	var mn=document.forms["RegForm"]["mname"];
	var cem=document.forms["RegForm"]["cemail"];
	var p1=document.getElementById("psw");
	var p2=document.getElementById("psw-repeat");

   	if (on.value==" "){
        	window.alert("Please enter valid organisation name");
		fn.focus();
        	return false;
    	}
	else if(!/^[a-zA-Z\s]*$/g.test(on.value)) 
	{
        	alert("Invalid characters");
        	on.focus();
        	return false;
	}

	if (mn.value=="")
	{
		window.alert("Please enter valid manager name.");
		mn.focus();
		return false;
	}
	else if(!/^[a-zA-Z\s]*$/g.test(mn.value)) 
	{
        	alert("Invalid characters");
        	mn.focus();
        	return false;
	}
	if (em.value.indexOf(".", 0) < 0)                
    	{
       	 	window.alert("Please enter a valid e-mail address.");
        	em.focus();
        	return false;
   	}

	if (p1.value === "")                                  
   	 {
      	  	window.alert("Please enter a password.");
      	 	p1.focus();
       		return false;
   	 }
	if (p2.value === "")                                  
   	 {
		window.alert("Please re-type the password.");
		p2.focus();
       		return false;
    	}
         if(p1.value!==p2.value){  
		alert("password must be same!");  
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
input[type=text], input[type=password], input[type=email] {
	width: 30%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
    	border: none;
    	background: #f1f1f1;
       
}

input[type=text]:focus, input[type=password]:focus, input[type=email]:focus {
    background-color:#B4E8F3;
    outline: none;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
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
    
     <div  id="pqr">
         <%String b=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=b%>"  width="80" height="80"/>
         &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
        
      </div>
    <br>
    <br>
    
    
    <br>


<div class="container" >
<form name="RegForm" action="store_data" class="form-inline" onsubmit="return validate_form()" method="post" >
    
      <h1> SIGN UP FORM FOR EMPLOYERS</h1>
      <p>Fill in this form to create an account.</p>
      <hr>
	
	<label for="oname"><b>Organisation Name</b><span style="color:red;">*</span></label>
	<input type="text" placeholder="Enter Organisation Name" name="oname" onKeyPress="return ValidateAlpha(event);" required>
	<br>
        <label for="mname"><b>Manager Name</b><span style="color:red;">*</span></label>
	<input type="text" placeholder="Enter Manager Name" name="mname"  onKeyPress="return ValidateAlpha(event);" required>
	<br>
	<br>
        <label for="cemail"><b>Company Email</b>&nbsp;&nbsp;&nbsp;</label><span style="color:red;">*</span>
	<input type="email" placeholder="Enter Email of manager" name="cemail" required>
	<br>
	<br>
        <label for="psw"><b>Password      </b><span style="color:red;">*</span></label>
	<input type="password" placeholder="Enter Password" name="psw" id="psw" required>
	<br>
        <label for="psw-repeat"><b>Re-type Password</b><span style="color:red;">*</span></label>
     	 <input type="password" placeholder="Re-type Password" name="psw-repeat" id="psw-repeat" required>
      	<br>

    	<div class="clearfix">
	<button type="submit" class="signupbtn">Sign Up</button>
        <button type="reset" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
 </div>
         <span class="text-muted"><em><span style="color:red;">*</span> Indicates required field</em></span>
</form>
   
</div>
</body>
</html>
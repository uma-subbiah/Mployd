<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    
    <style>
        
        @import "http://fonts.googleapis.com/css?family=Raleway";

div#abc {
width:100%;
height:100%;
opacity:.95;

display:none;

background-color:#FFFFFF;
overflow:auto;
position:absolute;
left:50%;
top:40%;
margin-left:-202px;
font-family:'Raleway',sans-serif;
width: 28%;
     padding-left:0em;
     height: 61%;
}

div#def {
width:100%;
height:100%;
opacity:.95;

display:none;

background-color:#FFFFFF;
overflow:auto;
position:absolute;
left:50%;
top:40%;
margin-left:-202px;
font-family:'Raleway',sans-serif;
width: 28%;
     padding-left:0em;
     height: 80%;
}


div#pqr{
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


img#close {
position:absolute;
max-width:3px;
min-width:2px;
cursor:pointer
}

form {
max-width:300px;
min-width:250px;
padding:10px 50px;
border:2px solid gray;
border-radius:10px;
font-family:raleway;
background-color:#fff
}
p {
margin-top:30px
}
h2 {
background-color:#FEFFED;
padding:20px 35px;
margin:-10px -50px;
text-align:center;
border-radius:10px 10px 0 0
}
hr {
margin:10px -50px;
border:0;
border-top:1px solid #ccc
}
input[type=text] {
width:82%;
padding:10px;
margin-top:30px;
border:1px solid #ccc;
padding-left:40px;
font-size:16px;
font-family:raleway
}

#address {
background-image:url(../images/msg.png);
background-repeat:no-repeat;
background-position:5px 7px;
width:82%;
height:95px;
padding:10px;
resize:none;
margin-top:30px;
border:1px solid #ccc;
padding-left:40px;
font-size:16px;
font-family:raleway;
margin-bottom:30px
}

#pincode {
background-image:url(../images/name.jpg);
background-repeat:no-repeat;
background-position:5px 7px
}

#designation {
background-image:url(../images/name.jpg);
background-repeat:no-repeat;
background-position:5px 7px
}

#sal {
background-image:url(../images/name.jpg);
background-repeat:no-repeat;
background-position:5px 7px
}

#nthJob {
background-image:url(../images/name.jpg);
background-repeat:no-repeat;
background-position:5px 7px
}

#submit {
text-decoration:none;
width:100%;
text-align:center;
display:block;
background-color:#FFBC00;
color:#fff;
border:1px solid #FFCB00;
padding:10px 0;
font-size:20px;
cursor:pointer;
border-radius:5px
}
span {
color:red;
font-weight:700
}
button {
width: 27%;
height:45px;
border-radius:3px;
background-color:#708090;
color:#fff;
font-family:'Raleway',sans-serif;
font-size:18px;
cursor:pointer
}
        
        </style>
    
     <%
             String c= (String)session.getAttribute("username");
             
               try {
             
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+c+"'");
       if(rs.next())
       {
             out.println(rs.getString(1));
      rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+rs.getString(1)+"'");
        if(rs.next())
             out.println(rs.getString(1));}
             
                 
   }

   catch (Exception e) {
    e.printStackTrace();
   }
                session.setAttribute("username",c );
                  
        %>
    
<meta name="viewport" content="width=device-width, initial-scale=1">

<script>
function myFunction1() {
   
    var x = document.getElementById("abc");
    var y = document.getElementById("def");
   
    if (x.style.display === "block") {
        x.style.display = "none";
    } else {
        x.style.display = "block";
        y.style.display = "none";
       
    }
}

function myFunction2() {
   
    var x = document.getElementById("abc");
    var y = document.getElementById("def");
   
    if (y.style.display === "block") {
        y.style.display = "none";
    } else {
         x.style.display = "none";
        y.style.display = "block";
       
    }
}


function close(){
    
        var x = document.getElementById("abc");
        var z = document.getElementById("ghi");
        var y = document.getElementById("def");
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "none"; 
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
</head>
<body style="background-image: url('http://designtowwebberz.com/images/slider/development.jpg')">
    <div  id="pqr">
         <%String b=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=b%>"  width="80" height="80"/>
         &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;

        
  
         
        </div>
   
    <br>
    <br>
    <br>
    <br>

    <h1 align="center" style=" color: #1C98B2; font-family: Georgia;">UPDATE DETAILS</h1>
   
    
&emsp;   &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; <button onclick="myFunction1()">COMPANY DETAILS</button> &emsp; &emsp;

<button onclick="myFunction2()">JOB DETAILS</button> 

<div id="abc">
<form >
         <br>
        <h4> COMPANY DETAILS </h4>
        <br>
        Company Address:<input type="text" name="address" value="" />
        <br>
        <br>
        
        Web site:<br>
        <input type="text" name="website" value="" />
        <br>
        <br>
        <button onclick="close1()" type="submit" value="SAVE" name="submit" formaction="e_company" >SAVE</button> &emsp;
        <button onclick="close()">CLOSE</button>        

</form>.
</div>




<div id="def">
<form>
     
    
   
        <h4> JOB VACANCY </h4>
      
        <br>
        Designation:<input type="text" name="designation" value="" />
        <br>
        <br>
         Salary Offered:<br>
        <br>
        <input type="number" name="salary" value="" />
        <br>
        <br>
        Branch Address
        <br>
        <br>
        Locality/Area:<input type="text" name="locality" value="" />
        <br>
        <br>
         City:<input type="text" name="city" value="" />
        <br>
        <br>
        Pincode:<input type="text" name="pincode" value="" />
        
        <br>
        <br>
        <button onclick="close1()" type="submit" value="SAVE" name="submit" formaction="e_vacancy">SAVE</button> &emsp;
          <button onclick="close()">CLOSE</button>        
        </form>
</div>




</body>
</html>
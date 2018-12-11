<%-- 
    Document   : who_are_you
    Created on : 26 Jul, 2018, 9:26:52 AM
    Author     : PRIYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            input[type="submit"] {
   width:340px;
  height:70px;
  display:block;
  font-family:Arial, "Helvetica", sans-serif;
  font-size:16px;
  font-weight:bold;
  color:#fff;
  text-decoration:none;
  text-transform:uppercase;
  text-align:center;
  text-shadow:1px 1px 0px #37a69b;
  padding-top:6px;
  margin: 2% 40%;
  cursor:pointer;
  border: none;  
  background-color: #24bdde;
  background-image: linear-gradient(top,#3db0a6,#3111);
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius:5px;
  box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px 5px #999;
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


input[type="submit"]:active {
  top:3px;
  box-shadow: inset 0px 1px 0px #2ab7ec, 0px 2px 0px 0px #31524d, 0px 5px 3px #999;
}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>who are you</title>
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
    <br>
        
        &emsp;<h1 align="center" style=" color: #1C98B2; font-family: Georgia;">WHO ARE YOU?</h1>
        <br>
        <br>
        <form action="a_signup.jsp" >
            <input type="submit" value="jobseeker" name="jobseeker" onclick="seeker_signup" />
        </form>
        <form action="e_signup.jsp">
        <input type="submit" value="jobprovider" name="jobprovider" onclick="provider_signup"/>
        </form>
    </body>
</html>


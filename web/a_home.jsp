<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@ page import = "java.io.*,java.util.*" %>
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
 input[disabled]{

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
  background-color: #8c8cd9;
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


  .btn {
width: 27%;
height:45px;
border-radius:3px;
background-color:#cd853f;
color:#fff;
font-family:'Raleway',sans-serif;
font-size:18px;
cursor:pointer;
 box-shadow: inset 0px 1px 0px #2ab7ec, 0px 2px 0px 0px #31524d, 0px 5px 3px #999;
  margin-left:75%;
  margin-right:50%;
  display:block;
  margin-top:90%;
  margin-bottom:70%;
  
      
}
        
input[type="submit"]:active {
  top:5px;
 
}
            
        </style>
    </head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>applicant_home</title>
    
    <body style="background-image: url('http://designtowwebberz.com/images/slider/development.jpg')">
                <%
            String s = request.getParameter("username"); 
            String p = request.getParameter("password");
            String aid=null;
            out.println(s+p);
           
   try{  
             
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
       if(rs.next())
       {
             out.println(rs.getString(1));
      rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+rs.getString(1)+"'");
        if(rs.next())
             aid=rs.getString(1);
                     out.println(aid);}
       
session.setAttribute("username",s);
session.setAttribute("password",p);
%>
        

<div  id="pqr">
         <%String b=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=b%>"  width="80" height="80"/>
         &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
        <a href="signin.jsp " style =" padding-left: 970px; color: white; font-size: 25px ;" > LOGOUT </a>
      </div>
   
    <br>
    <br>
    <br>
    <br>
        <form action="a_update.jsp" align="center">
            <input name="username" type="hidden" value=""/>
            <input type="submit" value="UPDATE YOUR PROFILE" name="update"/>
        </form>
        <form action="job_oppurtunities.jsp">
            <input type="submit" value="JOB OPPORTUNITIES" name="oppurtunities"  />
        </form>
        <form >
            <%
               
                String app="Select Applicant_id from Applications where Applicant_id='2001'";
             rs=st.executeQuery(app);
        if(rs.next()){
                
            %>
            <input type="submit" value="APPLICATION FORM" name="apply" formaction="formapply"  disabled="disabled"/><% } else{%>
             <input type="submit"  value="APPLICATION FORM" name="apply" formaction="formapply" /> <% }}
             catch (Exception e) {
    e.printStackTrace();
   }%>
        </form>
        <form >
        <input type="submit" value="VIEW PROFILE" name="profile" formaction="a_viewprofile.jsp"/>
        </form>
    </body>
</html>
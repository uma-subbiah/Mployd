<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jobs</title>
        <style>
            
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

            
        </style>
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
<br>
        <h2 style=" text-align:center; font-family: Georgia; " > JOB REQUESTS </h2>
        
        <table  border="3" width="50%" cellspacing="3" cellpadding="8" align="center">
            <thead><th>Applicant Name</th><th>Job Location</th><th>Salary</th><th>Designation</th><th>Go To Profile</th><th>Approval</th></thead>
    <%
        String s =(String)session.getAttribute("username");
        String p =(String)session.getAttribute("password");
 
         String a1=null,a2=null;
       
           String eid=null,u=null,x=null;
           int counter=1;
         try {
        
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
        
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
       if(rs.next())
       {
           u=rs.getString(1);
               }     
            rs=st.executeQuery("SELECT Employer_id from Employers WHERE User_id='"+u+"'");
            if(rs.next())
       {
           eid=rs.getString(1);
           
          }


 String a="select applicant_id from status where employer_id='"+eid+"' and request=1";

  rs=st.executeQuery(a);
  if(rs.next())
  {
      a1=rs.getString(1);
       
  }
String q1="select applicants.name,applications.pref_workLocation,applications.SalaryExpected,applications.PostApplyingFor from applications,applicants where applicants.applicant_id=applications.applicant_id and applicants.applicant_id='"+a1+"' and applications.applicant_id='"+a1+"'";
     
ResultSet rs1=st.executeQuery(q1);
       if(rs1.next())
  {
      a2=rs1.getString(1);
  }
   
  
   while (rs1.next()) {
                ++counter;}

           int counter1=counter;
        ResultSet rs2=st.executeQuery(q1);
      for(int j = 1; j<=counter1;j++){
        while(rs2.next())
        {
                 
            %>
                <tr>
                 <%
                 for(int i = 1; i<=4;i++)
                    { %>
                     <td>
                     <%=(rs2.getString(i))%>
                      </td> 
                    
                <% 
                     }}
             session.setAttribute("app",a1);
session.setAttribute("username", s);
             session.setAttribute("password",p);
                %><td><a href="e_view.jsp" align="center" style=" color: #1C98B2; font-family: Georgia;">View profile</a> </td>
<% String q3="Select jobid from Status where Applicant_id='"+a1+"' AND Response=1 AND Employer_id='"+eid+"'";
 rs1=st.executeQuery(q3);
       if(rs1.next()){
%>
<td><form> <input type="submit"  value="approved" name="app" disabled/></form> </td>  
<% } else{ %>
    <td><form><input type="submit"  value="call for interview" name="app" formaction="approve"/></form></td>                    
                </tr>
            <% 
        }   }}
catch (Exception e) {
    e.printStackTrace();
   }
    %>
</table>                   
    </body>
</html>

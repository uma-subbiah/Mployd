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
<h2 style=" text-align:center; font-family: Georgia; " > JOB OPPORTUNITIES </h2>
        <table  border="3" width="50%" cellspacing="3" cellpadding="8" align="center">
            <thead><th>Company Name</th><th>Designation</th><th>Salary</th><th>Job Location</th><th>Request</th><th>Response</th></thead>
    <%
        String s =(String)session.getAttribute("username");
        String p =(String)session.getAttribute("password");
         String a1=null,a2=null;
           String aid=null,u=null,x=null;
            String job=null;
           int counter=1;
         try{
        
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
        
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
       if(rs.next())
       {
           u=rs.getString(1);
               }     
            rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+u+"'");
            if(rs.next())
       {
           aid=rs.getString(1);
          }


 String a="Select pref_workLocation from Applications where Applications.applicant_id='"+aid+"'";
  rs=st.executeQuery(a);
  if(rs.next())
  {
      a1=rs.getString(1);
  
  }
String q1="Select pincode from Job_Location where City ='"+a1+"'";
      ResultSet rs1=st.executeQuery(q1);
       if(rs1.next())
  {
      a2=rs1.getString(1);
          
      
  }
   String q2="select employers.COMPANYNAME,jobs.JOBDESIGNATION,jobs.SALARYOFFERED from employers,jobs where employers.employer_id=jobs.employer_id and jobs.pincode='"+a2+"'";
  
   rs1=st.executeQuery(q2);
       if(rs1.next())
  {
      a1=rs1.getString(1);
      
  }
      
   String q3="select jobs.employer_id,jobs.jobid from employers,jobs where employers.employer_id=jobs.employer_id and jobs.pincode='"+a2+"'";
   rs1=st.executeQuery(q3);
       if(rs1.next())
  {
      a1=rs1.getString(1);
      job=rs1.getString(2);
  }
  
   while (rs1.next()) {
                ++counter;}

           int counter1=counter;
        ResultSet rs2=st.executeQuery(q2);
        
      for(int j = 1; j<=counter1;j++){
        while(rs2.next())
        {
                 
            %>
                <tr>
                 <%
                 for(int i = 1; i<=3;i++)
                    { %>
                     <td>
                     <%=(rs2.getString(i))%>
                      </td> 
                    
                <% 
                     }
String h="Select jobid from Status where Applicant_id='"+aid+"' AND Jobid='"+job+"'";

ResultSet r3=st.executeQuery(h);

if(r3.next()){
%> <td> <%

    q3="select job_location.Location,job_location.city,job_location.pincode from jobs, job_location where jobs.employer_id='"+a1+"' and jobs.pincode=job_location.pincode"; 
    rs1=st.executeQuery(q3);
       if(rs1.next())
  { out.print(rs1.getString(1)); %> , <%
  out.print(rs1.getString(2));%> , <%
  out.print(rs1.getString(3));
  }
        q3="Select jobid from Status where Applicant_id='"+aid+"' AND Request=1";
 rs1=st.executeQuery(q3);
       if(rs1.next()){
%>
</td><td><form> <input type="submit"  value="requested" name="apply" disabled/></form> </td>  
<td><% } else{ %>
    <td><form action="a_request"><input type="submit"  value="request job" name="apply" /></form></td>  
<td><%
}
String resp;
q1="Select Response from Status where Applicant_id='"+aid+"' AND Employer_id='"+a1+"' AND jobid='"+job+"'";
        rs1=st.executeQuery(q1);
       
    
       if(rs1.next())
  {
      resp=rs1.getString(1);
     if(resp.equals("0"))
         out.println("selected for interview");
else if(resp.equals("1"))
     out.println("No response yet");
     

     }
      
   
%>
</td> 
                </tr>
            <% 
        }
 }
}}
   catch (Exception e) {
    e.printStackTrace();
   }
            session.setAttribute("username", s);
            session.setAttribute("password", p);
             session.setAttribute("app",a1);
            session.setAttribute("job",job);
    %>
</table>   
    </body>
</html>

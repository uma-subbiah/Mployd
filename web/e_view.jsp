<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view profile</title>
        
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
        <%String a=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=a%>"  width="80" height="80"/>
         &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
     
        
  
         
        </div>
         
         <br>
         <br>
         <br>
         <br>
           <%
            String s =(String)session.getAttribute("username"); 
            String aid=(String)session.getAttribute("app"); 
             String p=(String)session.getAttribute("password");
             
           String n="",u="",mail="",a1="",doj="";
           Date dob=new Date();
           String c1="",c2="";
           String g1="",y1="",d1="",i1="";
            String j="",sal="",org="",exp="";
         try {
             
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("SELECT * from Users_det WHERE Email_id='"+s+"'");
       if(rs.next())
       {
           u=rs.getString(1);
           
            rs=st.executeQuery("SELECT * from Applicants WHERE User_id='"+u+"'");
      String c=null;
       if(rs.next()){
             aid= rs.getString(2);
             n=rs.getString(3);
             dob=rs.getDate(4);

                    }
 
       String q;
       %>
      


                <h1 align="center" style=" color: #1C98B2; font-family: Georgia;"> Educational Qualifications</h1>
        <%  q="SELECT * from Educational_Qualifications WHERE Applicant_id='"+aid+"'";  

        rs=st.executeQuery(q);

        while(rs.next())
        {
            g1=rs.getString(2);
            y1=rs.getString(3);
            d1=rs.getString(4);
            i1=rs.getString(5);
            
        %>
                <table border="3" width="22%" cellspacing="3" cellpadding="8" align="center">
            <tbody>
                 
        
                <tr>
                    <td>Institution</td>
                    <td><%=i1%></td>
                </tr>
                <tr>
                    <td>Grade point</td>
                    <td><%=g1%></td>
                </tr>
                <tr>
                    <td>Degree</td>
                    <td><%=d1%></td>
                </tr>
                <tr>
                    <td>Year of Graduation</td>
                    <td><%=y1%></td>
                </tr>
               
               </tbody>
        </table><% } %>
               
                           <h1 align="center" style=" color: #1C98B2; font-family: Georgia;"> Previous Experience</h1>
       
                            <%q="SELECT * from Previous_Experience WHERE Applicant_id='"+aid+"'";  
         
        rs=st.executeQuery(q);

        while(rs.next())
        {
            j=rs.getString(2);

            org=rs.getString(4);
            exp=rs.getString(5);
           
       
%>

                           <table border="3" width="22%" cellspacing="3" cellpadding="8" align="center">
            <tbody>
                <tr>
                    <td>Organisation</td>
                    <td><%=org%></td>
                </tr>
                 <tr>
                    <td>Designation</td>
                    <td><%=j%></td>
                </tr>
                <tr>
                    <td>Years of Experience</td>
                    <td><%=exp%></td>
                </tr>
               
               </tbody>
        </table>
                    <%
                         }
         }
         }

   catch (Exception e) {
    e.printStackTrace();
   }
out.print(s+p+aid);
            session.setAttribute("username", s);
session.setAttribute("password", p);
session.setAttribute("app", aid);
                        %>
    </body>
</html>

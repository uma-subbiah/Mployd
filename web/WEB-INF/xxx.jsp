
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <title>
            <%
                int user=Integer.parseInt(request.getParameter("username"));
                try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","march1999");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("Select mail_id from worker where ID="+user);
             if(rs.next())
             {
                String mailID=rs.getString("mail_id");
                ResultSet rs1=st.executeQuery("select first_name from s_user where mail_id='"+mailID+"'");
             if(rs1.next()) out.println("Welcome "+(rs1.getString("first_name")));
             }
             
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                %>
        </title>
<!--<title>Welcome Worker</title> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body class="w3-light-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
         <img src="/w3images/avatar_hat.jpg" style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
            <h2>
                <%
                      try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","march1999");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("Select mail_id from worker where ID="+user);
             if(rs.next())
             {
                String mailID=rs.getString("mail_id");
                ResultSet rs1=st.executeQuery("select first_name from s_user where mail_id='"+mailID+"'");
             if(rs1.next()) out.println(rs1.getString("first_name"));
             }
             
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                    %>
               </h2>
          </div>
        </div>
        <div class="w3-container">
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>
              <%
                  try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","cse16153");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("Select designation from worker where ID="+user);
             if(rs.next())
             {
                out.println(rs.getString("designation"));
             }
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                  %>
          
          </p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>India</p>
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>
          <%
                  try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","cse16153");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("Select mail_id from worker where ID="+user);
             if(rs.next())
             {
                out.println(rs.getString("mail_id"));
             }
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                  %>
          
          </p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>
       <%
                      try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","cse16153");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("Select mail_id from worker where ID="+user);
             if(rs.next())
             {
                String mailID=rs.getString("mail_id");
                ResultSet rs1=st.executeQuery("select phone_number from s_user where mail_id='"+mailID+"'");
             if(rs1.next()) out.println(rs1.getString("phone_number"));
             }
             
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                    %>
          
          
          </p>
          <hr>

          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Review</b></p>
          <p>
              
               <%
                   int x=10;
                      try
        {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","cse16153");
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery("select garbage_id from cleans where id="+user);
             if(rs.next())
             {
                out.println(rs.getString("garbage_id"));
             }
             
        }
        catch (Exception e){
            out.println("try error");
            //e.printStackTrace();
        }
                    
              
                %>
              
              
              
          </p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:90%">90%</div>
          </div>
                    
                  
          <p>Garbageid2</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:80%">
              <div class="w3-center w3-text-white">80%</div>
            </div>
          </div>
          <p>Garbage3</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
          </div>
          <p>Toilet1</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:50%">50%</div>
          </div>
          <br>
          <br>
        </div>
      </div><br> 

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Work Details</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Joining Date</b></h5>
          
          <p  </p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Salary</b></h5>
          <p>  </p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Update Profile</b></h5>
        
        </div>
      </div>

     

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

  <footer class="w3-container w3-teal w3-center w3-margin-top">
  <p>SANITATION STATS</p>
</footer>
              
                
                
                
</body>
</html>
worker.txt
Displaying worker.txt.

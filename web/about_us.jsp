<%-- 
    Document   : about_us
    Created on : 16 Oct, 2018, 7:55:13 PM
    Author     : PRIYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          <style>
            h1 {
                font-family: Georgia;
                font-size: 50px;
                color: #1C98B2;
                
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
   border-bottom: 1px solid black; /* some styling */
    margin-bottom:70%;

}
            
            h6 {
   
    border: 1px solid white;
    padding: 10px;
     margin-left:36%;
  margin-right:40%;
    width: 400px;
    height: 200px;
    text-align: center;
    font-size: 15px;
    font-family: Georgia;
}
        </style>
    </head>
    <body style="background-image: url('http://designtowwebberz.com/images/slider/development.jpg')">
        
        
        <div  id="pqr">
        <%String logo=request.getContextPath() + "/logo1.jpg";%>
        <img src="<%=logo%>"  width="80" height="80"/>
         &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;
        <a href="statistics.jsp" style =" padding-left: 920px; color: white; font-size: 25px ;" > STATISTICS </a>
        
        </div>
         <br>
         <br>
         <br>
        <h1 align="center">MPLOYD</h1>
      <p>Mployd is an online portal that aims to bridge the gap between employment providers and potential employees. 

Unemployment is a major menace in our country where there is a huge reserve of talent.
Thus we decided to create an employment portal that aims to eradicate unemployment in our country. 
An important reason for unemployment in our country is the lack of awareness of the opportunities available, pertaining to one’s educational qualifications and level of expertise.

Here at Mployd, we connect employers and applicants in an easy-to-use, user friendly and efficient manner.

Anyone can log on to our system and register himself/herself. Then you identify yourself as an applicant or an employer. 
Thus our platform is two-way — you can apply for a job as an applicant, or search for employees for your business/startup.

We aim to help spread awareness about a variety of jobs offered in the market today, and this is made as simple  as possible through our platform.

We hope you enjoy using our employment service, and look forward to constructive feedback about your experience.
To contact us / report an issue, please write to us at mployd@dbms.com.
        </p>
       
    </body>
</html>

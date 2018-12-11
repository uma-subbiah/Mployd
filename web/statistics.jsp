<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import= "com.google.gson.Gson"%>
<%@ page import= "com.google.gson.JsonObject"%>
<%@ page import = "java.io.*,java.util.*" %>
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
        <a href="signin.jsp" style =" padding-left: 970px; color: white; font-size: 25px ;" >LOGIN </a>
        
        </div>
         <br>
         <br>
         <br>
        <h1 align="center">MPLOYD</h1>
      
          <%
class statistics {
        public Integer job;
        public Integer user;
        public String place;
        public void setId(Integer id){
            this.job= job;
        }
        public statistics(){
        job=0;
        user=0;
        place="null";
        }

        public String getPlace(){
            return place;
        }
        public int getJob(){
            return job;
        }
        public int getUser(){
            return user;
        }

        public void setPlace(String place){
            this.place = place;
        }
        public void setJob(int job){
            this.job = job;
        }
        public void setUser(int user){
            this.user = user;
        }

    }
    Gson gsonObj = new Gson();

Map<Object,Object> map = null;
Map<Integer,statistics> s = new HashMap<Integer, statistics>();
List<Map<Integer,statistics>> list = new ArrayList<Map<Integer,statistics> >();
String dataPoints = null;
 
try{
	 String s1,s2;
       
         

        
      String[] u1= new String[10];
      String[] u2= new String[10];
      String[] u3= new String[10];
      String[] u4= new String[10];
      int i=0,j=0,k=0,l,m;
      s1="select city,count(*) as no_of_job_offers from job_location natural join jobs  where pincode in (select pincode from jobs,employed_at where jobs.jobid = employed_at.jobid) group by city order by city asc";
      s2="select address, count(*) as no_of_users from personal_details group by address order by address asc";  
  
         
        Class.forName("oracle.jdbc.driver.OracleDriver");   
       Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999");
       Statement st=con.createStatement();
        
        ResultSet rs=st.executeQuery(s1);
       while(rs.next())
       {
           u1[i]=rs.getString(1);
            u2[i]=rs.getString(2);
        
           i++;
               }
       rs=st.executeQuery(s2);
       while(rs.next())
       {
           u3[j]=rs.getString(1);
            u4[j]=rs.getString(2);
          
           j++;
               }
               if(i<j){
                   k=i;
               }else
                   k=j;
   int q=0;
         for(l=0; l<i;l++){
             for(m=0;m<j;m++){
                 if(u1[l].equals(u3[m])){
                       statistics stat = new statistics();
                     stat.setPlace(u1[l]);
                     stat.setJob(Integer.parseInt(u2[l]));
                     stat.setUser(Integer.parseInt(u4[m]));
                     s.put(q, stat);
                     list.add(s);
                    q++;
                    
                      
                 }
             }
         }
        %>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
    ['location', 'no of jobs obtained','no of applicants'],
    ['COIMBATORE', 200,100],
    ['hyderabad', 100,200],
    ['mumbai', 200,500],
    ['delhi', 100,100],
        ]);

        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'location, no of jobs obtained, and no of applicants'
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      } 
    </script>
  </head>
  <body>
   
        <table border="2" width="700" cellspacing="1" cellpadding="1" align="center">
            <thead>
                <tr> 
                    <th> CITY</th>
                    <th>Number of Users registered</th>
                    <th>Number of Users employed</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <tr> <%
              for(Entry<Integer, statistics> t : s.entrySet()){
        statistics a = t.getValue();%>
                    <td> <%out.print(a.getPlace());%></dd>
                    <td><%out.print(a.getJob());%></td>
                    <td><% out.print(a.getUser());%></td>
                 
                </tr>
                    <% }    
                con.close();
	}
	
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}

%>                          
            </tbody>
        </table>
            <br>
            <br>
            <br>

 <div position="absolute"  id="barchart_material" style="width: 900px; height: 450px; display: block;
    margin-left: auto;
    margin-right: auto;
    width: 40%; align-content: center"></div>
    </body>
</html>

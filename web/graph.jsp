<%@page import="java.util.Map.Entry"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import= "com.google.gson.Gson"%>
<%@ page import= "com.google.gson.JsonObject"%>
 

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
           out.println(u1[i]+u2[i]);
           i++;
               }
       rs=st.executeQuery(s2);
       while(rs.next())
       {
           u3[j]=rs.getString(1);
            u4[j]=rs.getString(2);
           out.println(u3[j]+u4[j]);
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
                     out.print(stat.getUser()+stat.getPlace()+stat.getJob());
                      
                 }
             }
         }
         dataPoints = gsonObj.toJson(list);
              for(Entry<Integer, statistics> t : s.entrySet()){
        statistics a = t.getValue();
        out.print("Place: " + a.getPlace());
        
        out.print("Jobs: " + a.getJob());
    
        out.print("User: " + a.getUser());
         }    
                con.close();
	}
	
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}

%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Olympic Medals of all Times (till 2016 Olympics)"
	},
	axisY: {
		title: "Medals"
	},
	legend: {
		cursor:"pointer",
		itemclick : toggleDataSeries
	},
	toolTip: {
		shared: true,
		content: toolTipFormatter
	},
	data: [{
		type: "bar",
		showInLegend: true,
		name: "Gold",
		color: "gold",
		dataPoints: [ <% for(Entry<Integer, statistics> t : s.entrySet()){
        statistics a = t.getValue();%>
			{ y: <%out.print(a.getUser());%>, label: "<%out.print(a.getPlace());%>" },
			
		 <% }%> ]
	}
	
	}]
});
chart.render();

function toolTipFormatter(e) {
	var str = "";
	var total = 0 ;
	var str3;
	var str2 ;
	for (var i = 0; i < e.entries.length; i++){
		var str1 = "<span style= \"color:"+e.entries[i].dataSeries.color + "\">" + e.entries[i].dataSeries.name + "</span>: <strong>"+  e.entries[i].dataPoint.y + "</strong> <br/>" ;
		total = e.entries[i].dataPoint.y + total;
		str = str.concat(str1);
	}
	str2 = "<strong>" + e.entries[0].dataPoint.label + "</strong> <br/>";
	str3 = "<span style = \"color:Tomato\">Total: </span><strong>" + total + "</strong><br/>";
	return (str2.concat(str)).concat(str3);
}

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}

};
</script>
</head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>         
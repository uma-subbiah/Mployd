/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PRIYA
 */
public class graph_det extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           doPost(request, response);
        
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String g=request.getParameter("graph");
         String s1,s2;
       
       
Map<Integer,statistics> s = new HashMap<Integer, statistics>();
         PrintWriter out = response.getWriter();
      String[] u1= new String[10];
      String[] u2= new String[10];
      String[] u3= new String[10];
      String[] u4= new String[10];
      int i=0,j=0,k=0,l,m;
      s1="select city,count(*) as no_of_job_offers from job_location natural join jobs  where pincode in (select pincode from jobs,employed_at where jobs.jobid = employed_at.jobid) group by city order by city asc";
      s2="select address, count(*) as no_of_users from personal_details group by address order by address asc";  
      try {
        
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
                    q++;
                     out.print(stat.getUser()+stat.getPlace()+stat.getJob());
                     
                    
                 }
             }
         }
        
              for(Entry<Integer, statistics> t : s.entrySet()){
        statistics a = t.getValue();
        out.print("Place: " + a.getPlace());
        
        out.print("Jobs: " + a.getJob());
    
        out.print("User: " + a.getUser());
   
    
         
         }
        //        request.setAttribute("graph", s);
      //  request.getRequestDispatcher("lala.jsp").forward(request, response);
      }
   
          catch (Exception e) {
    e.printStackTrace();
   }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PRIYA
 */
public class apply extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        doPost(request, response);
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
     String c= (String)session.getAttribute("username");
        PrintWriter out = response.getWriter();
        String l=request.getParameter("pref_loc");
        String sal=request.getParameter("sal_exp");
        String a=request.getParameter("post_app");
        
         String dt=request.getParameter("pref_start");
 char[] d = dt.toCharArray();
  char[] d1=new char[5];
  char[] d2=new char[3];
  char[] d3=new char[3];
  char[] d4=new char[11];
  int i;
  for(i=0;i<4;i++)
  {
      d1[i]=d[i];
  }
  for(i=0;i<2;i++)
  {
      d2[i]=d[i+5];
  }
  for(i=0;i<2;i++)
  {
      d3[i]=d[i+8];
  }
  for(i=0;i<2;i++)
  {
      d4[i]=d3[i];
  }
  d4[i]='-';
  for(i=3;i<5;i++)
  {
      d4[i]=d2[i-3];
  }
  d4[i]='-';
  for(i=6;i<8;i++)
  {
      d4[i]=d1[i-6];
  }

 String dtt =new String(d4);
 out.println(dtt+a+dt+sal+l);
    
 try {
          
        Class.forName("oracle.jdbc.driver.OracleDriver");  
        String id=null;
       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+c+"'");
       if(rs.next())
       {
             out.println(rs.getString(1));
      rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+rs.getString(1)+"'");
        if(rs.next())
        {     id=rs.getString(1);
            out.println(id);
        }}
 
       String query = "INSERT INTO Applications VALUES('"+id+"','"+dtt+"','"+l+"','"+sal+"','"+a+"')";
       out.print(query);
       PreparedStatement ps = con.prepareStatement(query);
          int c1=ps.executeUpdate();
          if(c1>0)
          {
              out.println(query);
          }
          con.close();
          out.print("db connection closed!");
          
 }
 }
 catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
 RequestDispatcher rd = request.getRequestDispatcher("a_home.jsp");
        rd.forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

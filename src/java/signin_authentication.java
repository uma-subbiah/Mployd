/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRIYA
 */
public class signin_authentication extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pwd = request.getParameter("password");
  String un = request.getParameter("username");
        response.setContentType("text/html;charset=UTF-8");
        doPost(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  //String oname = request.getParameter("oname");
String pwd = request.getParameter("password");
  String un = (String)request.getParameter("username");
   try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
    
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+un+"' AND Password='"+pwd+"'");
       out.println(rs);
        String c=null;
           while(rs.next())
           {
               c=rs.getString(1);
           }
          
      
       if(c == null)
       {
          
            out.println("Invalid username or password!!");
        RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
        rd.forward(request, response);
          
       }
       
       else {
           
        String c1=null;
        
      ResultSet rs1;
      rs1=st.executeQuery("SELECT User_id from Applicants WHERE User_id='"+c+"'");
       if(rs1.next())
           {   
               c1=rs1.getString(1);
                request.setAttribute("password",pwd);
                request.setAttribute("username",c);
        out.print("ttt"+c);
      RequestDispatcher rd1 = request.getRequestDispatcher("a_home.jsp");
      rd1.forward(request, response);

           }
       else
       {
           out.println("TEST3");
           rs1=st.executeQuery("select User_id from Employers where User_id='"+c+"'");
          if(rs1.next())
           {   
               out.println(rs1.getString(1));
                out.println(c);
           
                request.setAttribute("password",pwd);
                request.setAttribute("username",c);
           RequestDispatcher rd = request.getRequestDispatcher("e_home.jsp");
       rd.forward(request, response);}
       }
       }
       }
   }
   
  catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

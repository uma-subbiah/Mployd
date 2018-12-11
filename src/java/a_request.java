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
public class a_request extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet a_request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet a_request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String s=(String)session.getAttribute("username");
        String p=(String)session.getAttribute("app");
        String pass=(String)session.getAttribute("password");
         String job=(String)session.getAttribute("job");

                out.println(s+p+job);
         try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
    
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
        
       String c=null;
       if(rs.next())
       {
             out.println(rs.getString(1));
      rs=st.executeQuery("SELECT Applicant_id from Applicants WHERE User_id='"+rs.getString(1)+"'");
        if(rs.next()){
             c= rs.getString(1);
                    out.println(c);}
                  
                                String query ="INSERT INTO Status VALUES('"+c+"','"+p+"',1,0,'"+job+"')";
                                out.println(query);
                                PreparedStatement ps = con.prepareStatement(query);
                        int i=0;
                        i=ps.executeUpdate(query);
                        if(i>0)
                        {   out.println("query" + query);}
                        
                        con.close();
                                out.println("Disconnected from database");
                            
                    }
         }
                   
               }
       
   
  catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
    session.setAttribute("username", s);
             session.setAttribute("password",pass);
             session.setAttribute("app",p);
            session.setAttribute("job",job);
       RequestDispatcher rd = request.getRequestDispatcher("job_oppurtunities.jsp");
        rd.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

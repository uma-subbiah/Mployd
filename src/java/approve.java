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
public class approve extends HttpServlet {

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
     * @param request servlet request
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
        String pa=(String)session.getAttribute("password");
String p=(String)session.getAttribute("app");
                out.println(pa+s+p);
         try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
    
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
        
       String c=null;
       if(rs.next())
       {
             out.println(rs.getString(1));
      rs=st.executeQuery("SELECT Employer_id from Employers WHERE User_id='"+rs.getString(1)+"'");
        if(rs.next()){
             c= rs.getString(1);
                    out.println(c);}
                    
                                String query ="Update Status SET response=1 WHERE Employer_id='"+c+"' AND Applicant_id='"+p+"'";
                                 String j;
                                
                                out.println(query);
                                PreparedStatement ps = con.prepareStatement(query);
                        int i=0;
                        i=ps.executeUpdate(query);
                         rs=st.executeQuery("Select Jobid from Status WHERE Employer_id='"+c+"' AND Applicant_id='"+p+"'");
                         if(rs.next())
                         {
                             int m=0;
                             j=rs.getString(1);
                             String pt="Insert into Employed_At values('"+p+"','"+j+"',SYSDATE)";
                             rs=st.executeQuery(pt);
                             String n="Select nthJobOfferd from Jobs WHERE Employer_id='"+c+"' AND jobid='"+j+"'";
                             rs=st.executeQuery(pt);
                             if(rs.next())
                             {m=Integer.parseInt(rs.getString(1));
                             out.print( n+m);
                             m++;
                             }
                             String upd="Update Jobs set nthJobOfferd='"+m+"' where Employer_id='"+c+"'";
                             ps = con.prepareStatement(upd);
                             ps.executeUpdate(upd);
                         }
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
             session.setAttribute("password",p);
    // RequestDispatcher rd = request.getRequestDispatcher("e_response.jsp");
      //  rd.forward(request, response);
    }
    

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

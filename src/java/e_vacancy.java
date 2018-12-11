
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
public class e_vacancy extends HttpServlet {

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
         
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
         String s=(String)session.getAttribute("username");
         String d= request.getParameter("designation");
           String sal = request.getParameter("salary");
                String l = request.getParameter("locality");
                String city = request.getParameter("city");
                String p = request.getParameter("pincode");
                out.println(s+city+p+sal+l);
         try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
    
        ResultSet rs=st.executeQuery("SELECT User_id from Users_det WHERE Email_id='"+s+"'");
        int i=0;
       String c=null;
       String query;
       if(rs.next())
       {
             out.println(rs.getString(1));
             rs=st.executeQuery("SELECT Employer_id from Employers WHERE User_id='"+rs.getString(1)+"'");
            if(rs.next()){
                c= rs.getString(1);
                out.println(c);
            }
        int x=0;
        rs=st.executeQuery("SELECT max(Jobid) from Jobs");
        if (rs.next() ){
             x= rs.getInt(1); 
            out.println(x);
            x=x+1;
         
        }
            if ((d!= null)&&(sal!= null)&&(p!= null)&&(city!= null)&&(l!= null)){
                String query1 ="INSERT INTO Job_Location VALUES('"+p+"','"+city+"','"+l+"')";
                                
                                out.println("query1" + query1);
                                PreparedStatement ps = con.prepareStatement(query1);
                       
                       i=ps.executeUpdate(query1);
                        if(i>0)
                        { 
                            out.println("query" + query1);
                        }
                        query ="INSERT INTO Jobs VALUES('"+c+"','"+x+"','"+p+"','"+d+"','"+sal+"','0')";
                                out.println(query);
                                ps = con.prepareStatement(query);
                        
                        i=ps.executeUpdate(query);
                        if(i>0)
                        {   out.println("query" + query);}
                                             con.close();  
             out.println("Disconnected from database");}
                    }
         }
     
                               

               }
  catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
    
   RequestDispatcher rd1 = request.getRequestDispatcher("e_update.jsp");
   rd1.forward(request, response);
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


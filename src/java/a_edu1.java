
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
public class a_edu1 extends HttpServlet {
    
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
           String d = request.getParameter("degree");
                String i = request.getParameter("institution");
                String y = request.getParameter("yrgrad");
                 String g = request.getParameter("gpa");
                  
                out.println(s+d+i+y+g);
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
                    String query ="INSERT INTO Educational_Qualifications VALUES('"+c+"','"+g+"','"+y+"','"+d+"','"+i+"')";
                    out.println(query);
                    PreparedStatement ps = con.prepareStatement(query);
                    int x=0;
                    x=ps.executeUpdate(query);
                    
                     con.close();
                     out.println("Disconnected from database");
                            
                    }
         }
      
               }
       
   
  catch (ClassNotFoundException | SQLException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
   }
    
 //RequestDispatcher rd1 = request.getRequestDispatcher("a_update.jsp");
  //rd1.forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


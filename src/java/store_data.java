import static java.io.FileDescriptor.out;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import java.util.Random;

/**
 * Servlet implementation class UserDataServlet
 */
public class store_data extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pass = request.getParameter("psw");
  String cemail = request.getParameter("cemail");
  
  doPost(request,response);
  }
  @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
       String pass = request.getParameter("psw");
  String ce = request.getParameter("cemail");
  String oname = request.getParameter("oname");
  String mname = request.getParameter("mname");

  
   try {
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
       int x=0,y=0;
       ResultSet rs=st.executeQuery("SELECT max(User_id) from Users_det");
    if (rs.next() ){
         x= rs.getInt(1); 
         x=x+1;
         
    }
     rs=st.executeQuery("SELECT max(Employer_id) from Employers");
    if (rs.next() ){
         y= rs.getInt(1); 
         y=y+1;
         out.println(y);
         
    }
       String query1 ="INSERT INTO Users_det VALUES('"+x+"','"+pass+"','"+ce+"',SYSDATE)";
       PreparedStatement p = con.prepareStatement(query1);
       int c1=p.executeUpdate();
    String query2 ="INSERT INTO Employers VALUES('"+x+"','"+y+"','"+oname+"','"+mname+"')";
       PreparedStatement p2 = con.prepareStatement(query2);
       out.print(query2);
              int c2=p2.executeUpdate();
                
                if((c1>0)&&(c2>0))

                { out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>form_submission</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("successfuly inserted");
                out.println("</body>");
                out.println("</html>");
                
                RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
                rd.forward(request, response);
                }
                else{
                    out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>form_submission</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("Sorry!!User cannot be created!");
                out.println("</body>");
                out.println("</html>");
                }
               
          rs.close();
          st.close();
       }
    
          
       }
   catch (ClassNotFoundException | SQLException e) {
// TODO Auto-generated catch block
          e.getMessage();
   }
  
 
  
 }
}
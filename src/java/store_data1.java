import static java.io.FileDescriptor.out;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.String.format;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;



public class store_data1 extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pass = request.getParameter("pwd");
  String em = request.getParameter("email");
  
  doPost(request,response);
  }
 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();
  //String oname = request.getParameter("oname");
  String name = request.getParameter("fname");
  String pass = request.getParameter("pwd");
  String em = request.getParameter("email");
  String dt=request.getParameter("dob");
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
 out.println(dtt);

      try {
          
        Class.forName("oracle.jdbc.driver.OracleDriver");  

       try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","march1999")){
       Statement st=con.createStatement();
         int x=0,y=0;
       ResultSet rs=st.executeQuery("SELECT max(User_id) from Users_det");
    if (rs.next() ){
         x= rs.getInt(1); 
         x=x+1;}
       rs=st.executeQuery("SELECT max(applicant_id) from Applicants");
    if (rs.next() ){
         y= rs.getInt(1); 
         y=y+1;
         
    }
       out.println("connection established successfully...!!"); 
       String query = "INSERT INTO Users_det VALUES('"+x+"','"+pass+"','"+em+"',SYSDATE)";
       PreparedStatement ps = con.prepareStatement(query);
          int c1=ps.executeUpdate();
           String query2 ="INSERT INTO Applicants VALUES('"+x+"','"+y+"','"+name+"','"+dtt+"')";
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
                    rs.close();
          st.close();
                
       } catch (SQLException ex) { 
          Logger.getLogger(store_data1.class.getName()).log(Level.SEVERE, null, ex);
      } 
       }
      catch (ClassNotFoundException ex) {
          Logger.getLogger(store_data1.class.getName()).log(Level.SEVERE, null, ex);
      }
 }
}
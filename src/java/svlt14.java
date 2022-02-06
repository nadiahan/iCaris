//reject extension
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/svlt14"})
public class svlt14 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           HttpSession session = request.getSession();
           int bookingID = Integer.parseInt(session.getAttribute("bookingID").toString());
           
           String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "rentalproject";
            String userid = "root";
            String password = "";
            
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
               
                //prepared statement 
                
                String sqlupdate = "update booking set extendStatus=? where bookingID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setString(1, "REJECTED");
                ps.setInt(2, bookingID);
                ps.executeUpdate();
                
                log(sqlupdate);
            
                out.println("<script type=\"text/javascript\">");
                out.println("alert('The extended return date request has been REJECTED');");
                out.println("location='booking_list.jsp';");
                out.println("</script>");
                //response.sendRedirect("booking_list.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}

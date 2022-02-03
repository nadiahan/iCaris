
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

@WebServlet(urlPatterns = {"/svlt3"})
public class svlt3 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           //fetch data
            HttpSession session = request.getSession();
            int bookingID = Integer.parseInt(session.getAttribute("bookingID").toString());
            
            //work on database part
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "rentalproject";
            String userid = "root";
            String password = "";
            
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
               
                //prepared statement 
                
                String sqlupdate = "delete from booking where bookingID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setInt(1, bookingID);
                ps.executeUpdate();
                
                log(sqlupdate);
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
            
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
               
                //prepared statement 
                
                String sqlupdate = "delete from available where bookingID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setInt(1, bookingID);
                ps.executeUpdate();
                
                log(sqlupdate);
                
                response.sendRedirect("booking_list.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}

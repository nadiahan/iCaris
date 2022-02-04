
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

@WebServlet(urlPatterns = {"/svlt1"})
public class svlt1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String bookingID = session.getAttribute("bookingID").toString();
            
            String pickupDate = request.getParameter("pickupDate");
            String returnDate = request.getParameter("returnDate");
            String pickupTime = request.getParameter("pickupTime");
            String returnTime = request.getParameter("returnTime");
            String pickupLocation = request.getParameter("pickupLocation");
            String returnLocation = request.getParameter("returnLocation");
            String status = request.getParameter("status");
            int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
            
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
                
                String sqlupdate = "update booking set pickupDate=?, returnDate=?, pickupTime=?, returnTime=?, pickupLocation=?, returnLocation=?, status=?, totalPrice=? where bookingID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setString(1, pickupDate);
                ps.setString(2, returnDate);
                ps.setString(3, pickupTime);
                ps.setString(4, returnTime);
                ps.setString(5, pickupLocation);
                ps.setString(6, returnLocation);
                ps.setString(7, status);
                ps.setInt(8, totalPrice);
                ps.setString(9, bookingID);
               
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

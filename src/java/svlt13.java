//approve extension
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/svlt13"})
public class svlt13 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            int bookingID = Integer.parseInt(session.getAttribute("bookingID").toString());
            
            String extendStatus = "Approved";
            String initialReturnDate;
            String extendReturnDate;
            int diffDays = 0;
            float vehiclePrice = 0;
            float initialPrice = 0;
            float extendPrice = 0;
            float totalPrice = 0;
            Date date1;
            Date date2;
            
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "rentalproject";
            String userid = "root";
            String password = "";
            
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
               
                //prepared statement 
                
                String sqlselect = "select * from booking, vehicle where bookingID=? and booking.vehicleID=vehicle.vehicleID";
                PreparedStatement ps = conn.prepareStatement(sqlselect);
                ps.setInt(1, bookingID);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    vehiclePrice = rs.getInt("price");
                    initialPrice = rs.getInt("totalPrice");
                    initialReturnDate = rs.getString("returnDate");
                    extendReturnDate = rs.getString("extendReturnDate");
                    
                    date1=new SimpleDateFormat("yyyy-MM-dd").parse(initialReturnDate);
                    date2=new SimpleDateFormat("yyyy-MM-dd").parse(extendReturnDate);
                    
                    diffDays = (int) ((date2.getTime() - date1.getTime())/(1000*60*60*24));
                    
                    extendPrice = diffDays * vehiclePrice;
                    totalPrice = initialPrice + extendPrice;
                    
                    String sqlupdate = "update booking set extendStatus=?, totalPrice=? where bookingID=?";
                    ps = conn.prepareStatement(sqlupdate);
                    ps.setString(1, "APPROVED");
                    ps.setFloat(2, totalPrice);
                    ps.setInt(3, bookingID);
                    ps.executeUpdate();
                
                    log(sqlupdate);
                    
                    response.sendRedirect("booking_list.jsp");
                }
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
           
        }
    }
}

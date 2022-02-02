import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
/**
 *
 * @author Asus
 */
@WebServlet(urlPatterns = {"/addBooking"})
public class addBooking extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
        //String id = request.getParameter("id");
        String pickupDate = request.getParameter("pickupdate").toString();
        String pickupTime = request.getParameter("pickuptime").toString();
        String returnDate = request.getParameter("returndate").toString();
        String returnTime = request.getParameter("returntime").toString();
        String pickupLocation = request.getParameter("pickuploc");
        String returnLocation = request.getParameter("returnloc");
        HttpSession session=request.getSession();  
        String _userid = (String)session.getAttribute("userID");
        
        //set current date
        session.setAttribute("spickupDate",pickupDate);
        session.setAttribute("sreturnDate",returnDate);
        
        String status = "Booked";
        //String bookingID = "10002";
        String vehicleID = "0";
        int A_ID = 0;
        String bookDate = LocalDateTime.now().toString();
        String extendReturnDate = "";
        String extendStatus = "";
        String totalPrice = "0";
        


        //work on database part here
        try {
            
            
        //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);
            
            Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
           
           //Update dalam table booking dulu
            String sqlinsert = "insert into booking(userID, pickupDate, pickupTime, returnDate, returnTime, pickupLocation, returnLocation, status, vehicleID, bookDate, extendReturnDate, extendStatus, totalPrice)values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            
            ps.setString(1, _userid);
            ps.setString(2, pickupDate);
            ps.setString(3, pickupTime);
            ps.setString(4, returnDate);
            ps.setString(5, returnTime);
            ps.setString(6, pickupLocation);
            ps.setString(7, returnLocation);
            ps.setString(8, status);
//            ps.setString(9, bookingID);
            ps.setString(9, vehicleID);
            
            ps.setString(10, bookDate);
            ps.setString(11, extendReturnDate);
            ps.setString(12, extendStatus);
            ps.setString(13, totalPrice);
           
           
            ps.executeUpdate();
            
            // Update dalam table available
            String sqlinsert2 = "insert into available(vehicleID, pickupDate, returnDate) values (?, ?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(sqlinsert2, Statement.RETURN_GENERATED_KEYS);
            ps2.setString(1, vehicleID);
            ps2.setString(2, pickupDate);
            ps2.setString(3, returnDate);
            ps2.executeUpdate();
            
          
            ResultSet rs = ps2.getGeneratedKeys();
            if (rs != null && rs.next()) {
                A_ID = rs.getInt(1);
                 session.setAttribute("A_ID", A_ID);
                 
                //ps.setInt(i, mb.getUserID("UserID"));
                }
             // Update dalam table available
           
//            ResultSet rs = conn.createStatement().executeQuery(sqlselect);
//            
//            while (resultSet.next()){ 
//            String ID = resultSet.getString("id");
//            session.setAttribute("bookingID", ID);
//            }
         //   InputStream is = part.getInputStream();
            
            
                
            log(sqlinsert);
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
            
        response.sendRedirect("customer/bookCar.jsp");
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }

    }
}

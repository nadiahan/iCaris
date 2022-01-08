
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/svlt9"})
public class svlt9 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch data
            HttpSession session = request.getSession();
            int userID = Integer.parseInt(session.getAttribute("userID").toString());
            //session.setAttribute("userID",userID);
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("password");
            String address = request.getParameter("address");
            String nric = request.getParameter("nric");
            String driveclass = request.getParameter("driveclass");
        
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
                
                String sqlupdate = "update users set "
                        + "fname=?, lname=?, email=?, phone=?, password=?, address=?, nric=?, driveclass=? "
                        + "where userID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.setString(5, pass);
                ps.setString(6, address);
                ps.setString(7, nric);
                ps.setString(8, driveclass);
                ps.setInt(9, userID);
                
                ps.executeUpdate();
                
                log(sqlupdate);
            
                response.sendRedirect("customer_list.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

}

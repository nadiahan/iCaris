
import java.io.IOException;
import java.io.InputStream;
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

@WebServlet(urlPatterns = {"/svlt12"})
public class svlt12 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            HttpSession session = request.getSession();
            int inquiryID = Integer.parseInt(session.getAttribute("inquiryID").toString());
            String message = request.getParameter("message");
            int userID = 1001;
            //String date = LocalDate.now().toString();
            String date = "2022-01-16";
            
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "rentalproject";
            String userid = "root";
            String password = "";
            
            try {
                Class.forName(driver).newInstance();
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                //prepared statement 
                String sqlinsert = "insert into reply (userID, inquiryID, message, date) values (?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sqlinsert);
                ps.setInt(1, userID);
                ps.setInt(2, inquiryID);
                ps.setString(3, message);
                ps.setString(4, date);
               
                ps.executeUpdate();
                
                log(sqlinsert);
            
                response.sendRedirect("inquiry_list.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}

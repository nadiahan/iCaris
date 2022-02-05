
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

@WebServlet(urlPatterns = {"/svlt15"})
public class svlt15 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                     
            HttpSession session = request.getSession();
            int feedbackID = Integer.parseInt(session.getAttribute("feedbackID").toString());
            String reply = request.getParameter("reply");
            
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "rentalproject";
            String userid = "root";
            String password = "";
            
            try {
                Class.forName(driver).newInstance();
                Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                //prepared statement 
                String sqlinsert = "update feedback set reply=? where feedbackID=?";
                PreparedStatement ps = conn.prepareStatement(sqlinsert);
                ps.setString(1, reply);
                ps.setInt(2, feedbackID);
        
                ps.executeUpdate();
               
                log(sqlinsert);
            
                response.sendRedirect("view_feedback.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}

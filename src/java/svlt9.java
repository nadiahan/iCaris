
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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phonenum = request.getParameter("phonenum");
            String pass = request.getParameter("password");
            String address = request.getParameter("address");
            String ic = request.getParameter("ic");
        
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
                
                String sqlupdate = "update user set name=?, email=?, phonenum=?, password=?, address=?, ic=? where id=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phonenum);
                ps.setString(4, pass);
                ps.setString(5, address);
                ps.setString(6, ic);
                ps.setInt(7, userID);
                
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

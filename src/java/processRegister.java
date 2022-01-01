
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/processRegister"})
public class processRegister extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "mydatabase";
        String userid = "root";
        String password = "";
        
        //String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String pw = request.getParameter("pw");
        String phone = request.getParameter("phone");
        String driveclass = request.getParameter("driveclass");
        String nric = request.getParameter("nric");
        String address = request.getParameter("address");
        
        

        //work on database part here
        try {
            out.println(fname + lname + email + pw + phone + driveclass + address + nric);
            
            Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
            String sqlinsert = "insert into users(fname, lname, password, nric, email, driveclass, phone, address, userType)values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
         //   InputStream is = part.getInputStream();
            
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, pw);
            ps.setString(4, nric);
            ps.setString(5, email);
            ps.setString(6, driveclass);
            ps.setString(7, phone);
            ps.setString(8, address);
            ps.setString(9, "customer");
            ps.executeUpdate();
                
            log(sqlinsert);
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
            
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }

    }
}

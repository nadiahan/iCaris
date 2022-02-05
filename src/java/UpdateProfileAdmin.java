
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

@WebServlet(urlPatterns = {"/UpdateProfileAdmin"})
public class UpdateProfileAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
       
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String _password = request.getParameter("password");
        String nric = request.getParameter("nric");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String driveclass = request.getParameter("driveclass");
         HttpSession session=request.getSession();  
        
        try {
            
            
        //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);
            
            Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
           
           //Update dalam table booking dulu
            String update = "UPDATE users SET fname = ?, lname = ?, password = ?, nric = ?, driveclass = ?, phone = ?, address = ? WHERE userID = '"+id+"'";
            PreparedStatement ps = conn.prepareStatement(update);
            
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, _password);
            ps.setString(4, nric);
            ps.setString(5, driveclass);
            ps.setString(6, phone);
            ps.setString(7, address);
          
           
            int count = ps.executeUpdate();
//
//            System.out.println(fname);
//            System.out.println(id);
            log(update);
            
            if (count > 0){
                System.out.println(count);
             //   count=count+1;
                //session.setAttribute("count", count);
            }
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
      
        session.setAttribute("count", count);
        response.sendRedirect("admin_profile.jsp?");
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }
        
   
    }
}

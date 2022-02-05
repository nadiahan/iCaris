
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

@WebServlet(urlPatterns = {"/svlt6"})
public class svlt6 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch data
            HttpSession session = request.getSession();
            String vehicleID = session.getAttribute("vehicleID").toString();
            //session.setAttribute("vehicleID",vehicleID);
            String type = request.getParameter("type");
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String vehicleNo = request.getParameter("vehicleNo");
            String colour = request.getParameter("colour");
            int seats = Integer.parseInt(request.getParameter("seats"));
            String transmission = request.getParameter("transmission");
            String trunkSize = request.getParameter("trunkSize");
            float price = Float.parseFloat(request.getParameter("price"));
            int age = LocalDate.now().getYear() - Integer.parseInt(request.getParameter("year"));
            String rdTaxExpiry = request.getParameter("rdTaxExpiry");
            //String image = request.getParameter("image");
        
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
                
                String sqlupdate = "update vehicle set type=?, brand=?, model=?, vehicleNo=?, colour=?, seats=?, transmission=?, trunkSize=?, price=?, age=?, rdTaxExpiry=? where vehicleID=?";
                PreparedStatement ps = conn.prepareStatement(sqlupdate);
                ps.setString(1, type);
                ps.setString(2, brand);
                ps.setString(3, model);
                ps.setString(4, vehicleNo);
                ps.setString(5, colour);
                ps.setInt(6, seats);
                ps.setString(7, transmission);
                ps.setString(8, trunkSize);
                ps.setFloat(9, price);
                ps.setInt(10, age);
                ps.setString(11, rdTaxExpiry);
                ps.setString(12, vehicleID);
                
                ps.executeUpdate();
                
                log(sqlupdate);
            
                response.sendRedirect("vehicle_list.jsp");
            }
            
            catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }

}

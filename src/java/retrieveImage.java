import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Asus
 */
@WebServlet(urlPatterns = {"/retrieveImage"})
public class retrieveImage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String id = request.getParameter("id"); //tukar id sini utk display gmbar lain
        Connection con = null;

        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
    
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(connectionUrl+database, userid, password);

            PreparedStatement ps = con.prepareStatement("select image from vehicle where vehicleID=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                Blob blob = rs.getBlob("image");
                byte byteArray[] = blob.getBytes(1, (int)blob.length());
                response.setContentType("image/gif");
                OutputStream os = response.getOutputStream();
                os.write(byteArray);
                os.flush();
                os.close();
            }
        } catch(Exception e){
                e.printStackTrace();
        }  
        finally{
            if(con != null){
                try{
                    con.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

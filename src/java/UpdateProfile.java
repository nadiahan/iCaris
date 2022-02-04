/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
@WebServlet(urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
          
           
            ps.executeUpdate();

            System.out.println(fname);
            System.out.println(id);
            log(update);
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
            
        response.sendRedirect("customer/profile.jsp");
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }
        
   
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

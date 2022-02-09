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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(urlPatterns = {"/addFeedback"})
public class addFeedback extends HttpServlet {

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

            //String id = request.getParameter("id");
            //String name = request.getParameter("name");
            String rate = request.getParameter ("rating1");
           
            String experience = request.getParameter("experience");
            HttpSession session=request.getSession(); 
            String _userid = (String) session.getAttribute("userID");
            String reply = null;
            String vehicleID = request.getParameter("vehicleID");
            String bookingID = request.getParameter("bookingID");
            
            //work on database part here
            try {


            //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);

                Class.forName(driver).newInstance();
                Connection conn;
                conn = DriverManager.getConnection(url+database,userid,password);
               // Statement stmt = conn.createStatement();

               //Update dalam table booking dulu
                String sqlinsert = "insert into feedback(bookingID, vehicleID, stars, comment, reply)values(?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sqlinsert);
                ps.setString(1, bookingID);
                //ps.setString(2, name);
                ps.setString(2, vehicleID);
                ps.setString(3, rate);
                ps.setString(4, experience);
                ps.setString(5, reply);
               
                int count = ps.executeUpdate();
                
                session.setAttribute("inqCount", count);

             

                log(sqlinsert);

                conn.close();
                //response.sendRedirect("viewAll.jsp");

            response.sendRedirect("customer/currentBooking.jsp");
            } 
            catch (Exception ex) {
                 ex.printStackTrace();
            }

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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

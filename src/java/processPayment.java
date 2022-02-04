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
@WebServlet(urlPatterns = {"/processPayment"})
public class processPayment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        //Declare semua
        
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
        //String id = request.getParameter("id");
       // String vehicleID = request.getParameter("vehicleID");
        HttpSession session=request.getSession();  
        int A_ID = Integer.parseInt(session.getAttribute("A_ID").toString());
        String id = request.getParameter("id");
        
        try {
             Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
           
           
           //Update dalam table booking dulu
            String sql = "UPDATE available SET vehicleID =  ? WHERE ID = '" + A_ID  + "'";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, id);
           
           
           
            ps.executeUpdate();
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        //Declare semua
        
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
        //String id = request.getParameter("id");
       // String vehicleID = request.getParameter("vehicleID");
        HttpSession session=request.getSession();  
        int A_ID = Integer.parseInt(session.getAttribute("A_ID").toString());
        int B_ID = Integer.parseInt(session.getAttribute("B_ID").toString());
        String id = request.getParameter("id");
        float total = Float.parseFloat(request.getParameter("total"));
        
        try {
             Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
           
           
           //Update dalam table booking dulu
            String sql = "UPDATE available SET vehicleID =  ? WHERE ID = '" + A_ID  + "'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            log(sql);
            
            String sql2 = "UPDATE booking SET vehicleID =  ?, totalPrice = ? WHERE bookingID = '" + B_ID  + "'";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setString(1, id);
            ps2.setFloat(2, total);
            ps2.executeUpdate();
            log(sql);
            
            
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
            
        response.sendRedirect("customer/bookDateLoc.jsp");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

}

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
import java.util.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Asus
 */
@WebServlet(urlPatterns = {"/updateDate"})

public class updateDate extends HttpServlet {

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
        Date date1 = null;
        Date date2 = null;
        String vehicleID = null;
        double priceday = 0;
       
       
        String extenddate = request.getParameter("extenddate");
        Double price = Double.parseDouble(request.getParameter("price"));
        String id = request.getParameter("bookingID");
        //String lname = request.getParameter("lname");
      
        HttpSession session=request.getSession();  
        
        try {
            
            
        //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);
            
            Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,userid,password);
           // Statement stmt = conn.createStatement();
           
           
           
           String select2 = "SELECT * FROM booking WHERE bookingID= '"+id+"'";
           PreparedStatement ps2 = conn.prepareStatement(select2);
           
           ResultSet rs2 = ps2.executeQuery();
           while (rs2.next()){
                date2=new SimpleDateFormat("yyyy-MM-dd").parse(extenddate);
                date1=new SimpleDateFormat("yyyy-MM-dd").parse(rs2.getString("returnDate"));
                vehicleID = rs2.getString("vehicleID");
           }
           
           String select3= "SELECT * FROM vehicle WHERE vehicleID= '"+vehicleID+"'";
           PreparedStatement ps3 = conn.prepareStatement(select3);
           
           ResultSet rs3 = ps3.executeQuery();
           while (rs3.next()){
                priceday = rs3.getFloat("price");
           }
           
           
           int differenceInDays = (int) ((date2.getTime() - date1.getTime())/(1000*60*60*24));
           
           price = differenceInDays*priceday;
           price = price + price*0.06;
           
           //Update dalam table booking dulu
            String update = "UPDATE booking SET extraFee = ?, extendReturnDate = ? WHERE bookingID= '"+id+"'";
            PreparedStatement ps = conn.prepareStatement(update);
            
            ps.setDouble(1, price);
            ps.setString(2, extenddate);
         
          
           
            int count = ps.executeUpdate();
//
//            System.out.println(fname);
//            System.out.println(id);
            log(update);
            
            if (count > 0){
                System.out.println(differenceInDays);
                response.sendRedirect("customer/currentBooking.jsp");
             //   count=count+1;
                //session.setAttribute("count", count);
            }
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
      
      
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

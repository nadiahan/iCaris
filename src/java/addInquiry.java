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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
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
@WebServlet(urlPatterns = {"/addInquiry"})
public class addInquiry extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
            String title = request.getParameter("title");
            String inquiry = request.getParameter("inquiry");
           
            HttpSession session=request.getSession();  
            String _userid = (String)session.getAttribute("userID");
            String status = "sent";
            
            Date today = (new java.util.Date());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String date = df.format(today);

            //work on database part here
            try {


            //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);

                Class.forName(driver).newInstance();
                Connection conn;
                conn = DriverManager.getConnection(url+database,userid,password);
               // Statement stmt = conn.createStatement();

               //Update dalam table booking dulu
                String sqlinsert = "insert into inquiry(userID, title, message, date, status)values(?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sqlinsert);
                ps.setString(1, _userid);
                //ps.setString(2, name);
                ps.setString(2, title);
                ps.setString(3, inquiry);
                ps.setString(4, date);
                ps.setString(5, status);
               
                int count = ps.executeUpdate();
                
                session.setAttribute("inqCount", count);

             

                log(sqlinsert);

                conn.close();
                //response.sendRedirect("viewAll.jsp");

            response.sendRedirect("customer/inquiry.jsp");
            } 
            catch (Exception ex) {
                 ex.printStackTrace();
            }

        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */

}

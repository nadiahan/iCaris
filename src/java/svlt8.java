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

/**
 *
 * @author DR HANIM
 */
@WebServlet(urlPatterns = {"/svlt8"})
public class svlt8 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
        String userType = "customer";
        //int id = Integer.parseInt(request.getParameter("id"));
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String address = request.getParameter("address");
        String nric = request.getParameter("nric");
        String driveclass = request.getParameter("driveclass");
        
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url+database, userid, password);
            String sqlInsert = "insert into users "
                    + "(userType,fname,lname,email,phone,password,address,nric,driveclass) "
                    + "values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);

            //ps.setInt(1, id);
            ps.setString(1, userType);
            ps.setString(2, fname);
            ps.setString(3, lname);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, pass);
            ps.setString(7, address);
            ps.setString(8, nric);
            ps.setString(9, driveclass);

            ps.executeUpdate();
            
            log(sqlInsert);
            conn.close();
            response.sendRedirect("customer_list.jsp");
        }catch(Exception ex){
            
        }
    }

}

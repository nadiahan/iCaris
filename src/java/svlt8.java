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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String database = "rentalproject";
        String userid = "root";
        String password = "";
        
        String role = "customer";
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phonenum = request.getParameter("phonenum");
        String pass = request.getParameter("password");
        String address = request.getParameter("address");
        String ic = request.getParameter("ic");
        
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url+database, userid, password);
            String sqlInsert = "insert into user values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sqlInsert);

            ps.setInt(1, id);
            ps.setString(2, role);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, phonenum);
            ps.setString(6, pass);
            ps.setString(7, address);
            ps.setString(8, ic);

            ps.executeUpdate();
            
            log(sqlInsert);
            conn.close();
            response.sendRedirect("customer_list.jsp");
        }catch(Exception ex){
            
        }
    }

}

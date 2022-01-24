<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

    String vehicleID = request.getParameter("vehicleID");
    
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "rentalproject";
    String userid = "root";
    String password = "";
try {
    
    Class.forName(driver).newInstance();
    Connection conn = DriverManager.getConnection(connectionUrl+database, userid, password);
    
    PreparedStatement ps = conn.prepareStatement("select image from vehicle where vehicleID=?");
    ps.setString(1, vehicleID);
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
}
catch(Exception e){
    e.printStackTrace();
}  
%>
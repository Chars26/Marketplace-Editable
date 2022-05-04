/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configuraciones;


import java.sql.Connection;
import java.sql.DriverManager;


public class conexion {

    Connection con;
    String url = "jdbc:mysql://localhost:3306/marketplace";
    String user = "root";
    String pass = "12345";

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }

}

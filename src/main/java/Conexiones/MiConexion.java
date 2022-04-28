package Conexiones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MiConexion {
    private static final String JDBC_DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private static final String JDBC_CONN_DATABASE = "jdbc:mysql://localhost/AED";
    
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    private Connection con = null;
    
    public MiConexion() {
        try {
            Class.forName(JDBC_DRIVER_CLASS);
            con = DriverManager.getConnection(JDBC_CONN_DATABASE, USER, PASSWORD);
            
        } catch(ClassNotFoundException ex) {
            System.out.println("ERROR al CREAR la CONEXIÓN: " + ex);
        } catch (SQLException ex) {
            System.out.println("ERROR: con la BASE de DATOS: " + ex);
        }
    }

    public Connection getCon() {
        return con;
    }
}

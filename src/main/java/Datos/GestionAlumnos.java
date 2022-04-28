package Datos;

import Conexiones.MiConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GestionAlumnos {
    private final Connection con;
    
    public GestionAlumnos() {
        MiConexion miCon = new MiConexion();
        con = miCon.getCon();
    }
    
    // C - CREATE
    public boolean insertarAlumno(Alumno alumno) {
        try {
            PreparedStatement pstmt = con.prepareStatement(
                    "INSERT INTO alumnos (nombre, apellidos, edad, direccion, curso, datosFamilia, nota)"
                            + " VALUES (?, ?, ?, ?, ?, ?, ?)");
            
            pstmt.setString(1, alumno.getNombre());
            pstmt.setString(2, alumno.getApellidos());
            pstmt.setInt(3, alumno.getEdad());
            pstmt.setString(4, alumno.getDireccion());
            pstmt.setInt(5, alumno.getCurso());
            pstmt.setString(6, alumno.getDatosFamilia());
            pstmt.setInt(7, alumno.getNota());
            
            pstmt.executeUpdate();
            return true;
            
        } catch (SQLException ex) {
            System.out.println("ERROR al INSERTAR ALUMNO: " + ex);
            return false;
        }
    }
    
    // R - READ
    public Alumno obtenerAlumno(int id) {
        Alumno alumno = null;
        
        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM alumnos WHERE id = ?");           
            pstmt.setInt(1, id);
            
            ResultSet res = pstmt.executeQuery();
            if(res.next()){
                alumno = new Alumno(id, res.getString("nombre"), 
                        res.getString("apellidos"), res.getInt("edad"), 
                        res.getString("direccion"), res.getInt("curso"), 
                        res.getString("datosFamilia"), res.getInt("nota"));
            }
            return alumno;
            
        } catch (SQLException ex) {
            System.out.println("ERROR al OBTENER ALUMNO (" + id + "): " + ex);
            return alumno;
        }
    }
    
    public ArrayList<Alumno> obtenerAlumnos() {
        ArrayList<Alumno> alumnos = new ArrayList();
        
        try {
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM alumnos");
            
            ResultSet res = pstmt.executeQuery();
            while(res.next()){
                alumnos.add(new Alumno(res.getInt("id"), res.getString("nombre"), 
                        res.getString("apellidos"), res.getInt("edad"), 
                        res.getString("direccion"), res.getInt("curso"), 
                        res.getString("datosFamilia"), res.getInt("nota")));
            }
            return alumnos;
            
        } catch (SQLException ex) {
            System.out.println("ERROR al OBTENER ALUMNOS: " + ex);
            return alumnos;
        }
    }
    
    // U - UPDATE
    public boolean actualizarAlumno(int id, Alumno alumno) {
        try {
            PreparedStatement pstmt = con.prepareStatement(
                    "UPDATE alumnos SET nombre = ?, apellidos = ?, edad = ?,"
                            + " direccion = ?, curso = ?, datosFamilia = ? , nota = ? WHERE id = ?");
            
            pstmt.setString(1, alumno.getNombre());
            pstmt.setString(2, alumno.getApellidos());
            pstmt.setInt(3, alumno.getEdad());
            pstmt.setString(4, alumno.getDireccion());
            pstmt.setInt(5, alumno.getCurso());
            pstmt.setString(6, alumno.getDatosFamilia());
            pstmt.setInt(7, alumno.getNota());
            pstmt.setInt(8, id);
            
            pstmt.executeUpdate();
            return true;
            
        } catch (SQLException ex) {
            System.out.println("ERROR al ACTUALIZAR ALUMNO: " + ex);
            return false;
        }
    }
    
    // D - DELETE
    public boolean eliminarAlumno(int id) {
        try {
            PreparedStatement pstmt = con.prepareStatement("DELETE FROM alumnos WHERE id = ?");           
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
            return true;
            
        } catch (SQLException ex) {
            System.out.println("ERROR al ELIMINAR ALUMNO: " + ex);
            return false;
        }
    }
}

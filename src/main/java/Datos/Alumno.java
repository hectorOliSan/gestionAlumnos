package Datos;

public class Alumno {
    private String nombre, apellidos, direccion, datosFamilia;
    private int id, edad, curso, nota;
    
    public Alumno(String nombre, String apellidos, int edad, String direccion, int curso, String datosFamilia, int nota) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.direccion = direccion;
        this.curso = curso;
        this.datosFamilia = datosFamilia;
        this.nota = nota; 
    }
    
    public Alumno(int id, String nombre, String apellidos, int edad, String direccion, int curso, String datosFamilia, int nota) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.direccion = direccion;
        this.curso = curso;
        this.datosFamilia = datosFamilia; 
        this.nota = nota; 
    }

    public int getId() {
        return id;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }
    
    public String getDatosFamilia() {
        return datosFamilia;
    }

    public void setDatosFamilia(String datosFamilia) {
        this.datosFamilia = datosFamilia;
    }
    
    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    @Override
    public String toString() {
        return "Alumno{" + "id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + 
                ", edad=" + edad + ", direccion=" + direccion + ", curso=" + curso + 
                ", datosFamilia=" + datosFamilia + "}";
    }
}

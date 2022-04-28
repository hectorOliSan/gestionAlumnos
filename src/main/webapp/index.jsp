<%-- 
    Document   : index
    Created on : Jan 17, 2022, 8:21:18 AM
    Author     : Hector
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Datos.Alumno"%>
<%@page import="Datos.GestionAlumnos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Alumnos</title>
        
        <!-- Bootstrap CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        
        <!-- CODIGO JAVA -->
        <%
            GestionAlumnos ga = new GestionAlumnos();
            
            String accion = request.getParameter("accion");
            if(accion != null){
                
                // INSERTAR ALUMNO
                if(accion.compareTo("insertar") == 0) {
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String direccion = request.getParameter("direccion");
                    int curso = Integer.parseInt(request.getParameter("curso"));
                    String datosFamilia = request.getParameter("datosFamilia");
                    int nota = Integer.parseInt(request.getParameter("nota"));

                    Alumno al = new Alumno(nombre, apellidos, edad, direccion, curso, datosFamilia, nota);
                    if(ga.insertarAlumno(al)){
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "El alumno ha sido <strong>insertado</strong> correctamente"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        } else {
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "Ha habido un problema al <strong>insertar</strong> el alumno"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        }
                    
                // EDITAR ALUMNO
                } else if (accion.compareTo("editar") == 0){
                    int id = Integer.parseInt(request.getParameter("id"));
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String direccion = request.getParameter("direccion");
                    int curso = Integer.parseInt(request.getParameter("curso"));
                    String datosFamilia = request.getParameter("datosFamilia");
                    int nota = Integer.parseInt(request.getParameter("nota"));

                    Alumno al = new Alumno(nombre, apellidos, edad, direccion, curso, datosFamilia, nota);
                    if(ga.actualizarAlumno(id, al)){
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "El alumno ha sido <strong>editado</strong> correctamente"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        } else {
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "Ha habido un problema al <strong>editar</strong> el alumno"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        }
                    
                // ELIMINAR ALUMNO
                } else if(accion.compareTo("eliminar") == 0) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    if(ga.eliminarAlumno(id)) {
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "El alumno ha sido <strong>eliminado</strong> correctamente"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        } else {
                            out.print("<div class=\"alert alert-success alert-dismissible fade show\" role = \"alert\">"
                                    + "Ha habido un problema al <strong>eliminar</strong> el alumno"
                                    + "<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>"
                                    + "</div>");
                        }
                }
            }
            
            ArrayList<Alumno> alumnos = ga.obtenerAlumnos();
        %>
        
        <div class="container">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <h1 class="text-center">Gestión de Alumnos - IES El Rincón</h1>
                </div>
            </div>
            
            <!<!-- TABLA -->
            <div class="row">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Edad</th>
                                <th>Dirección</th>
                                <th>Curso</th>
                                <th>Datos Familia</th>
                                <th>Nota Global</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(Alumno al:alumnos) {%>                            
                            <tr>
                                <th><%= al.getId() %></th>
                                <td><%= al.getNombre() %></td>
                                <td><%= al.getApellidos() %></td>
                                <td><%= al.getEdad() %></td>
                                <td><%= al.getDireccion() %></td>
                                <td><%= al.getCurso() %></td>
                                <td><%= al.getDatosFamilia() %></td>
                                <td>
                                    <% 
                                        if(0 <= al.getNota() && al.getNota() < 5) out.print("Suspendido");
                                        else if (5 <= al.getNota() && al.getNota() < 8) out.print("Aprobado");
                                        else if (8 <= al.getNota() && al.getNota() < 10) out.print("Notable");
                                        else if (al.getNota() == 10) out.print("Sobresaliente");
                                    %>
                                </td>
                                <td>
                                    <!-- BOTÓN EDITAR -->
                                    <form method="GET" action="formulario.jsp">
                                        <div class="d-grid gap-2">
                                            <input type="hidden" name="accion" value="editar">
                                            <input type="hidden" name="id" value="<%= al.getId()%>">
                                            <input type="hidden" name="nombre" value="<%= al.getNombre()%>">
                                            <input type="hidden" name="apellidos" value="<%= al.getApellidos()%>">
                                            <input type="hidden" name="edad" value="<%= al.getEdad()%>">
                                            <input type="hidden" name="direccion" value="<%= al.getDireccion()%>">
                                            <input type="hidden" name="curso" value="<%= al.getCurso()%>">
                                            <input type="hidden" name="datosFamilia" value="<%= al.getDatosFamilia()%>">
                                            <input type="hidden" name="nota" value="<%= al.getNota()%>">
                                            <input type="submit" value="Editar" class="btn btn-warning">
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <!-- BOTÓN BORRAR -->
                                    <form method="GET" action="index.jsp">
                                        <div class="d-grid gap-2">
                                            <input type="hidden" name="accion" value="eliminar">
                                            <input type="hidden" name="id" value="<%= al.getId()%>">
                                            <input type="submit" value="Eliminar" class="btn btn-danger">
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- BOTÓN INSERTAR -->
            <div class="row">
                <div class="col-12">
                    <form method="GET" action="formulario.jsp">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="accion" value="insertar">
                            <input type="submit" value="Insertar" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
                        
        </div> <!<!-- CIERRE CONTAINER -->
        
        <!<!-- FOOTER -->
        <footer class="py-3 my-4 border-top">
            <p class="text-center text-muted">© Héctor Olivares Sánchez - AED</p>
        </footer>
        
        <!-- Bootstrap JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

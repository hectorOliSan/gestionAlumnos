<%-- 
    Document   : formulario
    Created on : Jan 18, 2022, 8:12:45 AM
    Author     : Hector
--%>

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
        
        <div class="container">

            <!-- ENCABEZADO -->
            <div class="row">
                <div class="col-12 py-3">
                    <h1 class="text-center">
                    <%
                        String accion = request.getParameter("accion");
                        String tipo = "", valor = "";
                        String id = "", nombre = "", apellidos = "", edad = "", direccion = "", curso = "", datosFamilia = "", nota = "";
                        if(accion != null) {
                            if(accion.compareTo("insertar") == 0){
                                tipo = "btn btn-primary";
                                valor = "Insertar";
                                out.print(valor);
                                
                            } else if(accion.compareTo("editar") == 0){
                                tipo = "btn btn-warning";
                                valor = "Editar";
                                id = request.getParameter("id");
                                nombre = request.getParameter("nombre");
                                apellidos = request.getParameter("apellidos");
                                edad = request.getParameter("edad");
                                direccion = request.getParameter("direccion");
                                curso = request.getParameter("curso");
                                datosFamilia = request.getParameter("datosFamilia");
                                nota = request.getParameter("nota");
                                out.print(valor);
                            }
                        }
                    %>
                        Alumno
                    </h1>
                </div>
            </div>

            <!-- FORMULARIO -->
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6 py-3">
                    <form method="GET" action="index.jsp">
                        <input type="hidden" name="id" value="<%= id%>">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del Alumno</label>
                            <input type="text" class="form-control" name="nombre" value="<%= nombre%>">
                        </div>

                        <div class="mb-3">
                            <label for="apellidos" class="form-label">Apellidos del Alumno</label>
                            <input type="text" class="form-control" name="apellidos" value="<%= apellidos%>">
                        </div>

                        <div class="mb-3">
                            <label for="edad" class="form-label">Edad del Alumno</label>
                            <input type="number" class="form-control" name="edad" min="1"  max="100" value="<%= edad%>">
                        </div>

                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección del Alumno</label>
                            <input type="text" class="form-control" name="direccion" value="<%= direccion%>">
                        </div>

                        <div class="mb-3">
                            <label for="curso" class="form-label">Curso del Alumno</label>
                            <input type="number" class="form-control" name="curso" min="1" max="4" value="<%= curso%>">
                        </div>

                        <div class="mb-3">
                            <label for="datosFamilia" class="form-label">Datos de la familia</label>
                            <textarea class="form-control" name="datosFamilia" rows="5"><%= datosFamilia%></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="datosFamilia" class="form-label">Nota Global</label>
                            <select class="form-select" name="nota" aria-label="Default select example">
                                <% for (int i=0; i<=10; i++) {
                                    if(!nota.equals("") && nota.equals(i+"")) { %>
                                        <option selected value=<%= i%>><%= i%></option>
                                <% } else { %>
                                        <option value=<%= i%>><%= i%></option>
                                <% }} %>
                            </select>
                        </div>
                        
                        <input name="accion" type="hidden" value="<%= accion%>">
                        
                        <div class="d-grid gap-2">
                            <input class="<%= tipo%>" type="submit" value="<%= valor%>">
                        </div>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>

        </div> <!-- CIERRE CONTAINER -->

        <!-- Bootstrap JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : informacion
    Created on : Jan 13, 2022, 8:34:48 AM
    Author     : Hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Página JSP</h1>
        <h2>Método con el que fue invocado: <%= request.getMethod() %></h2>
        <h2>Dirección desde la que fue invocado: <%= request.getRemoteAddr() %></h2>
        <h2>Host desde la que fue invocado: <%= request.getRemoteHost() %></h2>
        <h2>Puerto desde la que fue invocado: <%= request.getRemotePort() %></h2>
        <hr/>
        <% for(int i=1;i<=10;i++) out.print(i + " "); %>
        <hr/>
        <% for(int i=1;i<=10;i++) out.print("<p>" + i + "</p>"); %>
        <hr/>
        <% for(int i=1;i<=10;i++) { %>
        <p><%= i %></p>
        <% } %>
    </body>
</html>

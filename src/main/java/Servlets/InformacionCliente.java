package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InformacionCliente extends HttpServlet{
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");       
        PrintWriter salida = resp.getWriter();
        salida.println("Método con el que fue invocado el Servlet: " + req.getMethod());
        salida.println("<br/>");
        salida.println("Dirección remota desde la que fue llamado: " + req.getRemoteAddr());
        salida.println("<br/>");
        salida.println("Dirección local en la que está desplegado el Servlet: " + req.getLocalAddr());
        salida.println("<br/>");
        salida.println("Puerto remoto desde donde se hizo la solicitud: " + req.getRemotePort());
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
}

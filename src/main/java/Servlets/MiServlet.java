package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MiServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");       
        PrintWriter salida = resp.getWriter();
        salida.print("Estás ejecutando doPost");
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");       
        PrintWriter salida = resp.getWriter();
        salida.print("Estás ejecutando doGet");
    }
}

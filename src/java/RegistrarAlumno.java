/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author victo
 */
@WebServlet(urlPatterns = {"/RegistrarAlumno"})
public class RegistrarAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession misession = (HttpSession) request.getSession();
        try {
            String nombre = (String) misession.getAttribute("nombre_completo");
        } catch (Exception e) {
            request.setAttribute("err", 1);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            request.getRequestDispatcher("RegistrarAlumno.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession misession = (HttpSession) request.getSession();
        try {
            String nombre = (String) misession.getAttribute("nombre_completo");
        } catch (Exception e) {
            request.setAttribute("err", 1);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        String err = request.getParameter("err");
        int error = 0;
        if (err != null) {
            error = Integer.parseInt(err);
        }
        request.setAttribute("err", error);
        request.getRequestDispatcher("RegistrarAlumno.jsp").forward(request, response);
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String encoding = "utf-8";
        request.setCharacterEncoding(encoding);
        String ncontrol = request.getParameter("ncontrol");
        String nombre = request.getParameter("nombre");
        String appaterno = request.getParameter("appaterno");
        String apmaterno = request.getParameter("apmaterno");
        String tipocurso = request.getParameter("tipocurso");
        String semestre = request.getParameter("semestre");
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        String sql = "INSERT INTO alumnos(alumnos_nombre, alumnos_appaterno, alumnos_apmaterno, alumnos_numerocontrol, alumnos_tipocurso, alumnos_semestre, alumnos_estatus, alumnos_usuario, alumnos_pwd) \n"
                + "VALUES ('" + nombre + "', '" + appaterno + "', '" + apmaterno + "', '" + ncontrol + "', '" + tipocurso + "', '" + semestre + "', 'A', '" + usuario + "', md5('" + contrasena + "'));";

        Connection con;
        try {
            con = new DatabaseConnection().initializeDatabase();
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            response.sendRedirect("DatosAlumnos");
        } catch (SQLException ex) {
            response.sendRedirect("RegistrarAlumno?err=1");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarAlumno.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

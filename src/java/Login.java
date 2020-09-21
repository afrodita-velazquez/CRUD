/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Classes.Alumno;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

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
        String err = request.getParameter("err");
        int error = 0;
        if (err != null) {
            error = Integer.parseInt(err);
        }
        request.setAttribute("err", error);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        try (PrintWriter out = response.getWriter()) {
            try {
                Connection con = new DatabaseConnection().initializeDatabase();
                String query = "SELECT * FROM alumnos where alumnos_usuario = '" + usuario + "' and alumnos_pwd = md5('" + contrasena + "')";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);

                if (rs.next()) {
                    HttpSession misession = request.getSession(true);
                    misession.setAttribute("nombre_completo", rs.getString("alumnos_nombre") + " " + rs.getString("alumnos_appaterno") + " " + rs.getString("alumnos_apmaterno"));
                    misession.setAttribute("ncontrol", rs.getString("alumnos_numerocontrol"));
                    response.sendRedirect("Inicio");
                } else {
                    response.sendRedirect("Login?err=1");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatosAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DatosAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        processRequest(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
import Classes.Alumno;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/DatosAlumnos"})
public class DatosAlumnos extends HttpServlet {

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
            HttpSession misession = (HttpSession) request.getSession();
            try {
                String nombre = (String) misession.getAttribute("nombre_completo");
            } catch (Exception e) {
                request.setAttribute("err", 1);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            try {
                Connection con = new DatabaseConnection().initializeDatabase();
                String query = "SELECT * FROM alumnos";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);

                List<Alumno> list = new ArrayList<>();
                while (rs.next()) {
                    Alumno al = new Alumno();
                    al.setAlumnos_id(rs.getInt("alumnos_id"));
                    al.setAlumnos_nombre(rs.getString("alumnos_nombre"));
                    al.setAlumnos_appaterno(rs.getString("alumnos_appaterno"));
                    al.setAlumnos_apmaterno(rs.getString("alumnos_apmaterno"));
                    al.setAlumnos_numerocontrol(rs.getString("alumnos_numerocontrol"));
                    al.setAlumnos_tipocurso(rs.getString("alumnos_tipocurso"));
                    al.setAlumnos_semestre(rs.getInt("alumnos_semestre"));
                    al.setAlumnos_estatus(rs.getString("alumnos_estatus"));
                    al.setAlumnos_fcaptura(rs.getString("alumnos_fcaptura"));
                    list.add(al);
                }

                request.setAttribute("ListaAlumnos", list);
                request.getRequestDispatcher("AlumnosRegistrados.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(DatosAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DatosAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            }
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

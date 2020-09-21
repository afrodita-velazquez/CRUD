
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>

        <!-- HEADER -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">&nbsp;&nbsp;&nbsp;&nbsp;Escuela</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Inicio">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="RegistrarAlumno">Registrar Alumno</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DatosAlumnos">Lista de Alumnos</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- DATOS DE ALUMNOS -->
        <div class="row mt-4">
            <div class="col-2">
            </div>
            <div class="col-8">
                <div class="card">
                    <div class="card-header">
                        <h1>Lista de Alumnos</h1>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">N° Control</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Curso</th>
                                    <th scope="col">Semestre</th>
                                    <th scope="col">Estatus</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    ArrayList<Alumno> posts = (ArrayList<Alumno>) request.getAttribute("ListaAlumnos");
                                    if (posts.size() > 0) {

                                        for (Alumno post : posts) {
                                %>
                                <tr>
                                    <td><%=post.getAlumnos_id()%></td>
                                    <td><%=post.getAlumnos_numerocontrol()%></td>
                                    <td><%=post.getAlumnos_nombre() + " " + post.getAlumnos_appaterno() + " " + post.getAlumnos_apmaterno()%></td>
                                    <td><%=post.getAlumnos_tipocurso()%></td>
                                    <td><%=post.getAlumnos_semestre()%></td>
                                    <td><%=post.getAlumnos_estatus()%></td>
                                    <td>
                                        <form class="acciones" action="DatosAlumnos" method="POST">
                                            <input type="hidden" value="<%=post.getAlumnos_id()%>" name="alumnos_id" />
                                            <input type="submit" name="action" class="btn btn-outline-info" value="Modificar"/>
                                            <%
                                                String estatus = post.getAlumnos_estatus();
                                                if (estatus.equals("A")) {
                                            %>
                                            <input type="hidden" name="accion" value="1" />
                                            <input type="submit" name="action" class="btn btn-outline-danger" value="Borrar"/>
                                            <%
                                            } else {
                                            %>
                                            <input type="hidden" name="accion" value="2" />
                                            <input type="submit" name="action" class="btn btn-outline-success" value="Reactivar"/>
                                            <%
                                                }
                                            %>
                                        </form>
                                    </td>
                                </tr>
                                <%  }
                                    } else {
                                        out.print("<td>No hay alumnos registrados.</td>");
                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-2">
            </div>
        </div>




    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $(".acciones").submit(function () {
                var btn = $(this).find("input[type=submit]:focus" ).val();
                console.log($(this).serializeArray());
                console.log(btn);
                return false;
            });
        });
    </script>
</html>

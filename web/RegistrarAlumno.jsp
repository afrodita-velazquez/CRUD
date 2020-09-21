
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
                <%
                    int er = (int) request.getAttribute("err");
                    if (er == 1) {
                %>
                <div class="alert alert-danger" role="alert">
                    Error al registrar el usuario, verifique que los datos ingresados sean correctos.
                </div>
                <%
                    }
                %>
                <form method="POST">
                    <div class="card">
                        <div class="card-header">
                            Registrar Alumno
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">N° Control:</label>
                                <input type="text" class="form-control" name="ncontrol" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nombre:</label>
                                <input type="text" class="form-control" name="nombre" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Apellido Paterno:</label>
                                <input type="text" class="form-control" name="appaterno" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Apellido Materno</label>
                                <input type="text" class="form-control" name="apmaterno" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tipo de Curso:</label>
                                <input type="text" class="form-control" name="tipocurso" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Semestre:</label>
                                <input type="text" class="form-control" name="semestre" aria-describedby="emailHelp" required="">
                            </div>

                        </div>
                    </div>
                    <div class="card mt-4 mb-4">
                        <div class="card-header">
                            Datos de sesión
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Usuario</label>
                                <input type="text" class="form-control" name="usuario" aria-describedby="emailHelp" required="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Contraseña</label>
                                <input type="password" class="form-control" name="contrasena" aria-describedby="emailHelp" required="">
                            </div>

                        </div>
                    </div>
                    <div class="card mt-4 mb-4">
                        <div class="card-body">
                            <button type="submit" class="btn btn-primary">Registrar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-2">
            </div>
        </div>




    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>

    </script>
</html>
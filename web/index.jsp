
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
        </nav>

        <!-- DATOS DE ALUMNOS -->
        <div class="row mt-4">
            <div class="col-4">
            </div>
            <div class="col-4">
                <%
                    int er = 0;
                    if(request.getAttribute("err") != null){
                        er = (int)request.getAttribute("err");
                    }else{
                        er = 0;
                    }
                       
                    if (er == 1) {
                %>
                <div class="alert alert-danger" role="alert">
                    Error al iniciar sesión, verifique que los datos ingresados sean correctos.
                </div>
                <%
                    }
                %>
                <form method="POST" action="Login">
                    <div class="card mt-4 mb-4">
                        <div class="card-header">
                            Iniciar Sesión
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
                            <div class="card-body">
                                <button type="submit" class="btn btn-primary">Ingresar</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-6">
            </div>
        </div>




    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script>

    </script>
</html>
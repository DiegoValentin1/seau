<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 22/07/2022
  Time: 11:44 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Login</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos2.css" type="text/css">
</head>
<body>
<div class="container-fluid"; style="background-image: url(https://i.postimg.cc/SRWJCYwk/utez.png); background-size: 100%; height: 1000px;background-repeat: no-repeat;">
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="#" style="color: white;">Tienda Utez</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>

                    <div class="col-2">

                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!--Empieza el mero loggin  -->
    <div class="row text-center">

    </div>
    <div class="row my-5" >
        <div class="col-3"></div>
        <div class="col-6 mb-3 mt-5" style="background-color: #002B5E80; color: white; border-radius: 0.5%;">
            <div class="text-center">
                <h1>Iniciar sesión</h1>
            </div>
            <form action="login" method="post">
                <div class="mb-3 mt-5">
                    <label for="exampleInputEmail1" class="form-label">Usuario</label>
                    <input type="text" class="form-control" name="username" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <div class="text-center mb-5">
                    <button type="submit" class="btn btn-success">Iniciar</button>
                </div>
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>
</body>
</html>

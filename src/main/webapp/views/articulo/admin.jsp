<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 22/07/2022
  Time: 12:23 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">

</head>
<body>
<div class="container-fluid";>
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="#" style="color: white;">Tienda UTEZ</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>


                </div>
            </nav>
        </div>
    </div>

    <!--Empieza la pantalla de admin pai  -->

    <div class="row justify-content-center mt-3">
        <div class="col-4" ><a href="articulo" style=" color: black; border: solid black;background-color: #00AC82;width: 100%; height: 30em; border-radius: 3em; display: flex; align-items: center; justify-content: center;">ARTICULOS</a></div>

        <div class="col-4 mx-0"><a href="oferta" style="color: black; border: solid black;background-color: #00AC82;width: 100%; height: 30em; border-radius: 3em; display: flex; align-items: center; justify-content: center;">OFERTAS</a></div>

        <div class="col-4"><a href="usuario" style=" color: black; border: solid black;background-color: #00AC82 ;width: 100%; height: 30em; border-radius: 3em; display: flex; align-items: center; justify-content: center;">USUARIOS</a></div>
    </div>

</div>
<script>
    function Validar()
    {
        if (confirm('¿Esta seguro de eliminar?')) {
            return true;
        } else {
            return false;
        }
    }
</script>
</body>
</html>

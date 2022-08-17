<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 01/08/2022
  Time: 08:23 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Tienda Utez</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos2.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilosbrian.css" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Uso de jquery -->
    <script src="JS/jquery-3.6.0.js"></script>
    <!-- llamando a js -->
    <script src="JS/script.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col" style="padding: 0;">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #002B5E;">
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="home" style="color: white;">Tienda UTEZ</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class=" col-8" id="navbarSupportedContent" >
                        <form class="d-flex" style="margin-bottom: 0px;" action="buscar" method="get">
                            <input class="form-control me-2" name="text" style="width: 100%; margin: 0;" type="search" placeholder="Pantalon azul" aria-label="Search">
                            <button class="btn btn-success" style="background-color: #00AC82;"; type="submit">Buscar</button>
                        </form>
                    </div>
                    <div class="bg-dark col-2">
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Estructura correcta -->
    <div class="row">
        <h1 class="mb-3 mt-2" style="color: red">Artículos en Descuento</h1>
        <!-- Barra de Filtrado de la busqueda -->
        <div class="col-1">

        </div>
        <!-- Productos -->
        <div class="col-10">
            <section class="Products-list">
                <c:forEach var="bus" items="${busqueda}" varStatus="status">
                    <c:forEach var="articulo" items="${articulos}" varStatus="status">
                        <c:if test="${articulo.ID==bus.fk_articulo}">
                    <a href="producto?id=<c:out value="${articulo.ID}"/>" class="mx-1">
                        <article category="${articulo.categoria}" class="card" style="background: url(${articulo.imagen}) center no-repeat; background-size: cover;">
                            <div class="card_content" style="min-height: 9em">
                                <h4 class="card_title text-start">${articulo.nombre}</h4>
                                <span class="card_subtitle text-start">$${articulo.getPrecio(articulo.ID)}</span>
                                <p class="card_description text-start">${articulo.dec1}</p>
                            </div>
                        </article>
                    </a>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </section>
        </div>
        <div class="col-1">

        </div>
    </div>


</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->

</body>
</html>

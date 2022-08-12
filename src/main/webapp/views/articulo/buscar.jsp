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
        <h1>Todos los Articulos</h1>
        <!-- Barra de Filtrado de la busqueda -->
        <div class="col-2">
            <div class="Category-list">
                <h6>FILTRAR POR:</h6>
                <a href="#" class="Category_item" category="all" >Todo</a>
                <a href="#" class="Category_item" category="Playera" >Playeras</a>
                <a href="#" class="Category_item" category="sudadera" >Sudaderas</a>
                <a href="#" class="Category_item" category="Pantalon" >Pantalon</a>
                <a href="#" class="Category_item" category="Accesorios" >Accesorios</a>
                <a href="#" class="Category_item" category="Chaqueta" >Chaquetas</a>
            </div>
        </div>
        <!-- Productos -->
        <div class="col-10">
            <section class="Products-list">
                <c:forEach var="bus" items="${busqueda}" varStatus="status">
                    <a href="producto?id=<c:out value="${bus.ID}"/>" class="mx-1">
                    <article category="${bus.categoria}" class="card" style="background: url(${bus.imagen}) center no-repeat; background-size: cover;">
                        <div class="card_content" style="min-height: 9em">
                            <h4 class="card_title text-start">${bus.nombre}</h4>
                            <span class="card_subtitle"></span>
                            <p class="card_description text-start">${bus.dec1}</p>
                        </div>
                    </article>
                        </a>
                </c:forEach>
            </section>
        </div>
    </div>


</div>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->

<script>
    //Filtro
    $(document).ready(function(){
        //agregamos la clase active al primer enlace
        $('.Category-list .Category-item[category="all"]').addClass('ct_item-active');

        //funcion para que al dar clik se filtren los articulos
        $('.Category_item').click(function(){
            var catProduct = $(this).attr('category');
            console.log(catProduct);

            //agregamos la clase active al enlace que seleccionamos
            $('.Category_item').removeClass('ct_item-active');
            $(this).addClass('ct_item-active');

            //Filtrar los articulos. se ocultan los demas productos xd
            $('.card').css('transform', 'scale(0)');
            function hideProduct(){
                $('.card').hide();
            } setTimeout(hideProduct,400);

            //mostrar los productos
            function showProduct(){
                $('.card[category="'+catProduct+'"]').css('transform', 'scale(1)');
                $('.card[category="'+catProduct+'"]').show();
            } setTimeout(showProduct,400);

        });

        //mostear todos los productos
        $('.Category_item[category="all"]').click(function(){
            function showAll(){
                $('.card').show();
                $('.card').css('transform', 'scale(1)');
            } setTimeout(showAll,400);
        });
    });
</script>
</body>
</html>

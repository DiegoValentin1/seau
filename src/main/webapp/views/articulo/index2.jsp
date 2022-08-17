<%@ page import="com.seau.seau.model.stock.DaoStock" %>
<%@ page import="com.seau.seau.model.stock.BeanStock" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.seau.seau.service.stock.ServiceStock" %><%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 18/07/2022
  Time: 04:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos2.css" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #002B5E;">
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="home" style="color: white;">Tienda UTEZ</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class=" col-8" id="navbarSupportedContent" style="">

                        <form class="d-flex" style="margin: 0" action="buscar" method="get">
                            <input class="form-control me-2" style="width: 100%; margin: 0;" type="search" name="text" placeholder="Pantalon" aria-label="Search">
                            <button class="btn btn-success" style="background-color: #00AC82;"; type="submit">Buscar</button>
                        </form>
                    </div>
                    <div class="bg-dark col-2">

                    </div>
                </div>
            </nav>
        </div>
    </div>

    <div style="margin: 0em;">
        <!-- Carrusseles -->
        <div class="row justify-content-center">
            <div class="col" style="padding: 0">
                <div id="carouselExampleCaptions" class="carousel slide" style="padding: 0;" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <c:forEach var="descuento" items="${descuentos}" varStatus="status">
                                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<c:out value="${status.index+1}"/>" aria-label="Slide <c:out value="${status.index+2}"/>"></button>

                        </c:forEach>


                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://i.postimg.cc/C1fwcDCq/banner-Ropa.jpg" class="d-block w-100" alt="..." height="400px">
                            <div class="carousel-caption d-none d-md-block" ><b>
                                <h4>DESCUENTOS</h4>
                                <p>Disfruta de miles de descuentos en artículos seleccionados</p>
                            </b></div>
                        </div>
                    <c:forEach var="descuento" items="${descuentos}" varStatus="status">


                                    <div class="carousel-item" >
                                        <img src="${descuento.imagen}" class="d-block w-100" alt="..." height="400px">
                                        <a href="banner?ID_det=<c:out value="${descuento.ID_det}"/>"><div class="carousel-caption d-none d-md-block">
                                            <p>
                                                ${descuento.mensaje}
                                            </p>



                                        </div></a>
                                    </div>


                    </c:forEach>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>

    </div>
    <!-- productos -->
    <div class="row mt-5">
        <div class="col-12 text-center">
            <h1>NUESTROS PRODUCTOS</h1>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-1"></div>
        <div class="col-10" style="display: flex; flex-wrap: wrap; align-items: center; justify-content: center; flex-direction: row">
            <c:forEach begin="0" end="5" var="articulo" items="${articulos}" varStatus="status">
                    <a href="producto?id=<c:out value="${articulo.ID}"/>" style="flex: 33.33%;">
                        <article class="card mx-0 my-1" style="background: url(<c:out value="${articulo.imagen}"/>) center no-repeat; background-size: cover; ";>
                            <div class="card_content" style="min-height: 9em;">
                                <h4 class="card_title"><c:out value="${articulo.nombre}"/></h4>
                                <h6 class="card_subtitle">$${articulo.getPrecio(articulo.ID)}</h6>
                                <p class="card_description">${articulo.dec1}</p>
                            </div>
                        </article>
                    </a>
            </c:forEach>
        </div>

    </div>

    </div>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>

        var myCarousel = document.querySelector('#myCarousel')
        var carousel = new bootstrap.Carousel(myCarousel)
    </script>
</body>
</html>

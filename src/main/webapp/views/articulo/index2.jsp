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
<div class="container-fluid";>
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #002B5E;">
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="#" style="color: white;">Tienda Utez</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class=" col-8" id="navbarSupportedContent">

                        <form class="d-flex">
                            <input class="form-control me-2" style="width: 100%; margin: 0;" type="search" placeholder="Pantalon azul" aria-label="Search">
                            <button class="btn btn-outline-success" style="background-color: #00AC82;"; type="submit">Buscar</button>
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
        <div class="row mt-2 justify-content-center">
            <div class="col-5">
                <div id="carouselExampleCaptions" class="carousel slide" style="padding: 0;" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <c:forEach var="descuento" items="${descuentos}" varStatus="status">
                            <c:forEach var="stock" items="${stocks}" varStatus="status2">
                                <c:choose>
                                    <c:when test='${stock.ID_stk == descuento.ID_det}'>
                                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<c:out value="${status.index+1}"/>" aria-label="Slide <c:out value="${status.index+2}"/>"></button>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:forEach>


                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://i.postimg.cc/CMPK6x0P/desc.webp" class="d-block w-100" alt="..." height="400px">
                            <div class="carousel-caption d-none d-md-block" style="color: "><b>
                                <h4>DESCUENTOS</h4>
                                <p>Hasta 50% de descuento en productos seleccionados por talla o color</p>
                            </b></div>
                        </div>
                    <c:forEach var="descuento" items="${descuentos}" varStatus="status">
                        <c:forEach var="stock" items="${stocks}" varStatus="status2">
                            <c:choose>
                                <c:when test='${stock.ID_stk == descuento.fk_stock}'>
                                    <%
                                        ServiceStock serviceStock= new ServiceStock();
                                        List<BeanStock> stocks = new ArrayList<>();
                                        BeanStock stock = null;
                                        stock = new BeanStock();
                                        stocks=serviceStock.getAll();
                                        stock=stocks.get(1);
                                        stock.getFk_articulo();

                                    %>
                        <a href="producto?id=<c:out value="${stock.fk_articulo}"/>&stk=<c:out value="${stock.ID_stk}"/>"><div class="carousel-item">
                                        <img src="https://i.ibb.co/NKvbmf5/clairo.jpg" class="d-block w-100" alt="..." height="400px">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h5 style="color: red;" class="text-end"><del>$<c:out value="${stock.precio}"/></del></h5>
                                            <h5 class="text-start">$<c:out value="${stock.precio*descuento.por_descuento/100}"/></h5>
                                            <c:forEach var="articulo" items="${articulos}" varStatus="status3">
                                                <c:choose>
                                                    <c:when test='${stock.fk_articulo == articulo.ID}'>
                                                        <h5 class="text-start"><c:out value="${articulo.nombre}"/></h5>
                                                        <p class="text-start"><c:out value="${stock.talla}"/>  <c:out value="${stock.color}"/></p>
                                                        <p class="text-start"><c:out value="${articulo.dec1}"/></p>

                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div></a>

                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
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
    <div class="row">
        <div class="col-12 text-center">
            <h1>PRODUCTOS ALEATOREOS</h1>
        </div>
    </div>
    <div class="row my-2 px-5 py-5 justify-content-center">
        <c:forEach var="articulo" items="${articulos}" varStatus="status">
            <div class="col-3 mx-5" id="">
                <a href="producto?id=<c:out value="${articulo.ID}"/>">
                <article class="card mx-1 my-1" style="background: url(<c:out value="${articulo.imagen}"/>) center no-repeat;">
                    <div class="card_content">
                        <h3 class="card_title"><c:out value="${articulo.nombre}"/></h3>
                        <span class="card_subtitle"></span>
                        <p class="card_description"><c:out value="${articulo.dec1}"/></p>
                    </div>
                </article>
                </a>
            </div>
        </c:forEach>
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

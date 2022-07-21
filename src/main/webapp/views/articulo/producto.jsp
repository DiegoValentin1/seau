<%@ page import="static java.lang.System.out" %>
<%@ page import="com.seau.seau.model.stock.BeanStock" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.seau.seau.service.stock.ServiceStock" %>
<%@ page import="com.seau.seau.service.articulo.ServiceArticulo" %>
<%@ page import="com.seau.seau.model.articulo.BeanArticulo" %>
<%@ page import="com.seau.seau.service.descuento.ServiceDescuento" %>
<%@ page import="com.seau.seau.model.descuento.BeanDescuento" %>
<%@ page import="static jdk.javadoc.internal.doclets.toolkit.util.DocPath.empty" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 20/07/2022
  Time: 10:34 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%ServiceStock serviceStock= new ServiceStock();
    List<BeanStock> stocks = new ArrayList<>();
    BeanStock stock = new BeanStock();
    stocks=serviceStock.getAll();
    ServiceArticulo serviceArticulo= new ServiceArticulo();
    List<BeanArticulo> articulos = new ArrayList<>();
    BeanArticulo articulo = new BeanArticulo();
    articulos=serviceArticulo.getAll();
    ServiceDescuento serviceDescuento= new ServiceDescuento();
    List<BeanDescuento> descuentos = new ArrayList<>();
    BeanDescuento descuento = new BeanDescuento();
    descuentos=serviceDescuento.getAll();




    long existencia = 0;
    int magia = 0 , contador = 0;
    double precio = 0;
    String imagen = "";

    descuento=descuentos.get(1);

    if (request.getParameter("stk")!=null){
        int stk=Integer.parseInt(request.getParameter("stk"));
        stock=stocks.get(stk);
        imagen = stock.getImagen();
        precio = stock.getPrecio();
        existencia = stock.getStock();
    }else if(request.getParameter("stk")==null && request.getParameter("color")==null){
        int id=Integer.parseInt(request.getParameter("id"));
        articulo = articulos.get(id);
        imagen = articulo.getImagen();
        precio = 0;
        existencia = 0;
    }else if(request.getParameter("color")!=null && request.getParameter("talla")!=null){
        String color = request.getParameter("color"), talla = request.getParameter("talla");
        for( BeanStock ola : stocks) {
            if (Objects.equals(ola.getColor(), color) && Objects.equals(ola.getTalla(), talla)){
                magia = Math.toIntExact(ola.getID_stk());
                stock=stocks.get(magia);
                imagen = stock.getImagen();
                precio = stock.getPrecio();
                existencia = stock.getStock();
            }
        }
    }
%>
<html lang="en">
<head>
    <title>Producto</title>
    <link rel="stylesheet" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos2.css" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light">
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
    <!-- producto -->
    <div class="row my-3">
        <div class="col-1"></div>
        <div class="col-4 text-center py-3 px-5" style="background-color: grey;">
            <img src="<% out.print(imagen); %>" alt="producto" style="height: 20em; margin-bottom: 1em;">
            <img src="imagenes/rojo.png" alt="color" class="colores">
            <img src="imagenes/amarillo.png" alt="color" class="colores">
            <img src="imagenes/verde.jpg" alt="color" class="colores">
            <img src="imagenes/azul.webp" alt="color" class="colores">


        </div>
        <div class="col-1"></div>
        <div class="col-5">

            <c:forEach var="articulo" items="${articulos}" varStatus="status">
                <c:if test="${articulo.ID==param.id}">
                    <h1><c:out value="${articulo.nombre}"/></h1>
                </c:if>
            </c:forEach>

            <h3>$ <% out.print(precio); %></h3>
            <br>
            <c:forEach var="articulo" items="${articulos}" varStatus="status">
                <c:if test="${articulo.ID==param.id}">
                    <p><c:out value="${articulo.dec2}"/></p>
                </c:if>
            </c:forEach>
            <form action="post" style="margin-bottom: 2em;">
                <select name="talla" style="margin-right: 1em;">
                    <c:forEach var="stock" items="${stocks}" varStatus="status">
                        <c:if test="${stock.fk_articulo==param.id}">
                            <option><c:out value="${stock.talla}"/></option>
                        </c:if>
                    </c:forEach>
                </select>

                <select name="color" style="margin-right: 1em;">

                    <c:forEach var="stock" items="${stocks}" varStatus="status">
                        <c:if test="${stock.fk_articulo==param.id}">
                            <option><c:out value="${stock.color}"/></option>
                        </c:if>
                    </c:forEach>

                </select>

                <button class="btn btn-outline-dark" type="submit">Verificar</button>
            </form>
            <h6>Existencia: <%if (request.getParameter("color") == null) {
                out.print("XXXXX");
            }else{out.print(existencia);
            } %></h6>
        </div>
        <div class="col-1"></div>
    </div>
</div>
</body>
</html>
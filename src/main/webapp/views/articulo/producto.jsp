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
<%@ page import="java.util.Objects" %>
<%@ page import="com.seau.seau.model.artdes.BeanArtdes" %>
<%@ page import="com.seau.seau.service.artdes.ServiceArtdes" %><%--
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
    ServiceArtdes serviceArtdes = new ServiceArtdes();
    List<BeanArtdes> artdeses = new ArrayList<>();
    artdeses=serviceArtdes.getAll();
    ServiceDescuento serviceDescuento= new ServiceDescuento();
    List<BeanDescuento> descuentos = new ArrayList<>();
    BeanDescuento descuento = new BeanDescuento();
    descuentos=serviceDescuento.getAll();



    long existencia = 0;
    int magia = 0 , contador = 0, id=0, col=0, index=0;
    double precio = 0, desc = 0;
    String imagen = "", color = "", talla = "";



    if (request.getParameter("stk")!=null){
        col=1;
        id = Integer.parseInt(request.getParameter("id"));

        int stk=Integer.parseInt(request.getParameter("stk"));
        stock=stocks.get(stk-1);
        imagen = stock.getImagen();
        precio = stock.getPrecio();
        existencia = stock.getStock();
        color = stock.getColor();
        talla = stock.getTalla();
        for (BeanDescuento des: descuentos){
            for (BeanArtdes art: artdeses){
                if (des.getID_det() == art.getFk_descuento() && art.getFk_articulo()==id){
                    contador = contador + 1;
                    desc = des.getPor_descuento();
                    break;
                }
            }
        }
    }else if(request.getParameter("stk")==null && request.getParameter("color")==null){
        id=Integer.parseInt(request.getParameter("id"));
        for (BeanArticulo arti: articulos){
            if (id == arti.getID()){
                imagen = arti.getImagen();
                break;
            }
        }
        precio = 0;
        existencia = 0;
    }else if(request.getParameter("color")!=null && request.getParameter("talla")!=null){
        col=1;
        color = request.getParameter("color"); talla = request.getParameter("talla");
        id = Integer.parseInt(request.getParameter("id"));
        for( BeanStock ola : stocks) {
            if (Objects.equals(ola.getColor(), color) && Objects.equals(ola.getTalla(), talla) && ola.getFk_articulo() == id){
                magia = Math.toIntExact(ola.getID_stk());
                stock=stocks.get(magia-1);
                for (BeanArticulo arti: articulos){
                    if (id == arti.getID()){
                        imagen = arti.getImagen();
                        break;
                    }
                }
                /*imagen = stock.getImagen();*/
                precio = stock.getPrecio();
                existencia = stock.getStock();
                break;
            }
        }
        for (BeanDescuento des: descuentos){
            for (BeanArtdes art: artdeses){
                if (des.getID_det() == art.getFk_descuento() && art.getFk_articulo()==id){
                    contador = contador + 1;
                    desc = des.getPor_descuento();
                    break;
                }
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
                    <a class="navbar-brand" href="home" style="color: white;">Tienda UTEZ</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
                <div class=" col-8" id="navbarSupportedContent">

                    <form class="d-flex" style="margin: 0" method="get" action="buscar">
                        <input class="form-control me-2" style="width: 100%; margin: 0;" name="text" type="search" placeholder="Pantalon" aria-label="Search">
                        <button class="btn btn-success" style="background-color: #00AC82;"; type="submit">Buscar</button>
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
        <div class="col-4 py-3 px-2" style="background-color: white;">

            <div id="carouselExampleCaptions" class="carousel slide" style="padding: 0;" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <c:forEach var="stock" items="${stocks}" varStatus="status">
                        <c:if test="${stock.fk_articulo==param.id}">
                            <% index=index+1; %>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<% out.print(index); %>" aria-label="Slide <% out.print(index+1); %>"></button>
                        </c:if>
                    </c:forEach>


                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<% out.print(imagen); %>" class="d-block w-100" alt="..." height="400px">
                        <div class="carousel-caption d-none d-md-block" ><b>

                        </b></div>
                    </div>
                    <c:forEach var="stock" items="${stocks}" varStatus="status">
                        <c:if test="${stock.fk_articulo==param.id}">

                        <div class="carousel-item" >
                            <img src="${stock.imagen}" class="d-block w-100" alt="..." height="400px">
                            <div class="carousel-caption d-none d-md-block">

                            </div>
                        </div>

                        </c:if>
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
        <div class="col-1"></div>
        <div class="col-5">

            <c:forEach var="articulo" items="${articulos}" varStatus="status">
                <c:if test="${articulo.ID==param.id}">
                    <h1><c:out value="${articulo.nombre}"/></h1>
                </c:if>
            </c:forEach>
            <h4 class="text-end" style="color: red"><del><% if (contador!=0){
                 out.print(precio);
            }%></del></h4>
            <h3>$ <% if (contador!=0){
                out.print(precio-(precio*desc/100));
            }else{
                out.print(precio);
            }
            %></h3>
            <h4><% if (col!=0){
                out.print("Color: " + color + " Talla: " + talla);
            }
            %></h4>
            <br>
            <c:forEach var="articulo" items="${articulos}" varStatus="status">
                <c:if test="${articulo.ID==param.id}">
                    <p>${articulo.dec1}</p>
                </c:if>
            </c:forEach>
            <form action="producto" style="margin-bottom: 2em;">
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
                <input value="<% out.print(id); %>" name="id" type="hidden">
                <button class="btn btn-success" type="submit">Verificar</button>
            </form>
            <h6>Existencia: <%if (contador!=0) {
                out.print(existencia + " Ultimas piezas");
            }else{out.print(existencia);
            } %></h6>
        </div>
        <div class="col-1"></div>
    </div>
    <div class="row justify-content-center mt-3">
        <div class="col-11">
            <c:forEach var="articulo" items="${articulos}" varStatus="status">
                <c:if test="${articulo.ID==param.id}">
                    <p>${articulo.dec2}</p>
                </c:if>
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
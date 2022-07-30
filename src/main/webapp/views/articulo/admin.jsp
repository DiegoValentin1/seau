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

    <title>Login</title>

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
                        <a class="navbar-brand" href="#" style="color: white;">Tienda Utez</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>


                </div>
            </nav>
        </div>
    </div>

    <!--Empieza la pantalla de admin pai  -->
    <!-- ARTICULOS -->
    <div class="row my-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">
                            ARTICULOS
                        </div>
                        <div class="col-6 text-end">
                            <a href="addArt" class="btn btn-outline-primary">INSERT</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción Corta</th>
                        <th>Descripción Larga</th>
                        <th>Categoria</th>
                        <th>Imagen URL</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        <th>Insertar Stock</th>
                        </thead>
                        <tbody>
                        <c:forEach var="articulo" items="${articulos}" varStatus="status">
                            <tr>
                                <td>
                                    <c:out value="${articulo.ID}"/>
                                </td>
                                <td>
                                    <c:out value="${articulo.nombre}"/>
                                </td>
                                <td>
                                    <c:out value="${articulo.dec1}"/>
                                </td>
                                <td>
                                    <c:out value="${articulo.dec2}"/>
                                </td>
                                <td>
                                    <c:out value="${articulo.categoria}"/>
                                </td>
                                <td>
                                    <c:out value="${articulo.imagen}"/>
                                </td>
                                <td>
                                    <a href="" class="btn btn-warning">MODIFY</a>
                                </td>
                                <td>
                                    <a href="" class="btn btn-danger">DELETE</a>
                                </td>
                                <td>
                                    <a href="addStock?ID=${articulo.ID}" class="btn btn-primary">INSERT</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- STOCK -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">
                            STOCK
                        </div>
                        <div class="col-6 text-end">

                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Stock</th>
                        <th>Precio</th>
                        <th>Articulo ID</th>
                        <th>Imagen URL</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        <th>Insertar Descuento</th>
                        </thead>
                        <tbody>
                        <c:forEach var="stock" items="${stocks}" varStatus="status">
                            <tr>
                                <td>
                                    <c:out value="${stock.ID_stk}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.talla}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.color}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.stock}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.precio}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.fk_articulo}"/>
                                </td>
                                <td>
                                    <c:out value="${stock.imagen}"/>
                                </td>
                                <td>
                                    <a href="" class="btn btn-warning">MODIFY</a>
                                </td>
                                <td>
                                    <a href="" class="btn btn-danger">DELETE</a>
                                </td>
                                <td class="text-center">
                                    <a href="addDesc?ID_stk=${stock.ID_stk}" class="btn btn-primary">INSERT</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- DESCUENTO -->
    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">
                            DESCUENTOS
                        </div>
                        <div class="col-6 text-end">

                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Fecha de Fin</th>
                        <th>Porcentaje de Descuento</th>
                        <th>ID Articulo en Stock</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                        <c:forEach var="descuento" items="${descuentos}" varStatus="status">
                            <tr>
                                <td>
                                    <c:out value="${descuento.ID_det}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.fecha_fin}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.por_descuento}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.fk_stock}"/>
                                </td>
                                <td>
                                    <a href="" class="btn btn-warning">MODIFY</a>
                                </td>
                                <td>
                                    <a href="" class="btn btn-danger">DELETE</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>

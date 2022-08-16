<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 04/08/2022
  Time: 04:08 p. m.
  To change this template use File | Settings | File Templates.
--%>
<% if(session.getAttribute("user") == null){
    request.getRequestDispatcher("/login").forward(request, response);
} %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Articulo</title>
    <script src="https://unpkg.com/feather-icons"></script>
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
                        <a class="navbar-brand" href="admin" style="color: white;">Tienda UTEZ</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                    <div class="col-2 text-end">
                        <a href="logout" class="btn btn-sm btn-success">Cerrar Sesión</a>
                    </div>

                </div>
            </nav>
        </div>
    </div>

    <!--Empieza la pantalla de admin pai  -->

    <div class="row my-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-6">
                            ARTICULOS
                        </div>
                        <div class="col-6 text-end">
                            <a href="addArt" class="btn btn-outline-primary"><i data-feather="plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción Corta</th>
                        <th>Categoria</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
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
                                    <c:out value="${articulo.categoria}"/>
                                </td>

                                <td>
                                    <a href="modArt?ID=${articulo.ID}&n=${articulo.nombre}" class="btn btn-sm btn-warning"><i data-feather="edit"></i></a>
                                </td>
                                <td>
                                    <form action="delArt" method="post" onsubmit="javascript: return Validar();">
                                        <input type="hidden" name="ID" value="${articulo.ID}">
                                        <button type="submit" class="btn btn-sm btn-danger"><i data-feather="trash-2"></i></button>
                                    </form>
                                </td>
                                <td>

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
<script>
    function Validar()
    {
        if (confirm('¿Esta seguro de eliminar?')) {
            return true;
        } else {
            return false;
        }
    }
    feather.replace();
</script>
</body>
</html>


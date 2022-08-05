<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 04/08/2022
  Time: 09:17 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Ofertas</title>
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
                            <a href="addUsu" class="btn btn-sm btn-outline-primary"><i data-feather="plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead>
                        <th>#</th>
                        <th>Fecha de Inicio</th>
                        <th>Fecha de Fin</th>
                        <th>% Descuento</th>
                        <th>Articulos en Descuento</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                        <c:forEach var="descuento" items="${descuentos}" varStatus="status">
                            <tr>
                                <td>
                                    <c:out value="${status.count}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.fecha_inicio}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.fecha_fin}"/>
                                </td>
                                <td>
                                    <c:out value="${descuento.por_descuento}"/>
                                </td>
                                <td>
                                    <c:forEach var="artdes" items="${artdeses}" varStatus="status2">
                                        <c:if test="${artdes.fk_descuento==descuento.ID_det}">
                                            <p><c:out value="${status2.count}"/>-<c:forEach var="articulo" items="${articulos}" varStatus="status">
                                            <c:if test="${articulo.ID==artdes.fk_articulo}">
                                                <c:out value="${articulo.nombre}"/>
                                            </c:if>
                                        </c:forEach></p>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a href="modDesc?ID_det=${descuento.ID_det}" class="btn btn-warning"><i data-feather="edit"></i></a>
                                </td>
                                <td>
                                    <form action="delDesc" method="post" onsubmit="javascript: return Validar();">
                                        <input type="hidden" name="ID_det" value="${descuento.ID_det}">
                                        <button class="btn btn-danger"><i data-feather="trash-2"></i></button>
                                    </form>
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


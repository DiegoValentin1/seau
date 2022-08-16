<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 30/07/2022
  Time: 06:32 p. m.
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

    <title>Modificar Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/todo/estilos.css" type="text/css">
</head>
<body>
<div class="container-fluid"; >
    <div class="row" style="background-color: #002B5E;">
        <div class="">
            <nav class="navbar navbar-expand-lg navbar-light" >
                <div class="container-fluid" style="text-align: left;">
                    <div class="col-2">
                        <a class="navbar-brand" href="admin" style="color: white;">Tienda Utez</a>
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

    <!--Empieza el mero Modificar Stock  -->

    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header"><p class="text-center">MODIFICACIÓN DE STOCK DEL ARTICULO</p>
<c:forEach var="articulo" items="${articulos}" varStatus="status">
    <c:if test="${articulo.ID==param.ID}">
                    <h2 class="text-center" style="color: #55C193;">${articulo.nombre}</h2>
    </c:if>
</c:forEach>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
<c:forEach var="stock" items="${stocks}" varStatus="status">
    <c:if test="${stock.ID_stk==param.ID_stk}">
                                <form action="modStock" method="post" novalidate class="needs-validation">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="name">Talla</label>
                                                <input type="text" value="${stock.talla}" id="name" name="talla" class="form-control" required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="health">Color</label>
                                                <input type="text" value="${stock.color}" id="health" name="color" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="power">Stock</label>
                                                <input type="number" value="${stock.stock}" min="0" id="power" name="stock" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="weight">Precio</label>
                                                <input type="text" value="${stock.precio}" min="0" pattern="^[0-9]+(.[0-9]+)?$" id="weight" name="precio" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="height">ID Articulo</label>
                                                <input type="number" id="height" name="fk_articulo2" class="form-control"
                                                       required disabled value="${param.ID}"/>
                                                <input type="hidden" name="fk_articulo" value="${param.ID}">
                                                <input type="hidden" name="ID_stk" value="${stock.ID_stk}">
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="height2">Imagen URL</label>
                                                <input type="text" value="${stock.imagen}" id="height2" name="imagen" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3 text-end">
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            Cancelar
                                        </button>
                                        <button type="submit" class="btn btn-success btn-sm">
                                            Guardar
                                        </button>
                                    </div>
                                </form>
    </c:if>
</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>

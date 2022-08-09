<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 30/07/2022
  Time: 06:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Modificar Articulo</title>
    <script src="https://cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
    <script src="https://unpkg.com/feather-icons"></script>
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
                        <a class="navbar-brand" href="#" style="color: white;">Tienda Utez</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>


                </div>
            </nav>
        </div>
    </div>

    <!--Empieza el mero Update Articulo  -->
<c:forEach var="articulo" items="${articulos}" varStatus="status">
    <c:if test="${articulo.ID==param.ID}">
    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header"><p class="text-center">MODIFICANDO EL ARTICULO</p> <h2 class="text-center" style="color: #55C193;">${articulo.nombre}</h2>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <form action="modArt" method="post" novalidate class="needs-validation">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="name">Nombre</label>
                                                <input type="text" value="${articulo.nombre}" id="name" name="nombre" class="form-control" required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="health">Descripción Corta</label>
                                                <input type="text" value="${articulo.dec1}" id="health" name="dec1" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="power">Imagen URL</label>
                                                <input type="text" value="${articulo.imagen}" id="power" name="imagen" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="weight">Categoria</label>
                                                <input type="text" value="${articulo.categoria}" id="weight" name="categoria" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="height">Descripción Larga</label>
                                                <textarea name="dec2" id="height" cols="30" rows="10" required><c:out value="${articulo.dec2}"/></textarea>
                                                <div class="invalid-feedback">

                                                </div>
                                                <input type="hidden" name="ID" value="${param.ID}">
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

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </c:if>
</c:forEach>
    <div class="row mt-2">
        <div class="col-12 text-center"><h3>Stock del Artículo</h3></div>
    </div>
    <div class="row justify-content-center">
        <div class="col-11">
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
                        <th>#</th>
                        <th>Talla</th>
                        <th>Color</th>
                        <th>Stock</th>
                        <th>Precio</th>
                        <th>Imagen URL</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                        </thead>
                        <tbody>
                        <c:forEach var="stock" items="${stocks}" varStatus="status">
                            <c:if test="${stock.fk_articulo==param.ID}">
                            <tr>
                                <td>
                                    <c:out value="${status.count}"/>
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
                                    <c:out value="${stock.imagen}"/>
                                </td>
                                <td>
                                    <a href="modStock?ID_stk=${stock.ID_stk}&ID=${stock.fk_articulo}" class="btn btn-warning"><i data-feather="edit"></i></a>
                                </td>
                                <td>
                                    <form action="delStock" method="post" onsubmit="javascript: return Validar();">
                                        <input type="hidden" name="ID_stk" value="${stock.ID_stk}">
                                        <button class="btn btn-danger"><i data-feather="trash-2"></i></button>
                                    </form>
                                </td>

                            </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
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
    })();
    feather.replace();
    CKEDITOR.replace( 'dec2' );
</script>
</body>
</html>

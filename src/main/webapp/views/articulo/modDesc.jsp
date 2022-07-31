<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 31/07/2022
  Time: 01:34 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Modificar Descuento</title>
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

    <!--Empieza el mero Insertar Stock  -->

    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header"><p class="text-center">REGISTRO DE DESCUENTO DEL STOCK ID</p> <h2 class="text-center" style="color: #55C193;">${param.ID_stk}</h2>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
<c:forEach var="descuento" items="${descuentos}" varStatus="status">
    <c:if test="${descuento.ID_det==param.ID_det}">
                                <form action="modDesc" method="post" novalidate class="needs-validation">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="min">Fecha Fin</label>
                                                <input type="date" value="${descuento.fecha_fin}"  id="min" name="fecha_fin" class="form-control min-today"
                                                       required data-date-split-input="true"/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="weight">Porcentaje Descuento</label>
                                                <input type="number" value="${descuento.por_descuento}" min="0" max="100"  id="weight" name="por_descuento" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="height">ID Stock</label>
                                                <input type="number" id="height" name="fk_stock2" class="form-control"
                                                       required disabled value="${param.ID_stk}"/>
                                                <div class="invalid-feedback">

                                                </div>
                                                <input type="hidden" name="fk_stock" value="${param.ID_stk}">
                                                <input type="hidden" name="ID_det" value="${param.ID_det}">
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
    document.getElementById('min').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
</script>
</body>
</html>

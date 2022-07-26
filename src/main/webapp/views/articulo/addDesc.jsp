<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 30/07/2022
  Time: 02:21 p. m.
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

    <title>Agregar Descuento</title>
    <script src="https://cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
    <link rel="stylesheet" href="estilos.css">
    <script src="https://unpkg.com/feather-icons"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid"; >
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

    <!--Empieza el mero Insertar Stock  -->

    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header"><h3 class="text-center">REGISTRO DE DESCUENTO</h3>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <form action="addDesc" method="post" novalidate class="needs-validation">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="min">Fecha Inicio</label>
                                                <input type="date"  id="min" name="fecha_inicio" class="form-control min-today"
                                                       required data-date-split-input="true"/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="weight">Porcentaje Descuento</label>
                                                <input type="number" min="0" max="100"  id="weight" name="por_descuento" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="min2">Fecha Fin</label>
                                                <input type="date"  id="min2" name="fecha_fin" class="form-control min-today"
                                                       required data-date-split-input="true"/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                            <div class="col">
                                                <label for="height">Imagen Url</label>
                                                <input type="text" id="height" name="imagen" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col"><label for="height2">Mensaje</label>
                                                <textarea name="mensaje" id="height2" cols="30" rows="10" required></textarea>
                                                <div class="invalid-feedback">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3 justify-content-center">

                                        <div class="col"><table class="table">
                                            <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Articulo</th>
                                                <th scope="col"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                        <c:forEach var="articulo" items="${articulos}" varStatus="status">
                                            <tr>
                                                <th scope="row"><c:out value="${status.count}"/></th>
                                                <td><c:out value="${articulo.nombre}"/></td>
                                                <td><input type="checkbox" id="${articulo.nombre}" onclick="myFunction('${articulo.ID}','${articulo.nombre}')">
                                                    <input type="hidden" id="${articulo.ID}" name="" value="${articulo.ID}"></td>
                                            </tr>
                                        </c:forEach>

                                            </tbody>
                                        </table></div>
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
                        <div class="row justify-content-center">

                            <div class="col-3 mx-2">

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    CKEDITOR.replace('mensaje');
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    feather.replace()
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
    document.getElementById('min2').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];

    function myFunction(idA, idC) {
        var checkBox = document.getElementById(idC);
        console.log(idA);
        console.log(idC);
        var text = document.getElementById(idA);
        if (checkBox.checked == true){
            console.log(idA);
            console.log(idC);
            text.name = idC;
        } else {
            text.name = "";
        }
    }

</script>
</body>
</html>

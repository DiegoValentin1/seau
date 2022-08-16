<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 04/08/2022
  Time: 06:05 p. m.
  To change this template use File | Settings | File Templates.
--%>
<% if(session.getAttribute("user") == null){
    request.getRequestDispatcher("/login").forward(request, response);
} %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>Añadir Usuario</title>
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
                <div class="card-header"><h3 class="text-center">Modificar Usuario</h3>
                    <div id="aviso"></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">

                                <form action="addUsu" method="post" novalidate class="needs-validation" onsubmit="javascript: return igual();">
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="height">Username</label>
                                                <input type="text" id="username" name="username" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>

                                            </div>


                                        </div>
                                    </div>
                                    <div class="form-group mb-3">

                                        <div class="row">
                                            <div class="col">
                                                <label for="height">Contraseña</label>
                                                <input type="password" id="password" name="password" class="form-control"
                                                       required/>
                                                <div class="invalid-feedback">

                                                </div>

                                            </div>


                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <div class="row">
                                            <div class="col">
                                                <label for="height">Repetir Contraseña</label>
                                                <input type="password" id="password2" name="password2" class="form-control"
                                                       required value=""/>
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
    const igual = () =>{
        let p1 = document.getElementById("password").value;
        let p2 = document.getElementById("password2").value;
        if (p1 == p2) {
            return true;
        } else {
            document.getElementById("aviso").innerHTML = 'Contraseñas Desiguales, intentelo de nuevo';
            return false;
        }
    }
</script>
</body>
</html>

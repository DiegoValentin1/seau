<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 22/07/2022
  Time: 02:29 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

  <title>Agregar Articulo</title>
  <script src="https://cdn.ckeditor.com/4.19.1/full/ckeditor.js"></script>
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

  <!--Empieza el mero Insertar Articulo  -->

  <div class="row mt-3">
    <div class="col-12">
      <div class="card">
        <div class="card-header">REGISTRO DE ARTICULOS
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <form action="addArt" method="post" novalidate class="needs-validation">
                  <div class="form-group mb-3">
                    <div class="row">
                      <div class="col">
                        <label for="name">Nombre</label>
                        <input type="text" id="name" name="nombre" class="form-control" required/>
                        <div class="invalid-feedback">

                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="form-group mb-3">
                    <div class="row">
                      <div class="col">
                        <label for="power">Imagen URL</label>
                        <input type="text" id="power" name="imagen" class="form-control"
                               required/>
                        <div class="invalid-feedback">

                        </div>
                      </div>
                      <div class="col">
                        <label for="weight">Categoria</label>
                        <input type="text" id="weight" name="categoria" class="form-control"
                               required/>
                        <div class="invalid-feedback">

                        </div>
                      </div>

                    </div>
                  </div>
                  <div class="form-group mb-3">
                    <div class="row">
                      <div class="col">
                        <label for="health3">Descripción Corta</label>
                        <textarea name="dec1" id="health3" cols="30" rows="10" required></textarea>
                        <div class="invalid-feedback">

                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group mb-3">
                    <div class="row">
                      <div class="col">
                        <label for="height">Descripción Larga</label>
                        <textarea name="dec2" id="height" cols="30" rows="10" required></textarea>
                        <div class="invalid-feedback">

                        </div>
                      </div>
                      <input type="hidden" value="<c:out value="${param.u}"/>" name="user">
                      <input type="hidden" value="<c:out value="${param.p}"/>" name="pass">
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
  })();
  CKEDITOR.replace( 'dec2' );
  CKEDITOR.replace( 'dec1' );
</script>
</body>
</html>

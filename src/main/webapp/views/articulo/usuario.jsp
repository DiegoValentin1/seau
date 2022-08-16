<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 04/08/2022
  Time: 05:14 p. m.
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

  <title>Usuarios</title>
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

  <div class="row mt-3">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-6">
              Usuarios
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
            <th>Username</th>
            <th>Modificar</th>
            <th>Eliminar</th>
            </thead>
            <tbody>
            <c:forEach var="usuario" items="${usuarios}" varStatus="status">
              <tr>
                <td>
                  <c:out value="${status.count}"/>
                </td>
                <td>
                  <c:out value="${usuario.username}"/>
                </td>
                <td>
                  <a href="modUsu?id=${usuario.id}&username=${usuario.username}" class="btn btn-warning"><i data-feather="edit"></i></a>
                </td>
                <td>
                  <form action="delUsu" method="post" onsubmit="javascript: return Validar();">
                    <input type="hidden" name="id" value="${usuario.id}">
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


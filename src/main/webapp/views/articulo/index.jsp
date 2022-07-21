<%--
  Created by IntelliJ IDEA.
  User: gupuy
  Date: 18/07/2022
  Time: 12:47 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="row mt-5">
    <div class="col-12">

        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-6">
                        POKEMONS
                    </div>
                    <div class="col-6 text-end">
                        <a href="create-pokemon" class="btn btn-outLine-success btn-sm">
                            Registrar pokemon
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-sm table-hover">
                    <thead>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Desc1</th>
                    <th>Desc2</th>
                    <th>Categoria</th>
                    </thead>
                    <tbody>
                    <c:forEach var="articulo" items="${articulos}" varStatus="status">
                        <tr>
                            <td>
                                <c:out value="${status.count}"/>
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
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>

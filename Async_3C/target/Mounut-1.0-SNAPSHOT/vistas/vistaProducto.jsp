
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.mounut.config.Fecha"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="img/shopping-cart.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="css/estilos1.css" rel="stylesheet" type="text/css"/>
    <title>Carrito de Compras</title>
</head>
<body>
<div class="container mt-4">
    <div class="d-flex">
        <h2>Carrito</h2>
        <%
            Fecha fechaSistema = new Fecha();
        %>
        <p class="ml-auto"><%= fechaSistema.Fecha()%></p>
    </div>
    <div class="row">
        <div class="col-lg-9">
                <c: var="c" items="${Carrito}">
                    <tr class="text-center tr">
                        <td>${c.getItem()}</td>
                        <td>${c.getNombres()}
                            <img src="${c.getImagen()}" width="130" height="110">
                        </td>
                        <td>${c.getDescripcion()}</td>
                        <td>${c.getPrecioCompra()}</td>
                        <td>
                            <input type="hidden" id="item1" value="${c.getIdProducto()}">
                            <input type="number" min="1" max="10"  id="Cant" class=" form-control text-center" value="${c.getCantidad()}">
                        </td>
                        <td>${c.getSubTotal()}</td>
                        <td class="text-center">
                            <input type="hidden" id="item2" value="${c.getIdProducto()}">
                            <a id="deleteItem" href="#" class="btn"><i class="fas fa-trash-alt"></i></a>
                        </td>
                    </tr>
                </c:>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/funciones.js" type="text/javascript"></script>
</body>
</html>

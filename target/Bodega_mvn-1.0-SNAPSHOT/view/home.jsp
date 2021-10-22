<%-- 
    Document   : home
    Created on : Oct 20, 2021, 6:09:46 PM
    Author     : srf
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resource/css/materialize.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col m12">
                    <div class="card red white-text center z-depth-2">
                        <h3>Datos de Registro</h3>
                    </div>
                </div>
            </div>
            <div class="row">
            
                <div class="col m12">
                    <a href="control?action=nuevo" class="btn green z-depth-4">Nuevo Registro</a>
                    <br>
                    <table class="black responsive-table center white-text">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Codigo</th>
                                <th>Orden</th>
                                <th>Serie</th>
                                <th>Nombre</th>
                                <th>Marca</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${equipos}" var='e'>
                            <tr>
                                <td>${e.id}</td>
                                <td>${e.codigo_patrimonio}</td>
                                <td>${e.orden_compra}</td>
                                <td>${e.serie_numero}</td>
                                <td>${e.nombre_bien}</td>
                                <td>${e.marca}</td>
                                <td>${e.estadodato.estado}</td>
                                
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>

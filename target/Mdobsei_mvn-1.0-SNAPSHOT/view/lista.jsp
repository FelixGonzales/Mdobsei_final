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
        <link href="resource/css/alertify.css" rel="stylesheet" type="text/css"/>
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        
        <nav>
            <div class="nav-wrapper">
                <a href="#!" class="brand-logo center">Logo</a>
                <ul class="left hide-on-med-and-down">
                    <li><a href="controlador?action=home">Inicio</a></li>
                    <li><a href="controlador?action=listar">Equipos</a></li>
                    <li class="active"><a href="collapsible.html">....</a></li>
                </ul>
            </div>
        </nav>
       
        <div >
            <div class="row">
                <div class="col m12">
                    <div class="card red white-text center z-depth-2">
                       
                    </div>
                </div>
            </div>
            <div class="row">
            
                <div class="col m12">
                    <a href="controlador?action=nuevo" class="btn green z-depth-4">Nuevo Registro</a>
                    <br>
                    <table class="grey darken-1 responsive-table center white-text">
                        <thead>
                            <tr class="black-text">
                                <th>ID</th>
                                <th>CODIGO</th>
                                <th>ORDEN COMPRA</th>
                                <th>SERIE</th>
                                <th>EQUIPO</th>
                                <th>MARCA</th>
                                <th>ESTADO</th>
                                <th class="text-accent-1">OPCIONES</th>
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
                                <td>
                                    <a href="#" class="btn-floating btn-large red pulse" onclick="eliminarID(${e.id})"> <i class="material-icons">delete</i></a>
                                </td>
                                <td>
                                    <a href="controlador?action=editar&id=${e.id}" class="btn-floating btn-large yellow pulse" > <i class="material-icons">edit</i></a>
                                </td>
                                
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        
        <script src="resource/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="resource/js/alertify.js" type="text/javascript"></script>
     
        <script >
        function eliminarID(idE){
            alertify.confirm("Desea eliminar este registro?",
            function(){
            window.location="controlador?action=eliminar&id="+idE;
            },
            function(){
            alertify.error('Cancel');
            });
        }
        
        </script>
    </body>
</html>

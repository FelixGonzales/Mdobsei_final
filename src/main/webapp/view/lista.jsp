<%-- 
    Document   : home
    Created on : Oct 20, 2021, 6:09:46 PM
    Author     : srf
https://www.youtube.com/watch?v=1hXdRb4a0_Q
https://github.com/mikelbua/javaWebApp/blob/master/src/main/webapp/Ejemplos/js/datatable.jsp
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<%@include  file="sesiones.jsp" %>

<html>

    <%@include  file="cabecera.jsp" %>

    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">MDOBSEI</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="controlador?action=inicio">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light active" aria-current="page" href="controlador?action=listar">Equipos</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="controlador?action=reporte">Reportes</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav">
                        <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <%=nombre%> <%=apellido%>
                            </a>
                            <ul class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#"><img src="resource/img/user.png" alt="30" width="30"/></a></li>
                                
                                <li><a class="dropdown-item" href="#"><%=rol%></a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="controlador?action=salir">Salir</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="row left mt-4 mb-4">
                    <div class="col">
                        <a href="controlador?action=nuevo" class="btn btn-success">Nuevo Registro</a>
                    </div>
                </div>

                <div>
                    <%--   <table class="myTable grey darken-1 responsive-table center white-text">--%>
                    <table id="tabla" class="table table-striped row-border display compact">
                        <thead>
                            <tr class="black-text">
                                <th>ID</th>
                                <th>CODIGO</th>
                                <th>ORDEN COMPRA</th>
                                <th>SERIE</th>
                                <th>EQUIPO</th>
                                <th>MARCA</th>
                                <th>MODELO</th>
                                <th>ESTADO</th>
                                <th>DIAGNOSTICO</th>
                                <th class="text-accent-1">Eliminar</th>
                                <th class="text-accent-1">Editar</th>
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
                                    <td>${e.modelo}</td>
                                    <td>${e.estadodato.estado}</td>
                                    <td style="width: 250px;">${e.diagnostico}</td>
                                    <td class="text-center">
                                        <a href="#" class="btn-floating btn-large red pulse" onclick="eliminarID(${e.id})"> <i class="material-icons">delete</i></a>

                                    </td>
                                    <td class="text-center">
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
        <script type="text/javascript"	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"/>
        <script type="https://cdn.datatables.net/1.11.3/js/dataTables.jqueryui.min.js"/>
        
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <script src="resource/js/alertify.js" type="text/javascript"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

        <script >
                                            function eliminarID(idE) {
                                                alertify.confirm("Desea eliminar este registro?",
                                                        function () {
                                                            window.location = "controlador?action=eliminar&id=" + idE;
                                                        },
                                                        function () {
                                                            alertify.error('Cancel');
                                                        });
                                            }

        </script>

        <script>
            $(document).ready(function () {
                $('.myTable').DataTable();
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {//esperar qeu este todo el DOM(document object model) cargado y listo
                //$example == document.getElementById('example');
                $('#tabla').DataTable({
                    responsive: true,
                    language: {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla =(",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        },
                        "buttons": {
                            "copy": "Copiar",
                            "colvis": "Visibilidad"
                        }
                    }
                });
                $("select").val('10');
                $("select").addClass("browser-default");

            });
        </script>




    </body>
</html>

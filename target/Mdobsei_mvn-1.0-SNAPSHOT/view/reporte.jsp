<%-- 
    Document   : home
    Created on : Oct 25, 2021, 12:53:31 AM
    Author     : srf
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
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="controlador?action=listar">Equipos</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light active" aria-current="page"  href="controlador?action=reporte">Reportes</a>
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
        <br><br><br><br>                        <br>
        <div class="container mt-4">

            <div class="row mt-4">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <div class="card">
                        <div class="card-header bg-dark">
                            <span class="card-title">

                                <div class="row mt-3">
                                    <div class="col s3">
                                        <form action="controlador">
                                            <select id="cboEquipo" class="form-select" name="selectEquipo" onchange="this.form.submit()">
                                                <option selected>Elegir Opcion</option>
                                                <option value="SERVIDOR">Servidores</option>
                                                <option value="COMPUTADOR">Computadoras</option>
                                                <option value="LAPTOP">Laptops</option>
                                            </select>

                                            <input type=hidden name="action" value="reporte">
                                        </form>
                                    </div>
                                    <div class="col s12">
                                        <a href="#" class="btn btn-warning" onclick="alertaReporte()">Exportar</a>
                                    </div>
                                </div> 

                            </span>
                        </div>
                        <div class="card-body bg-dark">
                            <div class="row">
                                <div class="card-content white-text">
                                    
                                    <table class="table table-success">
                                        <!--                                https://www.youtube.com/watch?v=BlPFxdjAhLo-->
                                        <thead>
                                            <tr class="black-text">
                                                <th>NOMBRE DEL BIEN</th>
                                                <th>ESTADO DE EQUIPO</th>
                                                <th>TOTAL</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${reportes}" var='r'>
                                                <tr>
                                                    <td>${r.nombre_bien}</td>
                                                    <td>${r.estadodato.estado}</td>
                                                    <td>${r.total}</td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>



                            </div>

                        </div>
                        <div class="card-footer">
                            <a href="#"></a>
                        </div>
                    </div>
                </div>
            </div>







        </div>

        <script src="resource/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="resource/js/materialize.js" type="text/javascript"></script>
        <script src="resource/js/alertify.js" type="text/javascript"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>


        <script >
                                        function alertaReporte() {
                                            alertify.alert('Aviso', '<b>Reporte generado Correctamente!</b>', function () {
                                                alertify.success('Ok');
                                            });
                                        }
        </script>


    </body>
</html>

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
                <a href="#!" class="brand-logo center">MDOBSEI</a>
                <ul class="left hide-on-med-and-down">
                    <li><a href="controlador?action=inicio">Inicio</a></li>
                    <li><a href="controlador?action=listar">Equipos</a></li>
                    <li class="active"><a href="controlador?action=reporte">Reporte Estado</a></li>
                </ul>
            </div>
        </nav>
        <br><br><br><br>

        <div class="container" style="margin-top: 10px;">
           
            <div class="row col-sm-10">
                <div class="col s3">
                    <form action="controlador">
                        <select id="cboEquipo" name="selectEquipo" onchange="this.form.submit()">
                            <option disabled selected>Elegir Opcion</option>
                            <option value="SERVIDOR">Servidores</option>
                            <option value="COMPUTADOR">Computadoras</option>
                            <option value="LAPTOP">Laptops</option>
                        </select>
                        <input type=hidden name="action" value="reporte">
                    </form>
                </div>
                <div class="col s4 right">
                <a href="#" class="col-sm-10 btn green z-depth-4" onclick="alertaReporte()">Exportar</a>
                </div>
            </div>  

            <div class="row">
                <div class="col m10">
                    <div class="card teal lighten-5 darken-1">
                        <div class="card-content white-text">
                                    <span class="card-title"><script> $("#cboEquipo").val(value);</script></span>

                            <table class="darken-1 responsive-table center">
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
            </div>            
            <div class="row">

                <div class="col m12">



                </div>
            </div>
        </div>

        <script src="resource/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="resource/js/materialize.js" type="text/javascript"></script>
        <script src="resource/js/alertify.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
            $('select').formSelect();
            });
        </script>

        <script >
            function alertaReporte() {
                alertify.alert('Aviso', '<b>Reporte generado Correctamente!</b>', function () {
                    alertify.success('Ok');
                });
            }
        </script>

        
    </body>
</html>

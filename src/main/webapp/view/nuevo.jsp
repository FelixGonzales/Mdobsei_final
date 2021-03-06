<%-- 
    Document   : nuevo
    Created on : Oct 20, 2021, 10:11:54 PM
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
            <form action="control" method="POST">
            <div class="row">
                <div class="col m12">
                    <div class="card blue white-text center z-depth-2">
                        <h3>Registro de Datos<h3/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col m3"></div>
                <div class="col m3">Codigo</div>
                <div class="col m3">
                    <input type="text" name="txtCodigo" required=""/>
                </div>
            </div>
            
             <div class="row">
                <div class="col m3"></div>
                <div class="col m3">Orden Compra</div>
                <div class="col m3">
                    <input type="text" name="txtOrden" required=""/>
                </div>
            </div>
            
            <div class="row">
                <div class="col m3"></div>
                <div class="col m3">Seleccione Estado</div>
                <div class="col m3">
                    <select name="cmbEstado">
                        <option value="">Seleccionar</option>
                        <c:forEach items="${estado}" var="es">
                            <option value="${es.idestado}">${es.estado}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            
            <div class="row">
                <div class="col m3"></div>
                <div class="col m3">Fecha</div>
                <div class="col m3">
                    <input type="date" name="txtFecha" required=""/>
                </div>
            </div>
            
            <div class="row">
                <div class="col m3"></div>
                <div class="col m3">
                    <input type="submit" name="btnGu" value="Guardar" class="btn green black-text z-depth-2"/>
                </div>
            </div>
            </form>
        </div>
       
        <script src="resource/js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="resource/js/materialize.js" type="text/javascript"></script>
        <script>
             $(document).ready(function(){
                $('select').formSelect();
             });
        </script>
    </body>
</html>

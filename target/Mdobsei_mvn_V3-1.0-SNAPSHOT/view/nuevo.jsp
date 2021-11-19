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
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
         
    </head>
    <body class="indigo lighten-5">
        <nav class="white"></nav>
        <br><br><br>
            
        <div class="container white" style="min-height: 50vh; padding: 20px">
            <div class="row">
            <form action="controlador" method="POST">
            <div class="row">
                <div>
                    <div class="card grey white-text center z-depth-2">
                        <h5>FORMULARIO DE DATOS<h5/>
                    </div>
                </div>
            </div>
                <input type="hidden" value="${base.id}" name="txtID" />
            
                <div class="input-field col l4 col-m4">
                    <label for="">Codigo</label>
                    <input type="text" name="txtCodigo" value="${base.codigo_patrimonio}" required=""/>
                </div>
            
                <div class="input-field col l4 col-m4">
                <label for="">Orden Compra</label>
                     <input type="text" name="txtOrden" value="${base.orden_compra}" required=""/>
                </div>
                
                <div class="input-field col l4 col-m4">
                    <label>Serie Numero</label>
                    <input type="text" name="txtSerie" value="${base.serie_numero}" required=""/>
                </div>
                
            <div class="clearfix"></div>
           
                
            <div class="input-field col l4 col-m4">
                    <label>Equipo</label>
                    <input type="text" name="txtNombre" value="${base.nombre_bien}" required=""/>
            </div>
                
            <div class="input-field col l4 col-m4">
                    <label>Marca</label>
                    <input type="text" name="txtMarca" value="${base.marca}" required=""/>
            </div>
                
                
            <div class="input-field col l4 col-m4">
                    <label>Modelo</label>
                    <input type="text" name="txtModelo" value="${base.modelo}" required=""/>
            </div>
            
            <div class="clearfix"></div>
                       
            <div class="input-field col l4 col-m4">
                    
                    <select name="cmbEstado">
                            <option value="">Seleccionar Estado</option>
                        <c:forEach items="${estado}" var="es">
                            <c:choose>
                                <c:when test="${es.idestado == base.estadodato.idestado}">
                                     <option value="${es.idestado}" selected="">${es.estado}</option>
                                </c:when>
                                <c:otherwise>
                                     <option value="${es.idestado}">${es.estado}</option>
                                </c:otherwise>
                            </c:choose>
                           
                        </c:forEach>
                    </select>
            </div>
                
            <div class="input-field col l4 col-m4">
                    <label>Diagnostico</label>
                    <input type="text" name="txtDiagnostico" value="${base.diagnostico}" required=""/>
            </div>
            
            <div class="input-field col l4 col-m4">
                    <input type="date" name="txtFecha" required=""/>
            </div>
            
            <div class="clearfix"></div>
           
            <br><br>
            
            <div class="row">
                <div class="col m12 right-align">
                    
                    <button class="btn waves-effect waves-light" type="submit" name="btnGu">Guardar Datos
                        <i class="material-icons right">save</i>
                    </button>
                    <a href="controlador?action=listar" class="btn waves-effect waves-light"> Cancelar
                    <i class="material-icons right">cancel</i>
                    </a>
                    
                
                </div>
                
                
            </div>
            </form>
            </div>
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

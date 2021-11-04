<%-- 
    Document   : login2
    Created on : Oct 27, 2021, 8:27:08 PM
    Author     : srf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resource/css/materialize.css">
       
    </head>
    <body>
    <container>
        <form action="controlador?action=validar" method="POST" style="margin: auto; width: 50%">
            <div class="card red z-depth-3 center-align" style="border-radius:2em">
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">Usuario</div>
                    <div class="col m3">
                        <input type="text" name="txtUser" placeholder="Usuario" required="">
                        ${msjU}
                    </div>
                    <div class="col m3"></div>
                </div>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m3">Contraseña</div>
                    <div class="col m3">
                        <input type="password" name="txtPass" required="">
                    </div>
                    <div class="col m3"></div>
                </div>
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m6">
                        <input type="submit" name="txtBtn" value="Ingresar" class="btn btn-flat btn-block white-text z-depth-3">
                    </div>
                    <div class="col m3"></div>
                </div>
            </div>
        </form>
    </container>
    </body>
</html>

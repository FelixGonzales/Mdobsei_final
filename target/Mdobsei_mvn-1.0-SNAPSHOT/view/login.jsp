<%-- 
    Document   : login
    Created on : Oct 26, 2021, 8:48:23 PM
    Author     : srf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        
        
        <title>MDOBSEI</title>
    </head>
    <body>
         <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body ">
                    <form class="form-sign" action="validar" method="POST">
                        <div class="form-group text-center">
                            <h3> Login </h3>
                            <img src="img/usuario2.png" alt="70" width="170"/>
                        </div>
                        
                        <div class="form-group text-center">
                            <label> Bienvenido al Sistema MDOBSEI</label>
                        </div>
                        
                        <div class="form-group">
                             <label>Usuario:</label>
                             <input type="text" name="txtuser" placeholder="Usuario" class="form-control"/>
                        </div>
                        
                         <div class="form-group">
                             <label>Clave:</label>
                             <input type="password" name="txtpass" placeholder="Contraseña" class="form-control"/>
                        </div>
                        
                        <div class="boton-container">
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block"/>
                        </div>
                    </form>
            
                </div>
            
            </div>
         </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </body>
</html>

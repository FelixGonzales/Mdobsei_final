<%-- 
    Document   : index
    Created on : Nov 3, 2021, 3:23:01 PM
    Author     : srf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
            <link href="resource/css/materialize.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="resource/css/login.css">
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        <div class="main">
            <div class="col s3 m6">
                <form action="ControladorLogin" method="POST">
                    <div class="card horizontal">
                        <div class="card-image cardLogo">
                            <h5 class="header center">LOGIN</h5>
                            <img src="" class="logo">
                        </div>
                        <div class="card-stacked">
                            <div class="card-content">
                                <p class="red-text">${msjU}</p>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">contact_mail</i>
                                    <input type="text" name="email" class="validate" placeholder="Email">
                                </div>
                                
                                <div class="input-field col s12">
                                    <i class="material-icons prefix">lock</i>
                                    <input type="password" name="password" class="validate" placeholder="Password">
                                    <p class="red-text">${msjP}</p>
                                </div>
                                
                            </div>
                                
                            <div class="card-action right">
                                   <p class="red-text">${msjT}</p>
                                <button type="submit" class="btn" name="accion" value="Ingresar">Iniciar Sesion</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>

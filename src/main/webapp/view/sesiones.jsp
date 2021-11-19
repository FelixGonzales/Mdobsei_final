<%
    HttpSession sesion_actual = request.getSession(true);
    String nombre= (String)sesion_actual.getAttribute("NOMBRE");
    String apellido= (String)sesion_actual.getAttribute("APELLIDO");
    String usuario= (String)sesion_actual.getAttribute("usuario");
    
    String rol= (String)sesion_actual.getAttribute("ROL");
    
    if (nombre==null && apellido==null){
        response.sendRedirect("index.jsp");
    }
%>
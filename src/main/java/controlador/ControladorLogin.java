package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;
import modelo.usuarioDAO;

/**
 *
 * @author srf
 */
@WebServlet(name = "ControladorLogin", urlPatterns = {"/ControladorLogin"})
public class ControladorLogin extends HttpServlet {
   
    usuarioDAO usuarioDAO; //aumentado
    HttpSession session; //aumentado
    
    public ControladorLogin() {
        super();
         usuarioDAO = new usuarioDAO();//aumentado
    }

     private RequestDispatcher dis;

    protected void doOptions(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("login")) {
            request.getRequestDispatcher("view/login.jsp").forward(request, response);

        } else if (accion != null && accion.equalsIgnoreCase("Ingresar")) {
            //request.getRequestDispatcher("controlador?accion=inicio").forward(request, response);
            //-------------------------------------------------------------------------------

            Usuario us = new Usuario();
            us.setUsuario(request.getParameter("email"));
            us.setPass(request.getParameter("password"));
            try {
                if (usuarioDAO.validarUser(us)) {
                    if (usuarioDAO.validarPass(us)) {
                        if (usuarioDAO.validarTodo(us)) {
                            session = request.getSession(true);
                           
                            Usuario base = usuarioDAO.llenarUser(us);
                            session.setAttribute("NOMBRE", base.getPersona().getNombre());
                            session.setAttribute("APELLIDO", base.getPersona().getApellido());
                            session.setAttribute("ROL", base.getPersona().getRol().getRol());
                            session.setAttribute("usuario", base.getPersona().getUser());
                           
                           
                            //request.setAttribute("base", suarioDAO.llenarUser(us));
                            dis = request.getRequestDispatcher("view/home.jsp");
                            dis.forward(request, response);
                        } else {
                            request.setAttribute("msjT", "Sus Credenciales no coinciden");
                            dis = request.getRequestDispatcher("view/login.jsp");
                            dis.forward(request, response);
                        }
                    } else {
                        request.setAttribute("msjP", "Su cuenta o password es incorrecto");
                        dis = request.getRequestDispatcher("view/login.jsp");
                        dis.forward(request, response);
                    }

                } else {
                    request.setAttribute("msjU", "El nombre de usuario no existe");
                    dis = request.getRequestDispatcher("view/login.jsp");
                    dis.forward(request, response);
                }
            } catch (Exception e) {
            }

            //-------------------------------------------------------------------------------
//            request.getRequestDispatcher("view/home.jsp").forward(request, response);
//
//        } else {
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doOptions(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doOptions(request, response);
    }

}

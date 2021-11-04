package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;
import model.usuarioDAO;

@WebServlet(name = "validar", urlPatterns = {"/validar"})
public class validar extends HttpServlet {
    
    private RequestDispatcher dis;
    
    
    usuarioDAO usuarioDAO;
    public validar(){
        super();
        usuarioDAO=new usuarioDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
//         String ruta="";
//         String action = request.getParameter("action");
//         switch (action){
//             case "login":
//                 ruta= "view/login2.jsp";
//                 this.login(request, response, ruta);
//                 break;
//             case "validar":
//                 ruta= "view/home2.jsp";
//                 //ruta="controlador?action=inicio";
//                 this.validar(request, response, ruta);
//                 break;
         }
    }
    
//     protected void validar(HttpServletRequest request, HttpServletResponse response, String ruta)
//            throws ServletException, IOException {
//       
//         Usuario us=new Usuario();
//         us.setUsuario(request.getParameter("txtUser"));
//         us.setPass(request.getParameter("txtPass"));
//         try {
//             if(usuarioDAO.validarUser(us)){
//                dis= request.getRequestDispatcher(ruta);
//                dis.forward(request, response);
//             }else{
//                 request.setAttribute("msjU", "Este Usuario no esta registrado");
//                 dis=request.getRequestDispatcher("view/login2.jps");
//             }
//         } catch (Exception e) {
//         }
//    }
    
        
//    protected void login(HttpServletRequest request, HttpServletResponse response, String ruta)
//            throws ServletException, IOException {
//       
//        dis= request.getRequestDispatcher(ruta);
//        dis.forward(request, response);
//    }
//
//   
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

//}


package controlador;

import model.estadoDAO;
import model.equipoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author srf
 */
@WebServlet(name = "controlador", urlPatterns = {"/controlador"})
public class controlador extends HttpServlet {
  
    private RequestDispatcher dis;
    
    usuarioDAO usuarioDAO;
    equipoDAO eDAO;
    estadoDAO tDAO;
    
    public controlador(){
        super();
        eDAO = new equipoDAO();
        tDAO= new estadoDAO();
        usuarioDAO=new usuarioDAO();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            String action = request.getParameter("action");
            String ruta = "";
            
            if(action.equalsIgnoreCase("inicio")){
                ruta="view/home.jsp";
                //ruta="home.jsp";
                try {
                   // request.setAttribute("equipos", eDAO.llenarData());
                                       
                } catch (Exception e) {
                    e.printStackTrace();
                }
//            }else if(action.equalsIgnoreCase("login")){
//                 ruta= "view/login2.jsp";
//                 this.login(request, response, ruta);
//                 
//            }else if(action.equalsIgnoreCase("validar")){
//                 //
//                 ruta= "view/home.jsp";
//                 this.validar(request, response, ruta);
//                
            }else if(action.equalsIgnoreCase("listar")){
                ruta="view/lista.jsp";
                try {
                    request.setAttribute("equipos", eDAO.llenarData());
                                       
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if(action.equalsIgnoreCase("nuevo")){
                ruta="view/nuevo.jsp";
                try {
                    request.setAttribute("estado", tDAO.llenarEstado());
                                       
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if(action.equalsIgnoreCase("eliminar")){
                ruta="view/home.jsp";
                int idEliminar = Integer.parseInt(request.getParameter("id"));
               
                try {
                    request.setAttribute("equipos", eDAO.llenarData());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else if(action.equalsIgnoreCase("editar")){
                ruta="view/nuevo.jsp";
               int idEd = Integer.parseInt(request.getParameter("id"));
               
                try {
                    request.setAttribute("base", eDAO.llenarPorId(idEd));
                    request.setAttribute("estado", tDAO.llenarEstado());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            RequestDispatcher dis= request.getRequestDispatcher(ruta);
            dis.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            equipo eq= new equipo();
            estado es= new estado();
            String txtID= request.getParameter("txtID");
            
            eq.setCodigo_patrimonio(request.getParameter("txtCodigo"));
            eq.setOrden_compra(request.getParameter("txtOrden"));
            eq.setSerie_numero(request.getParameter("txtSerie"));
            eq.setNombre_bien(request.getParameter("txtNombre"));
            eq.setMarca(request.getParameter("txtMarca"));
         //   es.setIdestado(Integer.parseInt(request.getParameter("cmbEstado")));
            eq.setEstadodato(es);
            
            if (txtID == null || txtID.isEmpty()) {
                try {
                    eDAO.Insertar(eq);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                   try {
                    int idActualizar=Integer.parseInt(txtID);
                    eq.setId(idActualizar);
                    eDAO.Actualizar(eq);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            response.sendRedirect(request.getContextPath()+"/controlador?action=listar");
        
    }

   

    protected void validar(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
       
         Usuario us=new Usuario();
         us.setUsuario(request.getParameter("txtUser"));
         us.setPass(request.getParameter("txtPass"));
         try {
             if(usuarioDAO.validarUser(us)){
                dis= request.getRequestDispatcher(ruta);
                dis.forward(request, response);
             }else{
                 request.setAttribute("msjU", "Este Usuario no esta registrado");
                 dis=request.getRequestDispatcher("view/login2.jps");
                 dis.forward(request, response);
             }
         } catch (Exception e) {
         }
    }
    
        
    protected void login(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {
       
        dis= request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
}

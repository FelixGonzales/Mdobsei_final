/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;

/**
 *
 * @author srf
 */
@WebServlet(name = "control", urlPatterns = {"/control"})
public class control extends HttpServlet {
  
    equipoDAO eDAO;
    estadoDAO tDAO;
    
    public control(){
        super();
        eDAO = new equipoDAO();
        tDAO= new estadoDAO();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
            String action = request.getParameter("action");
            String ruta = "";
            
            if(action.equalsIgnoreCase("inicio")){
                ruta="view/home.jsp";
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
            }
            RequestDispatcher dis= request.getRequestDispatcher(ruta);
            dis.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   

}

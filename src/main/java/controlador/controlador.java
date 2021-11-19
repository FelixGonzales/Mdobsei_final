package controlador;

import modelo.estado;
import modelo.equipoDAO;
import modelo.estadoDAO;
import modelo.usuarioDAO;
import modelo.equipo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    HttpSession session;

    public controlador() {
        super();
        eDAO = new equipoDAO();
        tDAO = new estadoDAO();
        usuarioDAO = new usuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String ruta = "";

        switch (action) {
            case "inicio":
                ruta = "view/home.jsp";
                break;

            case "listar":
                ruta = "view/lista.jsp";
                try {
                    request.setAttribute("equipos", eDAO.llenarData());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "nuevo":
                ruta = "view/nuevo.jsp";
                try {
                    request.setAttribute("estado", tDAO.llenarEstado());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "editar":
                ruta = "view/nuevo.jsp";
                int idEd = Integer.parseInt(request.getParameter("id"));
                try {
                    request.setAttribute("base", eDAO.llenarPorId(idEd));
                    request.setAttribute("estado", tDAO.llenarEstado());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "eliminar":
                ruta = "view/lista.jsp";
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                try {
                    eDAO.Eliminar(idEliminar);
                    request.setAttribute("equipos", eDAO.llenarData());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "reporte":
                ruta = "view/reporte.jsp";
                String equipito = request.getParameter("selectEquipo");
                try {
                    request.setAttribute("reportes", eDAO.reporteEquipos(equipito));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "salir":
                this.Salir(request, response);
                break;
                }

        RequestDispatcher dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        equipo eq = new equipo();
        estado es = new estado();
        String txtID = request.getParameter("txtID");

        eq.setCodigo_patrimonio(request.getParameter("txtCodigo"));
        eq.setOrden_compra(request.getParameter("txtOrden"));
        eq.setSerie_numero(request.getParameter("txtSerie"));
        eq.setNombre_bien(request.getParameter("txtNombre"));
        eq.setMarca(request.getParameter("txtMarca"));
        eq.setModelo(request.getParameter("txtModelo"));
        es.setIdestado(Integer.parseInt(request.getParameter("cmbEstado")));
        eq.setDiagnostico(request.getParameter("txtDiagnostico"));
        eq.setEstadodato(es);

        if (txtID == null || txtID.isEmpty()) {
            try {
                eDAO.Insertar(eq);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            try {
                int idActualizar = Integer.parseInt(txtID);
                eq.setId(idActualizar);
                eDAO.Actualizar(eq);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/controlador?action=listar");

    }

    protected void login(HttpServletRequest request, HttpServletResponse response, String ruta)
            throws ServletException, IOException {

        dis = request.getRequestDispatcher(ruta);
        dis.forward(request, response);
    }
    
    protected void Salir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(session != null){
            session = request.getSession(false);
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}

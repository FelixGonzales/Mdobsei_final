
package modelo;

import configuracion.conexion;

/**
 *
 * @author srf
 */
public class testing {
    public static void main(String[] args) {
        try {
            conexion c = new conexion();
            usuarioDAO u = new usuarioDAO();
            
          //  u.validarTodo("admin","admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

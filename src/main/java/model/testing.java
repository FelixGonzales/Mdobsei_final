
package model;

import config.conexion;

/**
 *
 * @author srf
 */
public class testing {
    public static void main(String[] args) {
        try {
            conexion c = new conexion();
            usuarioDAO_old u = new usuarioDAO_old();
            //c.Conectar();
            u.validar("admin", "admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

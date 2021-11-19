package modelo;

import configuracion.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class usuarioDAO extends conexion{
    
    public boolean validarUser(Usuario us) throws Exception {
        boolean pase=false;
        try {
            this.Conectar();
            String sql="SELECT count(usuario) contar FROM tbluser WHERE usuario=?";
            PreparedStatement smt=this.getCnx().prepareStatement(sql);
            smt.setString(1, us.getUsuario());
            ResultSet rs = smt.executeQuery();
            int contador=0;
            while(rs.next()){
                contador=rs.getInt("contar");
            }
            if(contador>0){
                
                pase=true;
            }
        } catch (Exception e) {
            System.out.println("ERROR"+ e.getMessage());
        }finally{
            this.Desconectar();
        }
        return pase;
    }
    
    
    public boolean validarPass(Usuario us) throws Exception {
        boolean pase = false;
        try {
            this.Conectar();
            String query = "select count(pass) conta from tbluser where pass = ?";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            smt.setString(1, us.getPass());
            ResultSet rt = smt.executeQuery();
            int contador = 0;
            while (rt.next()) {
                contador = rt.getInt("conta");
            }
            if (contador > 0) {
                pase = true;
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
            e.printStackTrace();
        } finally {
            this.Desconectar();
        }
        return pase;
    }
     
     
     
    public boolean validarTodo(Usuario us) throws Exception {
        boolean pase = false;
        try {
            this.Conectar();
            String query = "select count(*) conta from tbluser where pass = ? and usuario=?";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            smt.setString(1, us.getPass());
            smt.setString(2, us.getUsuario());
            ResultSet rt = smt.executeQuery();
            int contador = 0;
            while (rt.next()) {
                contador = rt.getInt("conta");
            }
            if (contador > 0) {
                pase = true;
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
            e.printStackTrace();
        } finally {
            this.Desconectar();
        }
        return pase;
    }

    public Usuario llenarUser(Usuario us) throws Exception {
        Usuario usu = new Usuario();
        try {
            this.Conectar();
            String query = "select p.nombre,p.apellido,u.usuario,r.rol "
                    + "from tbluser u "
                    + "inner join tblpersona p on u.idpersona = p.idpersona "
                    + "inner join tblrol r on p.idrol = r.idrol "
                    + "where u.usuario = ? and u.pass = ?";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            smt.setString(1, us.getUsuario());
            smt.setString(2, us.getPass());
            ResultSet rt = smt.executeQuery();

            while (rt.next()) {
              
                Persona p = new Persona();
                Rol r = new Rol();
                String user=rt.getString("u.usuario");            
                p.setNombre(rt.getString("p.nombre"));
                p.setApellido(rt.getString("p.apellido"));
                p.setUser(user);
                r.setRol(rt.getString("r.rol"));
                p.setRol(r);
                usu.setPersona(p);
            }

        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
            e.printStackTrace();
        } finally {
            this.Desconectar();
        }
        return usu;
    }
    
         
}

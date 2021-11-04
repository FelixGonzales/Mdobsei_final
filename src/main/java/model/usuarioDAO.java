package model;

import config.conexion;
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
}

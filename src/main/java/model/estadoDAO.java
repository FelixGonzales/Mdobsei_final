
package model;
import config.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.estado;

public class estadoDAO extends conexion{

    public ArrayList<estado> llenarEstado() throws Exception{
        
        ArrayList<estado> lista= new ArrayList<estado>();
        try {
            this.Conectar();
            String query="SELECT * FROM tblestado";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                estado e = new estado();
                e.setIdestado(rt.getInt("idestado"));
                e.setEstado(rt.getString("estado"));
                lista.add(e);
            }
        } catch (Exception e) {

        }finally{
            this.Desconectar();
        }
        return lista;
    }
}

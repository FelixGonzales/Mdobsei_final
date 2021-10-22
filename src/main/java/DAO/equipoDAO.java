package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

public class equipoDAO extends conexion{
    
    public ArrayList<equipo> llenarData() throws Exception{
        
        ArrayList<equipo> lista= new ArrayList<equipo>();
        try {
            this.Conectar();
            String query="SELECT teq.id, teq.codigo_patrimonio, teq.orden_compra, teq.serie_numero, teq.nombre_bien, teq.marca, tes.estado " +
                           "FROM tblequipos teq " +
                            "INNER JOIN tblestado tes ON (tes.idestado = teq.idestado)";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                equipo teq = new equipo();
                estado tes = new estado();
                teq.setId(rt.getInt("teq.id"));
                teq.setCodigo_patrimonio(rt.getString("teq.codigo_patrimonio"));
                teq.setOrden_compra(rt.getString("teq.orden_compra"));
                teq.setSerie_numero(rt.getString("teq.serie_numero"));
                teq.setNombre_bien(rt.getString("teq.nombre_bien"));
                teq.setMarca(rt.getString("teq.marca"));
                tes.setEstado(rt.getString("tes.estado"));
                teq.setEstadodato(tes);
                lista.add(teq);
            }
        } catch (Exception e) {

        }finally{
            this.Desconectar();
        }
        return lista;
    }
}

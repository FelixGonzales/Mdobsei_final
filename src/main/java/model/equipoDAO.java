package model;
import config.conexion;
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
    
    public void Insertar(equipo eq) throws Exception{
        try {
            this.Conectar();
            String sql="INSERT INTO tblequipos (codigo_patrimonio, orden_compra, serie_numero, nombre_bien, marca, idestado) values (?,?,?,?,?,?)";
             PreparedStatement smt = this.getCnx().prepareStatement(sql);
             smt.setString(1, eq.getCodigo_patrimonio());
             smt.setString(2, eq.getOrden_compra());
             smt.setString(3, eq.getSerie_numero());
             smt.setString(4, eq.getNombre_bien());
             smt.setString(5, eq.getMarca());
             smt.setInt(6, eq.getEstadodato().getIdestado());
             smt.executeUpdate();
             
        } catch (Exception e) {
            throw e;
        }finally{
            this.Desconectar();
        }
    
    }
    
    public void Eliminar(int id) throws Exception{
        try {
            this.Conectar();
            String sql="DELETE FROM tblequipos where id = ?";
            PreparedStatement smt = this.getCnx().prepareStatement(sql);
             smt.setInt(1, id);
             smt.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            this.Desconectar();
        }
    }
    
    public equipo llenarPorId(int id) throws Exception{
        
        equipo eq= new equipo();
        try {
            this.Conectar();
            String query="SELECT * FROM tblequipos where id = ?";
            PreparedStatement smt = this.getCnx().prepareStatement(query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                estado es = new estado();
                eq.setId(rt.getInt("id"));
                eq.setCodigo_patrimonio(rt.getString("codigo_patrimonio"));
                eq.setOrden_compra(rt.getString("orden_compra"));
                eq.setSerie_numero(rt.getString("serie_numero"));
                eq.setNombre_bien(rt.getString("nombre_bien"));
                eq.setMarca(rt.getString("marca"));
                es.setIdestado(rt.getInt("idestado"));
                eq.setEstadodato(es);
               
            }
        } catch (Exception e) {

        }finally{
            this.Desconectar();
        }
        return eq;
    }
    
    public void Actualizar (equipo eq) throws Exception{
        try {
            this.Conectar();
            String sql ="UPDATE tblequipos set codigo_patrimonio=?, orden_compra=?, serie_numero=?, nombre_bien=?, marca=?, idestado=? where id=?";
             PreparedStatement smt = this.getCnx().prepareStatement(sql);
             smt.setString(1, eq.getCodigo_patrimonio());
             smt.setString(2, eq.getOrden_compra());
             smt.setString(3, eq.getSerie_numero());
             smt.setString(4, eq.getNombre_bien());
             smt.setString(5, eq.getMarca());
             smt.setInt(6, eq.getEstadodato().getIdestado());
             smt.setInt(7, eq.getId());
             smt.executeUpdate();
        } catch (Exception e) {
            throw e;
        }finally{
            this.Desconectar();
        }
    }
}

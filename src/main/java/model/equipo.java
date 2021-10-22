package model;

public class equipo {
    
    private int id; 
    private String codigo_patrimonio;
    private String orden_compra;
    private String serie_numero;
    private String nombre_bien;
    private String marca; 
    private estado estadodato;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo_patrimonio() {
        return codigo_patrimonio;
    }

    public void setCodigo_patrimonio(String codigo_patrimonio) {
        this.codigo_patrimonio = codigo_patrimonio;
    }

    public String getOrden_compra() {
        return orden_compra;
    }

    public void setOrden_compra(String orden_compra) {
        this.orden_compra = orden_compra;
    }

    public String getSerie_numero() {
        return serie_numero;
    }

    public void setSerie_numero(String serie_numero) {
        this.serie_numero = serie_numero;
    }

    public String getNombre_bien() {
        return nombre_bien;
    }

    public void setNombre_bien(String nombre_bien) {
        this.nombre_bien = nombre_bien;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public estado getEstadodato() {
        return estadodato;
    }

    public void setEstadodato(estado estadodato) {
        this.estadodato = estadodato;
    }
    
    
}

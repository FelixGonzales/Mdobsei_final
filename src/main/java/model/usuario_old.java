package model;

import java.sql.Date;

public class usuario_old {
    
    private int idusuario;
    private String username;
    private String password;
    private int tipo;
    private Date last_session;

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public Date getLast_session() {
        return last_session;
    }

    public void setLast_session(Date last_session) {
        this.last_session = last_session;
    }

    
    
}

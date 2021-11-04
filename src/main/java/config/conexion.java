package config;
import java.sql.DriverManager;
import java.sql.Connection;

public class conexion {

    private static String bd= "mdobsei";
    private static String user= "root";
    private static String pass= "";
    private static String ruta= "jdbc:mysql://localhost/"+bd;
     
    private Connection cnx;

    public Connection getCnx() {
        return cnx;
    }

    public void setCnx(Connection cnx) {
        this.cnx = cnx;
    }
    
    public void Conectar() throws Exception{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.cnx=DriverManager.getConnection(ruta,user,pass);
            if(this.cnx !=null){
                System.out.println("Conexion EXITOSA");
            }else{
                System.out.println("FALLOOOOOOOOOOOO");
            }
                
        } catch (Exception e) {
            throw e;
        }
    }
    
    public void Desconectar() throws Exception{
        try {
            this.cnx.close();
        } catch (Exception e) {
        }
    }
            
}

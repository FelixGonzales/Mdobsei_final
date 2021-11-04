
package model;
import config.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class usuarioDAO_old {


        conexion cn=new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public usuario_old validar(String user, String pass){
        usuario_old us=new usuario_old();
        
        String sql="Select * from usuarios where username=? and password=?";
        try {
            cn.Conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1,user);
            ps.setString(2,pass);
            rs=ps.executeQuery();
            
            while(rs.next()){
                //se formatea last_session para Date
                    //se actualiza el último inicio de sesión
                    Date date = new Date();
                    DateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                    
                us.setUsername(rs.getString("username"));
                us.setPassword(rs.getString("password"));
                 
                 //se asigna a la sesión al usuario_old logeado
            //       HttpSession session = request.getSession(true);
            //       session.setAttribute("sesUsername", usr);

                 //mandamos al usuario_old a index.jsp
            //       response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
        }catch (Exception e){
            
        }
           return us;     
    }
        
}

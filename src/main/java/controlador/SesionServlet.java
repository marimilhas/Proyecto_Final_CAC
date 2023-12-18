package controlador;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ConexionDB;

@WebServlet("/vistas/SesionServlet")
public class SesionServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (autenticarUsuario(username, password)){
            response.sendRedirect("gestionarOradores.jsp");
        } else {
            request.setAttribute("error","Nombre de usuario o contraseña inválidos");
            request.getRequestDispatcher("iniciarSesion.jsp").forward(request, response);
        }
    }
    
    private boolean autenticarUsuario(String username, String password){
        String SQL = "SELECT * FROM login WHERE usuario = ? AND contraseña = ?";
        
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareStatement(SQL);){
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }  
}

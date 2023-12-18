package controlador;

import dao.OradoresDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Orador;

@WebServlet("/vistas/GestionOradoresServlet")
public class GestionOradoresServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operacion = request.getParameter("operacion");
        OradoresDAO oradoresDAO = new OradoresDAO();
        
        int idOrador= Integer.parseInt(request.getParameter("id"));
        
        switch (operacion) {
            case "actualizar":
                Orador orador = oradoresDAO.obtenerOrador(idOrador);
                request.setAttribute("orador", orador);
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                break;
            
            case "confirmarActualizacion":
                Orador oradorActualizado = new Orador();
                oradorActualizado.setIdOrador(idOrador);
                oradorActualizado.setNombre(request.getParameter("nombre"));
                oradorActualizado.setApellido(request.getParameter("apellido"));
                oradorActualizado.setTema(request.getParameter("tema"));
                oradorActualizado.setFechaAlta(java.sql.Date.valueOf(request.getParameter("fechaAlta")));
                
                oradoresDAO.actualizarOrador(oradorActualizado);
                response.sendRedirect("gestionarOradores.jsp");
                break;
            
            case "eliminar":
                oradoresDAO.eliminarOrador(idOrador);
                response.sendRedirect("gestionarOradores.jsp");
                break;
                
            default:
                response.sendRedirect("gestionarOradores.jsp");
                break;             
        }
    }
}

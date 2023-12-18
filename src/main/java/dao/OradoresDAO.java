package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Orador;
import util.ConexionDB;

public class OradoresDAO {
    public void agregarOrador(Orador orador){
        String SQL = "INSERT INTO oradores(nombre, apellido, tema, fecha_alta) VALUES (?, ?, ?, ?)";
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareCall(SQL);){
            
            pstmt.setString(1, orador.getNombre());
            pstmt.setString(2, orador.getApellido());
            pstmt.setString(3, orador.getTema());
            pstmt.setDate(4, orador.getFechaAlta());
            pstmt.executeUpdate();
                
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    
    public List<Orador> obtenerOradores() {
        List<Orador> oradores = new ArrayList<>();
        String SQL = "SELECT * FROM oradores";
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Orador orador = new Orador();
                orador.setIdOrador(rs.getInt("id_orador"));
                orador.setNombre(rs.getString("nombre"));
                orador.setApellido(rs.getString("apellido"));
                orador.setTema(rs.getString("tema"));
                orador.setFechaAlta(rs.getDate("fecha_alta"));
                oradores.add(orador);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return oradores;
    }
        
    public Orador obtenerOrador(int id) {
        String SQL = "SELECT * FROM oradores WHERE id_orador = ?";
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareStatement(SQL)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Orador orador = new Orador();
                orador.setIdOrador(rs.getInt("id_orador"));
                orador.setNombre(rs.getString("nombre"));
                orador.setApellido(rs.getString("apellido"));
                orador.setTema(rs.getString("tema"));
                orador.setFechaAlta(rs.getDate("fecha_alta"));
                return orador;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void actualizarOrador(Orador orador) {
        String SQL = "UPDATE oradores SET nombre = ?, apellido = ?, tema = ?, fecha_alta = ? WHERE id_orador = ?";
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareStatement(SQL)) {

            pstmt.setString(1, orador.getNombre());
            pstmt.setString(2, orador.getApellido());
            pstmt.setString(3, orador.getTema());
            pstmt.setDate(4, orador.getFechaAlta());
            pstmt.setInt(5, orador.getIdOrador());
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarOrador(int id) {
        String SQL = "DELETE FROM oradores WHERE id_orador = ?";
        try (Connection conexion = ConexionDB.getConnection();
             PreparedStatement pstmt = conexion.prepareStatement(SQL)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


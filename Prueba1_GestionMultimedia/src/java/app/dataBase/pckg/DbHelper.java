
package app.dataBase.pckg;

import app.models.pckg.Multimedia;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DbHelper {

    Connection conn;

    public DbHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/media_db", "root", "Admin$1234");
            if (conn == null) {
                throw new SQLException("No se pudo establecer la conexión con la base de datos.");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: Driver de MySQL no encontrado.", ex);
            throw new SQLException("Error al cargar el driver MySQL.", ex);

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al conectar con la base de datos.", ex);
            throw ex;
        }
    }

    public void close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
    }
    
    public boolean guardarMultimedia(Multimedia md) throws SQLException {
        if (conn == null) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: La conexión a la base de datos es NULL.");
            return false;
        }

        try {
            PreparedStatement predStatement
                    = conn.prepareStatement(
                            "INSERT INTO multimedia (titulo, descripcion, url, tipo) VALUES (?, ?, ?, ?)");

            predStatement.setString(1, md.getTitulo());
            predStatement.setString(2, md.getDescripcion());
            predStatement.setString(3, md.getUrl());
            predStatement.setString(4, md.getTipo());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al guardar el usuario.", ex);
            return false;
        }
    }
    
    public ResultSet getMultimedias() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM multimedia;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
    
    public ResultSet getMultimedias(String tipo) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM multimedia WHERE tipo=?;");
            predStatement.setString(1, tipo);
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
    
    public ResultSet getMultimedia(int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM multimedia WHERE id=?;");
            predStatement.setInt(1, id);
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
    
    public boolean actualizarMultimedia(Multimedia md) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE multimedia SET titulo = ?, descripcion = ?, url = ?, tipo = ? WHERE id = ?;");

            predStatement.setString(1, md.getTitulo());
            predStatement.setString(2, md.getDescripcion());
            predStatement.setString(3, md.getUrl());
            predStatement.setString(4, md.getTipo());
            predStatement.setInt(5, md.getId());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }
    
    public boolean eliminarMultimedia(int id) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("DELETE FROM multimedia WHERE id = ?;");

            predStatement.setInt(1, id);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }
}

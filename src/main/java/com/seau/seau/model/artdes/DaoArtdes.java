package com.seau.seau.model.artdes;

import com.seau.seau.model.administrador.BeanAdministrador;
import com.seau.seau.model.administrador.DaoAdministrador;
import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoArtdes {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanArtdes> findAll(){
        List<BeanArtdes> artdeses = new ArrayList<>();
        BeanArtdes artdes = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM artdes;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                artdes = new BeanArtdes();
                artdes.setId(rs.getLong("id"));
                artdes.setFk_articulo(rs.getLong("fk_articulo"));
                artdes.setFk_descuento(rs.getLong("fk_descuento"));

                artdeses.add(artdes);
                System.out.println("Hola desde artdes");
                System.out.println(artdes.getId());
            }
        } catch (SQLException e){
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return artdeses;
    }
    public List<BeanArtdes> findAll2(Long id){
        List<BeanArtdes> artdeses = new ArrayList<>();
        BeanArtdes artdes = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM artdes WHERE fk_descuento = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1,id);
            rs = pstm.executeQuery();
            while (rs.next()){
                artdes = new BeanArtdes();
                artdes.setId(rs.getLong("id"));
                artdes.setFk_articulo(rs.getLong("fk_articulo"));
                artdes.setFk_descuento(rs.getLong("fk_descuento"));

                artdeses.add(artdes);
                System.out.println("Hola desde artdes fiAll2");
                System.out.println(artdes.getId());
            }
        } catch (SQLException e){
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return artdeses;
    }

    public void closeConnections(){
        try {
            if (conn != null){
                conn.close();
            }
            if (pstm != null){
                pstm.close();
            }if (cstm != null){
                cstm.close();
            }
            if (rs != null){
                rs.close();
            }

        }catch (SQLException e){

        }
    }

    public boolean save(BeanArtdes artdes){
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "INSERT INTO artdes" + "(fk_articulo, fk_descuento)" + "VALUES (?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1,artdes.getFk_articulo());
            pstm.setLong(2,artdes.getFk_descuento());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }

    public boolean update(BeanArtdes artdes) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "UPDATE artdes SET fk_articulo = ? WHERE id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, artdes.getFk_articulo());
            pstm.setLong(2, artdes.getId());
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean delete(Long id) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM artdes WHERE id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }
    public boolean deleteTodo(Long id) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM artdes WHERE fk_descuento = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoArtdes.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }
}

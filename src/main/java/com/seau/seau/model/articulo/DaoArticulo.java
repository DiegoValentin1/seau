package com.seau.seau.model.articulo;

import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoArticulo {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanArticulo> findAll(){
        List<BeanArticulo> articulos = new ArrayList<>();
        BeanArticulo articulo = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM articulo;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                articulo = new BeanArticulo();
                articulo.setID(rs.getLong("ID"));
                articulo.setNombre(rs.getString("nombre"));
                articulo.setDec1(rs.getString("dec1"));
                articulo.setDec2(rs.getString("dec2"));
                articulo.setCategoria(rs.getString("categoria"));
                articulo.setImagen(rs.getString("imagen"));
                articulos.add(articulo);
                System.out.println("Hola desde Articulos");
            }
        } catch (SQLException e){
            Logger.getLogger(DaoArticulo.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return articulos;
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


    public boolean save(BeanArticulo articulo){
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "INSERT INTO articulo" + "(nombre, dec1, dec2, categoria, imagen)" + "VALUES (?,?,?,?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setString(1,articulo.getNombre());
            pstm.setString(2,articulo.getDec1());
            pstm.setString(3,articulo.getDec2());
            pstm.setString(4,articulo.getCategoria());
            pstm.setString(5,articulo.getImagen());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoArticulo.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }

    public boolean update(BeanArticulo articulo) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "UPDATE articulo SET nombre = ?, dec1 = ?, dec2 = ?," +
                    "categoria = ?, imagen = ? WHERE id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, articulo.getNombre());
            pstm.setString(2, articulo.getDec1());
            pstm.setString(3, articulo.getDec2());
            pstm.setString(4, articulo.getCategoria());
            pstm.setString(5, articulo.getImagen());
            pstm.setLong(6, articulo.getID());
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoArticulo.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean delete(Long ID) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM articulo WHERE ID = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, ID);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoArticulo.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }

    public List<BeanArticulo> buscar(String var) {
        List<BeanArticulo> articulos = new ArrayList<>();
        String uno="", dos="'";

        try {

            conn = new MYSQLConnection().getConnection();
            String query = "SELECT * FROM articulo WHERE nombre like '%" + var + "%'";
            pstm = conn.prepareStatement(query);

            System.out.println(pstm);
            rs = pstm.executeQuery();
            while (rs.next()){
                BeanArticulo articulo = new BeanArticulo();
                articulo.setID(rs.getLong("ID"));
                articulo.setNombre(rs.getString("nombre"));
                articulo.setDec1(rs.getString("dec1"));
                articulo.setDec2(rs.getString("dec2"));
                articulo.setCategoria(rs.getString("categoria"));
                articulo.setImagen(rs.getString("imagen"));
                System.out.println(articulo.getImagen() + "Esta es la imagen");
                articulos.add(articulo);

            }
            return articulos;
        } catch (SQLException e) {
            Logger.getLogger(DaoArticulo.class.getName())
                    .log(Level.SEVERE, "Error buscar", e);
            System.out.println(e);
            return null;
        } finally {
            closeConnections();
        }
    }
}

package com.seau.seau.model.stock;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.model.descuento.DaoDescuento;
import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoStock {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanStock> findAll(){
        List<BeanStock> stocks = new ArrayList<>();
        BeanStock stock = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM stock;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                stock = new BeanStock();
                stock.setID_stk(rs.getLong("ID_stk"));
                stock.setTalla(rs.getString("talla"));
                stock.setColor(rs.getString("color"));
                stock.setStock(rs.getLong("stock"));
                stock.setPrecio(rs.getDouble("precio"));
                stock.setFk_articulo(rs.getLong("fk_articulo"));
                stock.setImagen(rs.getString("imagen"));
                stocks.add(stock);
                System.out.println("ID STK");
                System.out.println(stock.getID_stk());
            }
        } catch (SQLException e){
            Logger.getLogger(DaoStock.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return stocks;
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


    public boolean save(BeanStock stock){
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "INSERT INTO stock" + "(talla, color, stock, precio, fk_articulo, imagen)" + "VALUES (?,?,?,?,?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setString(1,stock.getTalla());
            pstm.setString(2,stock.getColor());
            pstm.setLong(3,stock.getStock());
            pstm.setDouble(4,stock.getPrecio());
            pstm.setLong(5,stock.getFk_articulo());
            pstm.setString(6,stock.getImagen());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoStock.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }

    public boolean update(BeanStock stock) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "UPDATE stock SET talla = ?, color = ?, stock = ?," +
                    "precio = ?, fk_articulo = ?, imagen = ? WHERE ID_stk = ?";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, stock.getTalla());
            pstm.setString(2, stock.getColor());
            pstm.setLong(3, stock.getStock());
            pstm.setDouble(4, stock.getPrecio());
            pstm.setLong(5, stock.getFk_articulo());
            pstm.setString(6, stock.getImagen());
            pstm.setLong(7, stock.getID_stk());
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoStock.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean delete(Long id) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM stock WHERE ID_stk = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            System.out.println(pstm);
            return pstm.executeUpdate()  == 1;
        } catch (SQLException e) {
            System.out.println(e);
            Logger.getLogger(DaoStock.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }

    public Double min(long a){
        Double num = 0.0;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT min(precio) FROM stock where fk_articulo = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1,a);
            rs = pstm.executeQuery();
            while (rs.next()){
                num = rs.getDouble("min(precio)");
                System.out.println("Select min");
                System.out.println(num);
            }
        } catch (SQLException e){
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return num;
    }
}

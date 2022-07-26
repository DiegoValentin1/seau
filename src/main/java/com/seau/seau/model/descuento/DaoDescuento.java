package com.seau.seau.model.descuento;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoDescuento {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanDescuento> findAll(){
        List<BeanDescuento> descuentos = new ArrayList<>();
        BeanDescuento descuento = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM descuento;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                descuento = new BeanDescuento();
                descuento.setID_det(rs.getLong("ID_det"));
                descuento.setFecha_fin(rs.getDate("fecha_fin"));
                descuento.setPor_descuento(rs.getLong("por_descuento"));
                descuento.setFecha_inicio(rs.getDate("fecha_inicio"));
                descuento.setMensaje(rs.getString("mensaje"));
                descuento.setImagen(rs.getString("imagen"));
                descuentos.add(descuento);
                System.out.println("Descuento ID");
                System.out.println(descuento.getID_det());
            }
        } catch (SQLException e){
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return descuentos;
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

    public boolean save(BeanDescuento descuento){
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "INSERT INTO descuento" + "(fecha_fin, por_descuento, fecha_inicio, mensaje, imagen)" + "VALUES (?,?,?,?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setDate(1, (Date) descuento.getFecha_fin());
            pstm.setLong(2,descuento.getPor_descuento());
            pstm.setDate(3, (Date) descuento.getFecha_inicio());
            pstm.setString(4, descuento.getMensaje());
            pstm.setString(5, descuento.getImagen());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }

    public boolean update(BeanDescuento descuento) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "UPDATE descuento SET fecha_fin = ?, por_descuento = ?, fecha_inicio = ?, mensaje = ?, imagen = ? WHERE ID_det = ?";
            pstm = conn.prepareStatement(query);
            pstm.setDate(1, (Date) descuento.getFecha_fin());
            pstm.setDouble(2, descuento.getPor_descuento());
            pstm.setDate(3, (Date) descuento.getFecha_inicio());
            pstm.setString(4, descuento.getMensaje());
            pstm.setString(5, descuento.getImagen());
            pstm.setLong(6, descuento.getID_det());
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean delete(Long ID_det) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM descuento WHERE ID_det = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, ID_det);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }

    public long max(){
        long num = 0;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT max(ID_det) FROM descuento;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                num = rs.getLong("max(ID_det)");
                System.out.println("Descuento ID Max");
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

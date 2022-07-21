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
                descuento.setFk_stock(rs.getLong("fk_stock"));
                descuentos.add(descuento);
                System.out.println(descuento.getID_det());
                System.out.println(descuento.getPor_descuento());
                System.out.println("Holaaaaaaaaaaaaaaaaaaa");
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
            String query = "INSERT INTO descuento" + "(fecha_fin, por_descuento, fk_stock)" + "VALUES (?,?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setDate(1, (Date) descuento.getFecha_fin());
            pstm.setLong(2,descuento.getPor_descuento());
            pstm.setLong(3,descuento.getFk_stock());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoDescuento.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }
}

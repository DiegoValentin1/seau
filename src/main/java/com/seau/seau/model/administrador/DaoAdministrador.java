package com.seau.seau.model.administrador;

import com.seau.seau.model.articulo.BeanArticulo;
import com.seau.seau.model.articulo.DaoArticulo;
import com.seau.seau.model.descuento.BeanDescuento;
import com.seau.seau.model.descuento.DaoDescuento;
import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAdministrador {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public List<BeanAdministrador> findAll(){
        List<BeanAdministrador> administradors = new ArrayList<>();
        BeanAdministrador administrador = null;

        try{
            conn= new MYSQLConnection().getConnection();
            String query = "SELECT * FROM administrador;";
            pstm = conn.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()){
                administrador = new BeanAdministrador();
                administrador.setId(rs.getLong("id"));
                administrador.setUsername(rs.getString("username"));
                administrador.setPassword(rs.getString("password"));
                administradors.add(administrador);
                System.out.println("Hola desde admin");
                System.out.println(administrador.getPassword());
            }
        } catch (SQLException e){
            Logger.getLogger(DaoAdministrador.class.getName())
                    .log(Level.SEVERE, "Error findAll", e);
        }finally {
            closeConnections();
        }
        return administradors;
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

    public boolean save(BeanAdministrador administrador){
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "INSERT INTO administrador" + "(username, password)" + "VALUES (?,?)";
            pstm = conn.prepareStatement(query);
            pstm.setString(1,administrador.getUsername());
            pstm.setString(2,administrador.getPassword());

            return pstm.executeUpdate() ==1;
        }catch (SQLException e){
            Logger.getLogger(DaoAdministrador.class.getName())
                    .log(Level.SEVERE, "Error save", e);
            return false;
        }finally {
            closeConnections();
        }
    }

    public boolean update(BeanAdministrador administrador) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "UPDATE administrador SET username = ?, password = ? WHERE id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setString(1, administrador.getUsername());
            pstm.setString(2, administrador.getPassword());
            pstm.setLong(3, administrador.getId());
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoAdministrador.class.getName())
                    .log(Level.SEVERE, "Error update", e);
            return false;
        } finally {
            closeConnections();
        }
    }

    public boolean delete(Long id) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "DELETE FROM administrador WHERE id = ?";
            pstm = conn.prepareStatement(query);
            pstm.setLong(1, id);
            return pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            Logger.getLogger(DaoAdministrador.class.getName())
                    .log(Level.SEVERE, "Error delete method");
            return false;
        } finally {
            closeConnections();
        }
    }
}

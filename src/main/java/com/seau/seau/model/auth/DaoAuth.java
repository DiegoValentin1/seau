package com.seau.seau.model.auth;

import com.seau.seau.utils.MYSQLConnection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAuth {
    Connection conn;
    PreparedStatement pstm;
    CallableStatement cstm;
    ResultSet rs;

    public com.seau.seau.model.auth.BeanUser validate(String username, String password) {
        try {
            conn = new MYSQLConnection().getConnection();
            String query = "SELECT * FROM administrador WHERE username = ? " +
                    "AND password = ?;";
            pstm = conn.prepareStatement(query);
            pstm.setString(1,username);
            pstm.setString(2,password);
            rs = pstm.executeQuery();
            if (rs.next()){
                com.seau.seau.model.auth.BeanUser user = new com.seau.seau.model.auth.BeanUser();
                user.setUsername(rs.getString("username"));

                return user;
            }
            return null;
        } catch (SQLException e) {
            Logger.getLogger(DaoAuth.class.getName())
                    .log(Level.SEVERE, "Error validate method" + e);
            return null;
        } finally {
            closeConnections();
        }
    }

    public void closeConnections() {
        try {
            if (conn != null) {
                conn.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (cstm != null) {
                cstm.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
        }
    }
}

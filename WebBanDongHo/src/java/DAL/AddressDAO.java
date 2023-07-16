/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Address;
import model.Watch;

/**
 *
 * @author ADMIN
 */
public class AddressDAO extends BaseDAO<Address> {

    public Address getAddress(String username) {
        try {
            String sql = "SELECT * FROM Address s\n"
                    + "WHERE s.username = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Address s = new Address();
                s.setUsername(rs.getString("username"));
                s.setFirstname(rs.getString("firstName"));
                s.setLastname(rs.getString("lastName"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("customerAddress"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAddress(Address s) {
        try {
            String sql = "insert into Address(username,firstName,lastName,phone,customerAddress) values(?,?,?,?,?)\n;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getUsername());
            statement.setString(2, s.getFirstname());
            statement.setString(3, s.getLastname());
            statement.setString(4, s.getPhone());
            statement.setString(5, s.getAddress());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAddress(Address s, String username) {
        try {
            String sql = "UPDATE [Address]\n"
                    + "   SET [firstName] = ?\n"
                    + "      ,[lastName] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[customerAddress] = ?\n"
                    + " WHERE [username] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getFirstname());
            statement.setString(2, s.getLastname());
            statement.setString(3, s.getPhone());
            statement.setString(4, s.getAddress());
            statement.setString(5, s.getUsername());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

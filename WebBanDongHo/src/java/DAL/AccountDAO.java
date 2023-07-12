package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ADMIN
 */
public class AccountDAO extends BaseDAO<Account> {

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Accounts s\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setUsername(rs.getString("name"));
                s.setPassword(rs.getString("pass"));
                s.setRole(rs.getString("fieldRole"));
                accounts.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account getAccount(String username) {
        try {
            String sql = "SELECT * FROM Accounts s\n"
                    + "WHERE s.username = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account s = new Account();
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                s.setRole(rs.getString("fieldRole"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccount(Account s) {
        try {
            String sql ="insert into Accounts(username,password,fieldRole) values(?,?,?)\n;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getUsername());
            statement.setString(2, s.getPassword());
            statement.setString(3, "User");
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

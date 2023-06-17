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

    public ArrayList<Account> getAccountes() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Accounts s\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account s = new Account();
                s.setId(rs.getInt("id"));
                s.setUsername(rs.getString("name"));
                s.setPassword(rs.getString("pass"));
                accounts.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public Account getAccount(String username,String password) {
        try {
            String sql = "SELECT * FROM Accounts s\n"
                    + "WHERE s.username = ? and s.password=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account s = new Account();
                s.setUsername(rs.getString("username"));
                s.setPassword(rs.getString("password"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccount(Account s) {
        try {
            String sql = "SET IDENTITY_INSERT Accounts on\n"
                    + "INSERT INTO [Accounts]\n"
                    + "           ([id]\n"
                    + "           ,[name]\n"
                    + "           ,[pass]\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)"
                    + "\nSET IDENTITY_INSERT Accounts off";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getId());
            statement.setString(2, s.getUsername());
            statement.setString(3, s.getPassword());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

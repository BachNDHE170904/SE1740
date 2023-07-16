/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Order;
import model.Watch;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends BaseDAO<Order> {

    public ArrayList<Order> getOrders(String username) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select o.id,o.quantity,o.username,o.paid,o.watchid,w.name,w.price,w.sku from Orders o,Accounts a,Watches w where o.username=a.username and o.watchid=w.id and o.username=?;\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Watch w = new Watch();
                w.setWatchId(rs.getInt("watchid"));
                w.setPageId((w.getWatchId() / 9) + 1);
                w.setName(rs.getString("name"));
                w.setSku(rs.getString("sku"));
                w.setPrice(rs.getFloat("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setWatch(w);
                o.setId(rs.getInt("id"));
                o.setStatus(rs.getBoolean("paid"));
                if (!o.isStatus()) {
                    orders.add(o);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrdersHistory(String username) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select o.id,o.quantity,o.username,o.paid,o.watchid,orderedDate,w.name,w.price,w.sku from Orders o,Accounts a,Watches w where o.username=a.username and o.watchid=w.id and o.username=?;\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Watch w = new Watch();
                w.setWatchId(rs.getInt("watchid"));
                w.setPageId((w.getWatchId() / 9) + 1);
                w.setName(rs.getString("name"));
                w.setSku(rs.getString("sku"));
                w.setPrice(rs.getFloat("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setWatch(w);
                o.setId(rs.getInt("id"));
                o.setStatus(rs.getBoolean("paid"));
                o.setOrderedDate(rs.getString("orderedDate"));
                if (o.isStatus()) {
                    orders.add(o);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getOrdersHistoryAdmin() {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "select o.id,o.quantity,o.username,o.paid,o.watchid,orderedDate,w.name,w.price,w.sku from Orders o,Accounts a,Watches w where o.username=a.username and o.watchid=w.id ;\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                Watch w = new Watch();
                w.setWatchId(rs.getInt("watchid"));
                w.setPageId((w.getWatchId() / 9) + 1);
                w.setName(rs.getString("name"));
                w.setSku(rs.getString("sku"));
                w.setPrice(rs.getFloat("price"));
                o.setQuantity(rs.getInt("quantity"));
                o.setWatch(w);
                o.setUser(rs.getString("username"));
                o.setId(rs.getInt("id"));
                o.setStatus(rs.getBoolean("paid"));
                o.setOrderedDate(rs.getString("orderedDate"));
                if (o.isStatus()) {
                    orders.add(o);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public void insertOrder(Watch w, int quantity, Account a) {
        try {
            String sql = "insert into Orders(username,orderedDate,paid,watchid,quantity) values(?,?,?,?,?)\n;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, a.getUsername());
            statement.setString(2, "  ");
            statement.setBoolean(3, false);
            statement.setInt(4, w.getWatchId());
            statement.setInt(5, quantity);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrders(String username) {
        try {
            String sql = "Update Orders set paid=1,orderedDate=? WHERE username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy");
            Date date = new Date();
            statement.setString(1, format.format(date));
            statement.setString(2, username);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(int id) {
        try {
            String sql = "DELETE Orders WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

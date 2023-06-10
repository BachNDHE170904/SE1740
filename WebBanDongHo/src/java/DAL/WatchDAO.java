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
import model.Watch;

/**
 *
 * @author fsoft
 */
public class WatchDAO extends BaseDAO<Watch> {

    @Override
    public ArrayList<Watch> getWatches() {
        ArrayList<Watch> watches = new ArrayList<>();
        try {
            String sql =  "SELECT * FROM Watches s\n";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next())
            {
                Watch s = new Watch();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setSku(rs.getString("sku"));
                s.setPrice(rs.getFloat("price"));
                watches.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return watches;
    }
    public Watch getWatch(int id) {
        try {
            String sql = "SELECT * FROM Watch s\n"
                    + "WHERE s.id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Watch s = new Watch();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setSku(rs.getString("sku"));
                s.setPrice(rs.getFloat("price"));
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
//    public void insertWatch(Watch s) {
//        try {
//            String sql = "SET IDENTITY_INSERT student on\n"+
//                    "INSERT INTO [Watch]\n"
//                    + "           ([id]\n"
//                    + "           ,[name]\n"
//                    + "           ,[dob]\n"
//                    + "           ,[gender])\n"
//                    + "     VALUES\n"
//                    + "           (?\n"
//                    + "           ,?\n"
//                    + "           ,?\n"
//                    + "           ,?)"
//            +"\nSET IDENTITY_INSERT student off";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setInt(1, s.getId());
//            statement.setString(2, s.getName());
//            statement.setDate(3, s.getDob());
//            statement.setBoolean(4,s.getGender().equals("Male"));
//            statement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public void updateWatch(Watch s) {
//        try {
//            String sql = "UPDATE [Watch]\n"
//                    + "   SET [name] = ?\n"
//                    + "      ,[dob] = ?\n"
//                    + "      ,[gender] = ?\n"
//                    + " WHERE [id] = ?";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setString(1, s.getName());
//            statement.setDate(2, s.getDob());
//            statement.setBoolean(3,s.getGender().equals("Male"));
//            statement.setInt(4, s.getId());
//            statement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public void deleteWatch(int id) {
//        try {
//            String sql = "DELETE Watch WHERE id=?";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setInt(1, id);
//            statement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(WatchDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//        public static void main(String[] args) {
//        WatchDAO db=new WatchDAO();
//         ArrayList<Watch> watches = db.getWatches();db.getWatches();
//         for(Watch w:watches){
//             System.out.println(w.toString());
//         }
//    }
}


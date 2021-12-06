/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtil;

/**
 *
 * @author tamtv
 */
public class userDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT u.userID, u.name, u.phone, u.address, u.createDay, r.roleID "
                    + "FROM tblUsers u, tblRoles r "
                    + "WHERE u.roleID = r.roleID "
                    + "AND u.statusUser = 1 "
                    + "AND u.userID = ? AND u.password = ? ";
            pre = con.prepareStatement(sql);
            pre.setString(1, userID);
            pre.setString(2, password);
            rs = pre.executeQuery();

            if (rs.next()) {
                user = new UserDTO(rs.getString("userID"), rs.getString("name"), "****", rs.getString("phone"),
                        rs.getString("address"), rs.getString("roleID"), true,
                        rs.getString("createDay"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public List<UserDTO> getListUser(String name) throws SQLException {
        List<UserDTO> users = new ArrayList<>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT u.userID, u.name, u.phone, u.address, u.createDay, r.roleID "
                    + "FROM tblUsers u, tblRoles r "
                    + "WHERE u.roleID = r.roleID  "
                    + "AND u.statusUser = 1 "
                    + "AND u.name like ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            rs = pre.executeQuery();

            while (rs.next()) {
                users.add( new UserDTO(rs.getString("userID"),
                        rs.getString("name"), 
                        "****",
                        rs.getString("phone"), 
                        rs.getString("address"), 
                        rs.getString("roleID"), 
                        true, 
                        rs.getString("createDay")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return users;
    }

    public boolean checkDeleteUser(String userID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblUsers "
                    + "SET statusUser = 0 "
                    + "FROM tblUsers "
                    + "WHERE userID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, userID);
            check = pre.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean checkUpdateUser(String userID, String roleName) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblUsers "
                    + "SET  roleID = ? "
                    + "FROM tblUsers u, tblRoles r "
                    + "WHERE u.roleID = r.roleID "
                    + "AND u.userID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, roleName);
            pre.setString(2, userID);
            check = pre.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean checkEditInfoUser(UserDTO u) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblUsers "
                    + "SET  name = ?, phone = ?, address = ?, password = ? "
                    + "WHERE userID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, u.getName());
            pre.setString(2, u.getPhone());
            pre.setString(3, u.getAddress());
            pre.setString(4, u.getPassword());
            pre.setString(5, u.getUserID());
            check = pre.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public String checkUserID(String userID) throws SQLException {
        String result = null;
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT userID "
                    + "FROM tblUsers "
                    + "WHERE userID = ? ";
            pre = con.prepareStatement(sql);
            pre.setString(1, userID);
            rs = pre.executeQuery();
            if (rs.next()) {
                result = rs.getString("userID");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return result;
    }

    public boolean createUser(UserDTO u) throws SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        boolean rs = false;

        try {
            userDAO dao = new userDAO();
            
            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblUsers(userID,name,phone,password,address,createDay,statusUser,roleID) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, u.getUserID());
            pre.setString(2, u.getName());
            pre.setString(3, u.getPhone());
            pre.setString(4, u.getPassword());
            pre.setString(5, u.getAddress());
            pre.setString(6, u.getCreateDay());
            pre.setString(7, "1");
            pre.setString(8, u.getRole());
            rs = pre.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return rs;
    }

    public boolean addUser(UserDTO u) throws SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        boolean rs = false;

        try {
            userDAO dao = new userDAO();
            
            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblUsers(userID,name,phone,password,address,createDay,statusUser,roleID) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, u.getUserID());
            pre.setString(2, u.getName());
            pre.setString(3, u.getPhone());
            pre.setString(4, u.getPassword());
            pre.setString(5, u.getAddress());
            pre.setString(6, u.getCreateDay());
            pre.setString(7, "1");
            pre.setString(8, "US");
            rs = pre.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pre != null) {
                pre.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return rs;
    }
    
    public static void main(String[] args) throws SQLException {
        userDAO dao = new userDAO();
        if (dao.checkUserID("user1") != null) {
            System.out.println("a");
        } else {
            System.out.println("o");
        }
    }
}

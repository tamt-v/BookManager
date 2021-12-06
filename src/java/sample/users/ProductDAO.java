/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtil;

/**
 *
 * @author tamtv
 */
public class ProductDAO {

    public List<ProductDTO> getListProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT p.productID, p.productName, p.quantity, p.price, p.description, p.image, c.categoryName, p.statusProduct "
                    + "FROM tblProducts p, tblCategory c "
                    + "WHERE p.categoryID = c.categoryID "
                    + "AND p.statusProduct = 1";
            pre = con.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"),
                        rs.getString("categoryName"), Float.parseFloat(rs.getString("price")), Integer.parseInt(rs.getString("quantity")),
                        rs.getString("image"), true));
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
        return list;
    }

    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT categoryName, categoryID "
                    + "FROM tblCategory";
            pre = con.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new CategoryDTO(rs.getString("categoryID"), rs.getString("categoryName")));
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
        return list;
    }

    public List<ProductDTO> getProductByCID(String cID) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT p.productID, p.productName, p.quantity, p.price, p.description, p.image, c.categoryName "
                    + "FROM tblProducts p, tblCategory c "
                    + "WHERE  p.categoryID = c.categoryID "
                    + "AND p.statusProduct = 1 AND c.categoryID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, cID);
            rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"),
                        rs.getString("categoryName"), Float.parseFloat(rs.getString("price")), Integer.parseInt(rs.getString("quantity")),
                        rs.getString("image"), true));
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
        return list;
    }

    public ProductDTO getProduct(String pID) throws SQLException {
        ProductDTO p = null;
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT p.productID, p.productName, p.quantity, p.price, p.description, p.image, c.categoryName "
                    + "FROM tblProducts p, tblCategory c "
                    + "WHERE p.categoryID = c.categoryID "
                    + "AND p.statusProduct = 1 AND p.productID = ? ";
            pre = con.prepareStatement(sql);
            pre.setString(1, pID);
            rs = pre.executeQuery();
            if (rs.next()) {
                p = new ProductDTO(rs.getString("productID"), rs.getString("productName"), rs.getString("description"),
                        rs.getString("categoryName"), Float.parseFloat(rs.getString("price")), 1,
                        rs.getString("image"), true);
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
        return p;
    }

    public List<OrderDTO> getOrder(String uID) throws SQLException {
        List<OrderDTO> o = new ArrayList<>();
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT p.image, p.productName, p.quantity qpro, d.quantity, p.price, d.productID "
                    + "FROM tblProducts p, tblOrders o, tblUsers u, tblOrderDetail d "
                    + "WHERE u.userID = o.userID AND o.orderID = d.orderID AND d.productID = p.productID "
                    + "AND u.userID = ? AND o.paymentStatus = 0 AND o.statusOrder = 1 ";
            pre = con.prepareStatement(sql);
            pre.setString(1, uID);
            rs = pre.executeQuery();
            while (rs.next()) {
                o.add(new OrderDTO(rs.getString("productID"), rs.getString("productName"),
                        rs.getString("image"),
                        Integer.parseInt(rs.getString("quantity")),
                        Float.parseFloat(rs.getString("price")),
                        Integer.parseInt(rs.getString("qpro")),
                        (Float.parseFloat(rs.getString("price")) * Integer.parseInt(rs.getString("quantity")))));
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

            return o;
        }

    }

    public String getOrderID(String uID) throws SQLException {
        String orderID = null;
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT o.orderID "
                    + "FROM tblOrders o, tblUsers u "
                    + "WHERE u.userID = o.userID "
                    + "	AND u.userID = ? AND o.paymentStatus = 0 ";
            pre = con.prepareStatement(sql);
            pre.setString(1, uID);
            rs = pre.executeQuery();
            if (rs.next()) {
                orderID = rs.getString("orderID");
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

            return orderID;
        }
    }

    public boolean createOrder(String uID, String orderDate) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblOrders (userID, orderDay, totalMoney, statusOrder, paymentStatus)\n"
                    + "VALUES (?, ?, 0, 1, 0)";
            pre = con.prepareStatement(sql);
            pre.setString(1, uID);
            pre.setString(2, orderDate);
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

            return check;
        }
    }

    public boolean createOrderDetail(OrderDetailDTO o) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "INSERT INTO tblOrderDetail(orderID, price, quantity, productID) "
                    + "VALUES (?,?,?,?)";
            pre = con.prepareStatement(sql);
            pre.setString(1, o.getOrderID());
            pre.setFloat(2, o.getPrice());
            pre.setInt(3, o.getQuantity());
            pre.setString(4, o.getProductID());
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

            return check;
        }
    }

    public boolean updateOrderDetail(String productID, int quantity) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = " UPDATE tblOrderDetail "
                    + " SET quantity = ? "
                    + " FROM tblOrders o, tblOrderDetail d "
                    + " WHERE o.orderID = d.orderID "
                    + " AND d.productID = ? AND o.paymentStatus = 0";
            pre = con.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setString(2, productID);
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

            return check;
        }
    }

    public int getQuantityFromOrdDetail(String productID) throws SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        int quantity = 0;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT d.quantity "
                    + "FROM tblOrders o, tblOrderDetail d "
                    + "WHERE o.orderID = d.orderID "
                    + "AND d.productID = ? AND o.paymentStatus = 0";
            pre = con.prepareStatement(sql);
            pre.setString(1, productID);
            rs = pre.executeQuery();
            if (rs.next()) {
                quantity = Integer.parseInt(rs.getString("quantity"));
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

            return quantity;
        }
    }

    public float getTotalMoney(List<OrderDTO> o) {
        float totalMoney = 0;
        for (OrderDTO p : o) {
            totalMoney += p.getTotalMoney();
        }
        return totalMoney;
    }

    public boolean updateTotalMoney(List<OrderDTO> l, String uID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        ProductDAO dao = new ProductDAO();
        float totalM = dao.getTotalMoney(l);

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblOrders "
                    + "SET totalMoney = ? "
                    + "FROM tblOrders o, tblUsers u "
                    + "WHERE u.userID = o.userID "
                    + "	AND u.userID = ? AND o.paymentStatus = 0";
            pre = con.prepareStatement(sql);
            pre.setFloat(1, totalM);
            pre.setString(2, uID);
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

            return check;
        }
    }

    public float getTotalMoney(String uID) throws SQLException {
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        float total = 0;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT o.totalMoney "
                    + "FROM tblOrders o, tblUsers u "
                    + "WHERE u.userID = o.userID "
                    + "AND u.userID = ? AND o.paymentStatus = 0 ";
            pre = con.prepareStatement(sql);
            pre.setString(1, uID);
            rs = pre.executeQuery();
            if (rs.next()) {
                total = Float.parseFloat(rs.getString("totalMoney"));
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

            return total;
        }
    }

    public int getQuantity(String pID) throws SQLException {
        int quantity = 0;
        Connection con = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            String sql = "SELECT  quantity "
                    + "FROM tblProducts "
                    + "WHERE productID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, pID);
            rs = pre.executeQuery();
            if (rs.next()) {
                quantity = Integer.parseInt(rs.getString("quantity"));
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

            return quantity;
        }
    }

    public boolean updateQuantityProduct(String pID, int quantityAfterUpdate) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts "
                    + "SET quantity = ? "
                    + "WHERE productID = ?";
            pre = con.prepareStatement(sql);
            pre.setInt(1, quantityAfterUpdate);
            pre.setString(2, pID);
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

            return check;
        }
    }

    public boolean updateStatusProduct(String pID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblProducts "
                    + "SET statusProduct = 0 "
                    + "WHERE productID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, pID);
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

    public boolean updateStatusOrder(String uID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = "UPDATE tblOrders "
                    + "SET paymentStatus = 1 "
                    + "FROM tblOrders o, tblUsers u "
                    + "WHERE o.userID = u.userID "
                    + "AND u.userID = ?";
            pre = con.prepareStatement(sql);
            pre.setString(1, uID);
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

    public boolean checkOut(List<OrderDTO> listP, String uID) throws SQLException {
        boolean check = false;
        int quantity = 0;
        int temp = 1;
        ProductDAO dao = new ProductDAO();

        for (OrderDTO dto : listP) {
            quantity = dao.getQuantity(dto.getProducID());
            temp = quantity - dto.getoQuantity();
            dao.updateQuantityProduct(dto.getProducID(), temp);
            check = dao.updateStatusOrder(uID);
            if (temp == 0) {
                dao.updateStatusProduct(dto.getProducID());
            }
        }
        return check;
    }

    public boolean deleteProduct(String pID, String orderID) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement pre = null;

        try {
            con = DBUtil.getConnection();
            String sql = " DELETE FROM tblOrderDetail "
                    + " WHERE productID = ? AND orderID = ? ";
            pre = con.prepareStatement(sql);
            pre.setString(1, pID);
            pre.setString(2, orderID);
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
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.OrderDTO;
import sample.users.OrderDetailDTO;
import sample.users.ProductDAO;
import sample.users.UserDTO;

/**
 *
 * @author tamtv
 */
@WebServlet(name = "AddCartController", urlPatterns = {"/AddCartController"})
public class AddCartController extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";
    private final String CART_PAGE = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            HttpSession session = request.getSession();
            List<OrderDTO> cartUser = (List<OrderDTO>) session.getAttribute("CART_USER");
            ProductDAO dao = new ProductDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            if (cartUser == null) {
                dao.createOrder(loginUser.getUserID(), DateTimeFormatter.ofPattern("yyyy/MM/dd").format(LocalDate.now()));
            }

            String orderID = dao.getOrderID(loginUser.getUserID());
            String productID = request.getParameter("pID");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price = Float.parseFloat(request.getParameter("price"));

            if (cartUser != null) {
                for (OrderDTO o : cartUser) {
                    if (productID.equals(o.getProducID())) {
                        int temp = dao.getQuantityFromOrdDetail(productID);
                        temp += quantity;
                        dao.updateOrderDetail(productID, temp);
                        return;
                    }
                }
            }
            dao.createOrderDetail(new OrderDetailDTO(orderID, productID, price, quantity));

            List<OrderDTO> listProduct = dao.getOrder(loginUser.getUserID());

            dao.updateTotalMoney(listProduct, loginUser.getUserID());

            session.setAttribute("CART_QUANTUM", listProduct.size());
            session.setAttribute("CART_USER", listProduct);

            float totalMoney = dao.getTotalMoney(loginUser.getUserID());
            request.setAttribute("TOTAL_MONEY", totalMoney);

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.OrderDTO;
import sample.users.ProductDAO;
import sample.users.UserDTO;

/**
 *
 * @author tamtv
 */
@WebServlet(name = "LoadCartController", urlPatterns = {"/LoadCartController"})
public class LoadCartController extends HttpServlet {

    private final String CART_PAGE = "cart.jsp";
    private final String ADD_CART = "AddCartController";
    private final String HOME_PAGE = "home.jsp";
    private final String LOGIN_PAGE = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            HttpSession session = request.getSession();

            if (session.getAttribute("LOGIN_USER") == null) {
                return;
            }
            String action = request.getParameter("cart");
            String deleteSuccess = (String) request.getAttribute("DELETE_SUCCESS");          

            if (action == null) {
                UserDTO u = (UserDTO) session.getAttribute("LOGIN_USER");
                ProductDAO dao = new ProductDAO();
                List<OrderDTO> o = dao.getOrder(u.getUserID());
                session.setAttribute("CART_QUANTUM", o.size());
                if (o.size() != 0) {
                    session.setAttribute("CART_USER", o);
                    float totalMoney = dao.getTotalMoney(o);
                    request.setAttribute("TOTAL_MONEY", totalMoney);
                }else {
                    session.setAttribute("CART_USER", null);
                }
                
                if(deleteSuccess != null){
                    url = CART_PAGE;
                    return;
                }
                url = HOME_PAGE;
                

            } else if (action.equals("Cart")) {
                url = CART_PAGE;
                UserDTO u = (UserDTO) session.getAttribute("LOGIN_USER");
                ProductDAO dao = new ProductDAO();
                List<OrderDTO> o = dao.getOrder(u.getUserID());
                session.setAttribute("CART_QUANTUM", o.size());
                if (o.size() != 0) {
                    session.setAttribute("CART_USER", o);
                    float totalMoney = dao.getTotalMoney(o);
                    request.setAttribute("TOTAL_MONEY", totalMoney);
                }
            } else if (action.equals("Add to cart")) {
                url = ADD_CART;
            }
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

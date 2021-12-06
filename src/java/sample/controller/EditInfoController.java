/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDTO;
import sample.users.userDAO;

/**
 *
 * @author tamtv
 */
public class EditInfoController extends HttpServlet {

    private final String HOME_PAGE = "home.jsp";
    private final String EDIT_PAGE = "edit.jsp";
    private final String ADMIN_PAGE = "SearchController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;

        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

            String userID = null;
            String name = null;
            String phone = null;
            String address = null;
            String password = null;

            if (action.equals("EditInfomation") || action.equals("Edit Infomation")) {
                userID = user.getUserID();
                name = user.getName();
                phone = user.getPhone();
                address = user.getAddress();
                password = user.getPassword();
                UserDTO u = new UserDTO(userID, name, phone, address, password);
                session.setAttribute("EDIT_USER", u);
                request.setAttribute("ROLE_AD", "AD");
                url = EDIT_PAGE;
            } else if (action.equals("Save")) {
                userID = request.getParameter("userID").trim();
                name = request.getParameter("name");
                phone = request.getParameter("phone");
                address = request.getParameter("address");
                password = request.getParameter("password");

                boolean check = true;
                if (phone.length() != 10) {
                    request.setAttribute("PHONE_ERROR", "Phone number must be 10 degits");
                    check = false;
                }
                if (password.length() < 5 || password.length() > 50) {
                    request.setAttribute("PASS_ERROR", "Length of password must be in [5..50] !!!");
                    check = false;
                }
                if (name.length() <= 0) {
                    request.setAttribute("NAME_ERROR", "Name can not null !!!");
                    check = false;
                }
                if (address.length() <= 0) {
                    request.setAttribute("ADDRESS_ERROR", "Address can not null !!!");
                    check = false;
                }

                if (check) {
                    UserDTO updateUser = new UserDTO(userID, name, phone, address, password);
                    userDAO dao = new userDAO();
                    if (dao.checkEditInfoUser(updateUser)) {
                        if (user.getRole().equals("AD")) {
                            url = ADMIN_PAGE;
                        } else {
                            url = HOME_PAGE;
                        }
                    }
                } else {
                    url = EDIT_PAGE;
                }
            }

        } catch (Exception e) {
            log("Error at edit infomation controller " + e.toString());
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

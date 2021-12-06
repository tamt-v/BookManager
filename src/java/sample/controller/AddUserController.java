/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
public class AddUserController extends HttpServlet {

    private final String ADD_SUCCESS = "SearchController";
    private final String CREATE_SUCCESS = "login.jsp";
    private final String FAIL = "home.jsp";
    private final String CREATE_USER = "logup.jsp";
    private final String ADD_USER = "signup.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = FAIL;
        try {
            String action = request.getParameter("action");
            if (action.equals("Add Account")) {
                url = ADD_USER;
            } else if (action.equals("Create Account")) {
                url = CREATE_USER;
            } else if (action.equals("Create") || action.equals("Add")) {
                String userID = request.getParameter("userID");
                userDAO dao = new userDAO();
                if (action.equals("Add")) {
                    if (dao.checkUserID(userID) == null) {

                        url = CREATE_USER;
                        boolean check = true;
                        String role = request.getParameter("role").trim().toUpperCase();
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");

                        String address = request.getParameter("address");
                        String password = request.getParameter("password");

                        if (userID.length() > 10 || userID.length() < 5) {
                            request.setAttribute("ID_ERROR", "User ID must be in [5..10]");
                            check = false;
                        }
                        if (phone.length() != 10) {
                            request.setAttribute("PHONE_ERROR", "Phone number must be 10 degits");
                            check = false;
                        }
                        if (password.length() < 5 || password.length() > 50) {
                            request.setAttribute("PASS_ERROR", "Length of password must be in [5..50] !!!");
                            check = false;
                        }

                        if (check) {
                            dao.createUser(new UserDTO(userID, name, password, phone, address, role, true,
                                    DateTimeFormatter.ofPattern("yyyy/MM/dd").format(LocalDate.now())));
                            url = ADD_SUCCESS;
                        }
                    } else {
                        request.setAttribute("ID_ERROR", "User ID is invalid !!!");
                    }
                } else {
                    url = ADD_USER;
                    if (dao.checkUserID(userID) == null) {

                        boolean check = true;
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");

                        String address = request.getParameter("address");
                        String password = request.getParameter("password");

                        if (userID.length() > 10 || userID.length() < 5) {
                            request.setAttribute("ID_ERROR", "User ID must be in [5..10]");
                            check = false;
                        }
                        if (phone.length() != 10) {
                            request.setAttribute("PHONE_ERROR", "Phone number must be 10 degits");
                            check = false;
                        }
                        if (password.length() < 5 || password.length() > 50) {
                            request.setAttribute("PASS_ERROR", "Length of password must be in [5..50] !!!");
                            check = false;
                        }

                        if (check) {
                            dao.addUser(new UserDTO(userID, name, password, phone, address,
                                    DateTimeFormatter.ofPattern("yyyy/MM/dd").format(LocalDate.now())));
                            url = CREATE_SUCCESS;
                        }
                    } else {
                        request.setAttribute("ID_ERROR", "User ID is invalid !!!");
                    }
                }
            }

        } catch (Exception e) {
            log("Error at AddUserControll " + e.toString());
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

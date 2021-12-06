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

/**
 *
 * @author tamtv
 */
public class MainController extends HttpServlet {
    private final String LOGIN_PAGE = "LoginController";
    private final String ERROR = "error.jsp";
    private final String UPDATE = "UpdateController";
    private final String LOGOUT = "LogoutController";
    private final String SEARCH = "SearchController";
    private final String DELETE = "DeleteController";
    private final String EDIT = "EditInfoController";
    private final String EDIT_CONFIRM = "EditInfoController";
    private final String ADD_ACCOUNT = "AddUserController";
    private final String HOME_PAGE = "home.jsp";
    private final String CHECKOUT = "CheckoutController";
    private final String DELETE_PRODUCT = "DeleteProductController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try {
            String action = request.getParameter("action");
            
            if(action.equals("Login")){
                url = LOGIN_PAGE;
            } else if(action.equals("Logout")){
                url = LOGOUT;
            } else if(action.equals("Confirm Update")){
                url = UPDATE;
            } else if(action.equals("Search") || action.equals("Back")){
                url = SEARCH;
            } else if(action.equals("Delete")){
                url = DELETE;
            } else if(action.equals("Edit Infomation") || action.equals("EditInfomation")){
                url = EDIT;
            } else if(action.equals("Save")){
                url = EDIT_CONFIRM;
            } else if(action.equals("Add Account") || action.equals("Create Account")){           
                url = ADD_ACCOUNT;
            } else if(action.equals("Create") || action.equals("Add")){           
                url = ADD_ACCOUNT;
            } else if(action.equals("Home")){
                url = HOME_PAGE;
            } else if(action.equals("Continue Shopping")){
                url = HOME_PAGE;
            } else if(action.equals("Checkout")){
                url = CHECKOUT;
            } else if(action.equals("delete")){
                url = DELETE_PRODUCT;
            }
            
            
            
        } catch (Exception e) {
        }finally{
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

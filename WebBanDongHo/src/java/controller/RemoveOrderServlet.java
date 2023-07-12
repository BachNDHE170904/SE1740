/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.OrderDAO;
import DAL.WatchDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Watch;

/**
 * Servlet responsible for removing an order from the cart.
 */
public class RemoveOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WatchDAO watchDb = new WatchDAO();
        OrderDAO orderDb = new OrderDAO();
        ArrayList<Watch> watches = watchDb.getWatches();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (acc == null) {
            // Redirect to login page if user is not logged in
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                // Delete the order from the database
            orderDb.deleteOrder(id);
            // Redirect to the view orders page after removing the order
            request.getRequestDispatcher("ViewOrders.jsp").forward(request, response);
            }catch(Exception e){
                request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

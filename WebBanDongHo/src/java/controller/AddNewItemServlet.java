/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.OrderDAO;
import DAL.WatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Account;
import model.Order;
import model.Watch;

/**
 * Servlet responsible for adding items to the cart.
 */
public class AddNewItemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get watch and quantity from session and add order to the database
        String name = request.getParameter("name");
        String sku = request.getParameter("sku");
        try {
            float price = Float.parseFloat(request.getParameter("price"));
            Watch newWatch = new Watch();
            newWatch.setName(name);
            newWatch.setPrice(price);
            newWatch.setSku(sku);
            WatchDAO db = new WatchDAO();
            db.insertWatch(newWatch);
            // Redirect to the welcome page after adding the item to the cart
            request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
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

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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import model.Account;
import java.io.IOException;
import model.Order;
import model.Watch;
import model.WatchSpecs;

/**
 * Servlet responsible for adding items to the cart.
 */
public class AddNewItemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String sku = request.getParameter("sku");
            float price = Float.parseFloat(request.getParameter("price"));
            String bezel = request.getParameter("bezel");
            String movement = request.getParameter("movement");
            String dial = request.getParameter("dial");
            String wCase = request.getParameter("case");
            String glass = request.getParameter("glass");
            String strap = request.getParameter("strap");
            Watch newWatch = new Watch();
            WatchSpecs newWatchSpecs = new WatchSpecs();
            newWatch.setName(name);
            newWatch.setPrice(price);
            newWatch.setSku(sku);
            newWatchSpecs.setBezel(bezel);
            newWatchSpecs.setDial(dial);
            newWatchSpecs.setGlass(glass);
            newWatchSpecs.setMovement(movement);
            newWatchSpecs.setStrap(strap);
            newWatchSpecs.setWatchCase(wCase);
            WatchDAO db = new WatchDAO();
            db.insertWatch(newWatch);
            db.insertWatchSpecs(newWatchSpecs);
            // Redirect to the welcome page after adding the item 
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

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
 *
 * @author ADMIN
 */
public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WatchDAO watchDb = new WatchDAO();
        OrderDAO orderDb=new OrderDAO();
        ArrayList<Watch> watches = watchDb.getWatches();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (watches == null) {
            PrintWriter out = response.getWriter();
            out.println("Cannot get the data");
        } else {
            if (acc == null) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                Watch w = (Watch) session.getAttribute("previewwatch");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                orderDb.insertOrder(w, quantity, acc);
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

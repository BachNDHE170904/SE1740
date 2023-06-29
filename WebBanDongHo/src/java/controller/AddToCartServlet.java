/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Watch;

/**
 *
 * @author ADMIN
 */
public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WatchDAO db = new WatchDAO();
        ArrayList<Watch> watches = db.getWatches();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("user");
        if (watches == null) {
            PrintWriter out = response.getWriter();
            out.println("Cannot get the data");
        } else {
            if (acc == null) {
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                Watch w = (Watch) request.getAttribute("previewwatch");
                if (session.getAttribute("orders") != null) {
                    ArrayList<Watch> orders = (ArrayList<Watch>) session.getAttribute("orders");
                    orders.add(w);
                    session.setAttribute("orders", orders);
                    request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
                } else {
                    ArrayList<Watch> orders = new ArrayList();
                    orders.add(w);
                    session.setAttribute("orders", orders);
                    request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
                }
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

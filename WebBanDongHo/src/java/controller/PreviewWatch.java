/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.WatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Watch;
import model.WatchSpecs;

/**
 * Servlet responsible for previewing a watch.
 */
public class PreviewWatch extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WatchDAO db = new WatchDAO();
        ArrayList<Watch> watches = db.getWatches();
        ArrayList<WatchSpecs> watchSpecs = db.getWatchesSpecs();
        if (watches == null) {
            PrintWriter out = response.getWriter();
            out.println("Cannot get the data");
        } else {
            try {
                int id = Integer.parseInt(request.getParameter("watchid"));
                // Set the preview watch and watch specs as request attributes
                request.setAttribute("previewwatch", watches.get(id));
                request.setAttribute("previewwatchspec", watchSpecs.get(id));
                // Forward the request to the watch preview page
                request.getRequestDispatcher("WatchPreview.jsp").forward(request, response);
            } catch (Exception e) {
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

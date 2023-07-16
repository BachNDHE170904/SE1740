/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAL.WatchDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import model.Account;
import model.Watch;
import model.WatchSpecs;

/**
 * Servlet responsible for previewing a watch.
 */
@MultipartConfig
public class UpdateItemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WatchDAO db = new WatchDAO();
        try {
            int id = Integer.parseInt(request.getParameter("watchid"));
            // Set the preview watch and watch specs as request attributes
            request.setAttribute("previewwatch", db.getWatch(id));
            request.setAttribute("previewwatchspec", db.getWatchSpecs(id));
            request.getRequestDispatcher("UpdateItem.jsp").forward(request, response);
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
        try {
            int id = Integer.parseInt(request.getParameter("watchid"));
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
            db.updateWatch(newWatch, id);
            db.updateWatchSpecs(newWatchSpecs, id);

            Part part = request.getPart("myFile");
            if(!part.getSubmittedFileName().isEmpty()){
            String realPath = request.getServletContext().getRealPath("/images");
            String filename = name + ".jpg";
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            Files.deleteIfExists(Paths.get(realPath + "/" + filename));
            part.write(realPath + "/" + filename);
            }
            // Redirect to the welcome page after adding the item 
            request.getRequestDispatcher("Products.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("Products.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

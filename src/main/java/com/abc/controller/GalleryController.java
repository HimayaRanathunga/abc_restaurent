package com.abc.controller;

import com.abc.service.GalleryService;
import com.abc.model.Gallery;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/gallery")
@MultipartConfig
public class GalleryController extends HttpServlet {
    private GalleryService galleryService;

    public void init() {
        galleryService = new GalleryService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the action parameter and handle null case
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";  // Default action when null
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteGallery(request, response);
                    break;
                case "list":
                default:
                    listGalleries(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";  // Default action when null in POST requests
        }

        try {
            switch (action) {
                case "insert":
                    insertGallery(request, response);
                    break;
                case "update":
                    updateGallery(request, response);
                    break;
                default:
                    listGalleries(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listGalleries(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Gallery> galleries = galleryService.getAllGalleries();
        request.setAttribute("galleries", galleries);
        request.getRequestDispatcher("/WEB-INF/view/gallery-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/gallery-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Gallery existingGallery = galleryService.getGalleryById(id);
        request.setAttribute("gallery", existingGallery);
        request.getRequestDispatcher("/WEB-INF/view/gallery-form.jsp").forward(request, response);
    }

    private void insertGallery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageName;
        imagePart.write(imagePath);

        Gallery gallery = new Gallery(title, description, "uploads/" + imageName);
        galleryService.addGallery(gallery);
        response.sendRedirect("gallery");
    }

    private void updateGallery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageName;
        imagePart.write(imagePath);

        Gallery gallery = new Gallery(id, title, description, "uploads/" + imageName);
        galleryService.updateGallery(gallery);
        response.sendRedirect("gallery");
    }

    private void deleteGallery(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        galleryService.deleteGallery(id);
        response.sendRedirect("gallery");
    }
}

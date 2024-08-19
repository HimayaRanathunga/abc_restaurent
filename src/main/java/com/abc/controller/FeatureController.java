package com.abc.controller;

import com.abc.model.Feature;
import com.abc.service.FeatureService;

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

@WebServlet("/featuresadmin")
@MultipartConfig
public class FeatureController extends HttpServlet {
    private FeatureService featureService;

    public void init() throws ServletException {
        featureService = new FeatureService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
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
                    deleteFeature(request, response);
                    break;
                case "list":
                default:
                    listFeatures(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/feature-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Feature existingFeature = featureService.getFeatureById(id);
        request.setAttribute("feature", existingFeature);
        request.getRequestDispatcher("/WEB-INF/view/feature-form.jsp").forward(request, response);
    }

    private void deleteFeature(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        featureService.deleteFeature(id);
        response.sendRedirect("featuresadmin?action=list");
    }

    private void listFeatures(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Feature> featureList = featureService.getAllFeatures();
        request.setAttribute("featureList", featureList);
        request.getRequestDispatcher("/WEB-INF/view/feature-list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("insert")) {
                insertFeature(request, response);
            } else if (action.equals("update")) {
                updateFeature(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void insertFeature(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Part iconPart = request.getPart("icon");
        Part imagePart = request.getPart("image");

        // Upload directories
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save files
        String iconFileName = iconPart.getSubmittedFileName();
        String imageFileName = imagePart.getSubmittedFileName();

        iconPart.write(uploadPath + File.separator + iconFileName);
        imagePart.write(uploadPath + File.separator + imageFileName);

        Feature feature = new Feature();
        feature.setTitle(title);
        feature.setDescription(description);
        feature.setIcon("uploads/" + iconFileName);
        feature.setImageUrl("uploads/" + imageFileName);

        featureService.addFeature(feature);
        response.sendRedirect("featuresadmin?action=list");
    }

    private void updateFeature(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Feature feature = featureService.getFeatureById(id); // Get the existing feature

        Part iconPart = request.getPart("icon");
        Part imagePart = request.getPart("image");

        // Upload directories
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save files only if they were uploaded
        if (iconPart != null && iconPart.getSize() > 0) {
            String iconFileName = iconPart.getSubmittedFileName();
            iconPart.write(uploadPath + File.separator + iconFileName);
            feature.setIcon("uploads/" + iconFileName);
        }

        if (imagePart != null && imagePart.getSize() > 0) {
            String imageFileName = imagePart.getSubmittedFileName();
            imagePart.write(uploadPath + File.separator + imageFileName);
            feature.setImageUrl("uploads/" + imageFileName);
        }

        feature.setTitle(title);
        feature.setDescription(description);

        featureService.updateFeature(feature);
        response.sendRedirect("featuresadmin?action=list");
    }
}

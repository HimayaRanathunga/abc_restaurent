package com.abc.controller;

import com.abc.model.Promotion;
import com.abc.service.PromotionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/promotions")
@MultipartConfig
public class PromotionServlet extends HttpServlet {

    private PromotionService promotionService;

    @Override
    public void init() throws ServletException {
        promotionService = new PromotionService();
    }

    @Override
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
                    deletePromotion(request, response);
                    break;
                case "list":
                default:
                    listPromotions(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
                    insertPromotion(request, response);
                    break;
                case "update":
                    updatePromotion(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listPromotions(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Promotion> promotionList = promotionService.getAllPromotions();
        request.setAttribute("promotionList", promotionList);
        request.getRequestDispatcher("/WEB-INF/view/promotion-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/promotion-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int promotionId = Integer.parseInt(request.getParameter("promotionId"));
        Promotion existingPromotion = promotionService.getPromotionById(promotionId);
        request.setAttribute("promotion", existingPromotion);
        request.getRequestDispatcher("/WEB-INF/view/promotion-form.jsp").forward(request, response);
    }

    private void insertPromotion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double offRate = Double.parseDouble(request.getParameter("offRate"));

        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageName;
        imagePart.write(imagePath);

        Promotion promotion = new Promotion();
        promotion.setTitle(title);
        promotion.setDescription(description);
        promotion.setOffRate(offRate);
        promotion.setImageUrl("uploads/" + imageName);

        promotionService.addPromotion(promotion);

        response.sendRedirect("promotions?action=list");
    }

    private void updatePromotion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int promotionId = Integer.parseInt(request.getParameter("promotionId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double offRate = Double.parseDouble(request.getParameter("offRate"));

        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageName;
        imagePart.write(imagePath);

        Promotion promotion = new Promotion();
        promotion.setPromotionId(promotionId);
        promotion.setTitle(title);
        promotion.setDescription(description);
        promotion.setOffRate(offRate);
        promotion.setImageUrl("uploads/" + imageName);

        promotionService.updatePromotion(promotion);

        response.sendRedirect("promotions?action=list");
    }

    private void deletePromotion(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int promotionId = Integer.parseInt(request.getParameter("promotionId"));
        promotionService.deletePromotion(promotionId);
        response.sendRedirect("promotions?action=list");
    }
}

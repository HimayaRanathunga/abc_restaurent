package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.abc.model.Product;
import com.abc.model.Promotion;
import com.abc.service.ProductService;
import com.abc.service.PromotionService;

@WebServlet("/index")
public class IndexController extends HttpServlet {
    private ProductService productService;
    private PromotionService promotionService;

    public void init() throws ServletException {
        productService = new ProductService();
        promotionService = new PromotionService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Product> productList = productService.getAllProducts();
            List<Promotion> promotionList = promotionService.getAllPromotions();
            request.setAttribute("productList", productList);
            request.setAttribute("promotionList", promotionList);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve products or promotions", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); 
    }
}

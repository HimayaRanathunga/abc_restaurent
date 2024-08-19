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
import com.abc.service.ProductService;

@WebServlet("/menu")
public class Menucotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService;

    public void init() throws ServletException {
        productService = new ProductService();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Product> productList = productService.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/WEB-INF/view/menu.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve products", e);
        }
    }

    // Handle POST requests (optional, depending on your design)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);  // Delegate to the doGet method
    }
}

package com.abc.controller;

import com.abc.model.Product;
import com.abc.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewCart"; 
        }

        switch (action) {
            case "addToCart":
                addToCart(request, response);
                break;
            case "increase":
                changeQuantity(request, response, 1);  
                break;
            case "decrease":
                changeQuantity(request, response, -1); 
                break;
            case "remove":
                removeFromCart(request, response);
                break;
            case "viewCart":
            default:
                viewCart(request, response);
                break;
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        
        int quantity = 1; 
        try {
            String quantityParam = request.getParameter("quantity");
            if (quantityParam != null && !quantityParam.isEmpty()) {
                quantity = Integer.parseInt(quantityParam);
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid quantity provided. Using default value of 1.");
        }

        try {
            Product product = productService.getProductById(productId);

            Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }

            cart.put(product, cart.getOrDefault(product, 0) + quantity);

            session.setAttribute("cart", cart);
            
            response.sendRedirect("cart?action=viewCart");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error adding product to cart", e);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response, int change) throws IOException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");

        if (cart != null) {
            for (Product product : cart.keySet()) {
                if (product.getProductId() == productId) {
                    int newQuantity = cart.get(product) + change;
                    if (newQuantity <= 0) {
                        cart.remove(product); 
                    } else {
                        cart.put(product, newQuantity);  
                    }
                    break;
                }
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart?action=viewCart");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        int productId = Integer.parseInt(request.getParameter("productId"));
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");

        if (cart != null) {
            cart.entrySet().removeIf(entry -> entry.getKey().getProductId() == productId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart?action=viewCart");
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/cart.jsp").forward(request, response);
    }
}

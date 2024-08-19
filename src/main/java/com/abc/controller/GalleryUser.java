package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Gallery;
import com.abc.model.Product;
import com.abc.service.GalleryService;

@WebServlet("/galleryuser")
public class GalleryUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private GalleryService galleryService;

    public void init() {
        galleryService = new GalleryService();
    }

    // Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
        	List<Gallery> galleries = galleryService.getAllGalleries();
            request.setAttribute("galleries", galleries);
            request.getRequestDispatcher("/WEB-INF/view/gallery.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve gallery", e);
        }
    }




protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    doGet(request, response);  // Delegate to the doGet method
}

}

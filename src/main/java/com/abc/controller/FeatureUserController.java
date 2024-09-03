package com.abc.controller;

import com.abc.model.Feature;
import com.abc.service.FeatureService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/features")
public class FeatureUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeatureService featureService;

    public FeatureUserController() {
        super();
        featureService = new FeatureService(); // Initialize FeatureService
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Feature> featureList = featureService.getAllFeatures();
            
            request.setAttribute("featureList", featureList);
            
            request.getRequestDispatcher("/WEB-INF/view/features.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve features", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); 
    }
}

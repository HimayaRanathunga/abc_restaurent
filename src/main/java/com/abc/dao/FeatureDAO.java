package com.abc.dao;

import com.abc.model.Feature;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeatureDAO {

    // Use the existing DBConnection class for getting database connections
    private Connection getConnection() throws SQLException {
        return DBConnection.getConnection();  // Use the DBConnection class
    }

    // Add a new feature to the database
    public void addFeature(Feature feature) throws SQLException {
        String sql = "INSERT INTO features (title, description, icon, image_url) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feature.getTitle());
            stmt.setString(2, feature.getDescription());
            stmt.setString(3, feature.getIcon());
            stmt.setString(4, feature.getImageUrl());
            stmt.executeUpdate();
        }
    }

    // Update an existing feature in the database
    public void updateFeature(Feature feature) throws SQLException {
        String sql = "UPDATE features SET title = ?, description = ?, icon = ?, image_url = ? WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, feature.getTitle());
            stmt.setString(2, feature.getDescription());
            stmt.setString(3, feature.getIcon());
            stmt.setString(4, feature.getImageUrl());
            stmt.setInt(5, feature.getId());
            stmt.executeUpdate();
        }
    }

    // Delete a feature from the database by ID
    public void deleteFeature(int id) throws SQLException {
        String sql = "DELETE FROM features WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Retrieve a feature by its ID
    public Feature getFeatureById(int id) throws SQLException {
        String sql = "SELECT * FROM features WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Feature(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
                                   rs.getString("icon"), rs.getString("image_url"));
            }
        }
        return null;
    }

    // Retrieve all features from the database
    public List<Feature> getAllFeatures() throws SQLException {
        List<Feature> features = new ArrayList<>();
        String sql = "SELECT * FROM features";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Feature feature = new Feature(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
                                              rs.getString("icon"), rs.getString("image_url"));
                features.add(feature);
            }
        }
        return features;
    }
}

package com.abc.dao;

import com.abc.model.Feature;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeatureDAO {

    private Connection getConnection() throws SQLException {
        return DBConnection.getConnection();  
    }

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

    public void deleteFeature(int id) throws SQLException {
        String sql = "DELETE FROM features WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

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

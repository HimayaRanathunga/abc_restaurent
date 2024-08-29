package com.abc.dao;

import com.abc.model.Promotion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PromotionDAO {

    public void addPromotion(Promotion promotion) throws SQLException {
        String sql = "INSERT INTO promotions (title, description, image_url, off_rate) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, promotion.getTitle());
            stmt.setString(2, promotion.getDescription());
            stmt.setString(3, promotion.getImageUrl());
            stmt.setDouble(4, promotion.getOffRate());
            stmt.executeUpdate();
        }
    }

    public List<Promotion> getAllPromotions() throws SQLException {
        String sql = "SELECT * FROM promotions";
        List<Promotion> promotions = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Promotion promotion = new Promotion();
                promotion.setPromotionId(rs.getInt("promotion_id"));
                promotion.setTitle(rs.getString("title"));
                promotion.setDescription(rs.getString("description"));
                promotion.setImageUrl(rs.getString("image_url"));
                promotion.setOffRate(rs.getDouble("off_rate"));
                promotions.add(promotion);
            }
        }
        return promotions;
    }

    public Promotion getPromotionById(int promotionId) throws SQLException {
        String sql = "SELECT * FROM promotions WHERE promotion_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, promotionId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Promotion promotion = new Promotion();
                    promotion.setPromotionId(rs.getInt("promotion_id"));
                    promotion.setTitle(rs.getString("title"));
                    promotion.setDescription(rs.getString("description"));
                    promotion.setImageUrl(rs.getString("image_url"));
                    promotion.setOffRate(rs.getDouble("off_rate"));
                    return promotion;
                }
            }
        }
        return null;
    }

    public void updatePromotion(Promotion promotion) throws SQLException {
        String sql = "UPDATE promotions SET title = ?, description = ?, image_url = ?, off_rate = ? WHERE promotion_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, promotion.getTitle());
            stmt.setString(2, promotion.getDescription());
            stmt.setString(3, promotion.getImageUrl());
            stmt.setDouble(4, promotion.getOffRate());
            stmt.setInt(5, promotion.getPromotionId());
            stmt.executeUpdate();
        }
    }

    public void deletePromotion(int promotionId) throws SQLException {
        String sql = "DELETE FROM promotions WHERE promotion_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, promotionId);
            stmt.executeUpdate();
        }
    }
}

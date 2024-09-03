package com.abc.dao;

import com.abc.model.Gallery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {

    public void insertGallery(Gallery gallery) throws SQLException {
        String sql = "INSERT INTO gallery (title, description, image_url) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, gallery.getTitle());
            stmt.setString(2, gallery.getDescription());
            stmt.setString(3, gallery.getImageUrl());
            stmt.executeUpdate();
        }
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        List<Gallery> galleries = new ArrayList<>();
        String sql = "SELECT * FROM gallery";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Gallery gallery = new Gallery(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("image_url")
                );
                galleries.add(gallery);
            }
        }
        return galleries;
    }

    public Gallery getGalleryById(int id) throws SQLException {
        String sql = "SELECT * FROM gallery WHERE id = ?";
        Gallery gallery = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                gallery = new Gallery(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("image_url")
                );
            }
        }
        return gallery;
    }

    public void updateGallery(Gallery gallery) throws SQLException {
        String sql = "UPDATE gallery SET title = ?, description = ?, image_url = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, gallery.getTitle());
            stmt.setString(2, gallery.getDescription());
            stmt.setString(3, gallery.getImageUrl());
            stmt.setInt(4, gallery.getId());
            stmt.executeUpdate();
        }
    }

    public void deleteGallery(int id) throws SQLException {
        String sql = "DELETE FROM gallery WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}

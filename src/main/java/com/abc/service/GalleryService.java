package com.abc.service;

import com.abc.dao.GalleryDAO;
import com.abc.model.Gallery;

import java.sql.SQLException;
import java.util.List;

public class GalleryService {
    private GalleryDAO galleryDAO;

    public GalleryService() {
        galleryDAO = new GalleryDAO();
    }

    public void addGallery(Gallery gallery) throws SQLException {
        galleryDAO.insertGallery(gallery);
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        return galleryDAO.getAllGalleries();
    }

    public Gallery getGalleryById(int id) throws SQLException {
        return galleryDAO.getGalleryById(id);
    }

    public void updateGallery(Gallery gallery) throws SQLException {
        galleryDAO.updateGallery(gallery);
    }

    public void deleteGallery(int id) throws SQLException {
        galleryDAO.deleteGallery(id);
    }
}

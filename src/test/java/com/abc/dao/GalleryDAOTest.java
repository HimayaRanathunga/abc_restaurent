package com.abc.dao;

import com.abc.model.Gallery;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class GalleryDAOTest {

    private GalleryDAO galleryDAO;
    private Connection mockConnection;
    private PreparedStatement mockPreparedStatement;
    private ResultSet mockResultSet;

    @BeforeEach
    public void setUp() throws SQLException {
        mockConnection = Mockito.mock(Connection.class);
        mockPreparedStatement = Mockito.mock(PreparedStatement.class);
        mockResultSet = Mockito.mock(ResultSet.class);
        galleryDAO = new GalleryDAO();
    }

    @Test
    public void testInsertGallery() throws SQLException {
        Gallery gallery = new Gallery(1, "Title1", "Description1", "image1.png");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        galleryDAO.insertGallery(gallery);

        verify(mockPreparedStatement).setString(1, gallery.getTitle());
        verify(mockPreparedStatement).setString(2, gallery.getDescription());
        verify(mockPreparedStatement).setString(3, gallery.getImageUrl());
        verify(mockPreparedStatement).executeUpdate();
    }

    @Test
    public void testGetAllGalleries() throws SQLException {
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true).thenReturn(false); // First returns true, then false
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getString("title")).thenReturn("Title1");
        when(mockResultSet.getString("description")).thenReturn("Description1");
        when(mockResultSet.getString("image_url")).thenReturn("image1.png");

        assertNotNull(galleryDAO.getAllGalleries());
        assertEquals(1, galleryDAO.getAllGalleries().size());
    }

    @Test
    public void testGetGalleryById() throws SQLException {
        int galleryId = 1;

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getInt("id")).thenReturn(galleryId);
        when(mockResultSet.getString("title")).thenReturn("Title1");
        when(mockResultSet.getString("description")).thenReturn("Description1");
        when(mockResultSet.getString("image_url")).thenReturn("image1.png");

        Gallery gallery = galleryDAO.getGalleryById(galleryId);

        assertNotNull(gallery);
        assertEquals(galleryId, gallery.getId());
        assertEquals("Title1", gallery.getTitle());
        assertEquals("Description1", gallery.getDescription());
        assertEquals("image1.png", gallery.getImageUrl());

        verify(mockPreparedStatement).setInt(1, galleryId);
    }

    @Test
    public void testUpdateGallery() throws SQLException {
        Gallery gallery = new Gallery(1, "UpdatedTitle", "UpdatedDescription", "updated_image.png");

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        galleryDAO.updateGallery(gallery);

        verify(mockPreparedStatement).setString(1, gallery.getTitle());
        verify(mockPreparedStatement).setString(2, gallery.getDescription());
        verify(mockPreparedStatement).setString(3, gallery.getImageUrl());
        verify(mockPreparedStatement).setInt(4, gallery.getId());
        verify(mockPreparedStatement).executeUpdate();
    }

    @Test
    public void testDeleteGallery() throws SQLException {
        int galleryId = 1;

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);

        galleryDAO.deleteGallery(galleryId);

        verify(mockPreparedStatement).setInt(1, galleryId);
        verify(mockPreparedStatement).executeUpdate();
    }
}

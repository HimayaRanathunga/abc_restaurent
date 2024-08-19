package com.abc.service;

import com.abc.dao.FeatureDAO;
import com.abc.model.Feature;
import java.sql.SQLException;
import java.util.List;

public class FeatureService {
    private FeatureDAO featureDAO;

    public FeatureService() {
        featureDAO = new FeatureDAO();
    }

    public void addFeature(Feature feature) throws SQLException {
        featureDAO.addFeature(feature);
    }

    public void updateFeature(Feature feature) throws SQLException {
        featureDAO.updateFeature(feature);
    }

    public void deleteFeature(int id) throws SQLException {
        featureDAO.deleteFeature(id);
    }

    public Feature getFeatureById(int id) throws SQLException {
        return featureDAO.getFeatureById(id);
    }

    public List<Feature> getAllFeatures() throws SQLException {
        return featureDAO.getAllFeatures();
    }
}

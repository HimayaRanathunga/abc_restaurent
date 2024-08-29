package com.abc.service;

import com.abc.dao.PromotionDAO;
import com.abc.model.Promotion;

import java.sql.SQLException;
import java.util.List;

public class PromotionService {
    private PromotionDAO promotionDAO;

    public PromotionService() {
        this.promotionDAO = new PromotionDAO();
    }

    public void addPromotion(Promotion promotion) throws SQLException {
        promotionDAO.addPromotion(promotion);
    }

    public List<Promotion> getAllPromotions() throws SQLException {
        return promotionDAO.getAllPromotions();
    }

    public Promotion getPromotionById(int promotionId) throws SQLException {
        return promotionDAO.getPromotionById(promotionId);
    }

    public void updatePromotion(Promotion promotion) throws SQLException {
        promotionDAO.updatePromotion(promotion);
    }

    public void deletePromotion(int promotionId) throws SQLException {
        promotionDAO.deletePromotion(promotionId);
    }
}

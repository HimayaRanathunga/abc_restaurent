package com.abc.model;

public class Promotion {
    private int promotionId;
    private String title;
    private String description;
    private String imageUrl;
    private double offRate;

    // Getters and Setters
    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getOffRate() {
        return offRate;
    }

    public void setOffRate(double offRate) {
        this.offRate = offRate;
    }
}

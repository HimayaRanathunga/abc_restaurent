package com.abc.model;

public class Feature {
    private int id;
    private String title;
    private String description;
    private String icon;
    private String imageUrl;

    public Feature() {}

    public Feature(int id, String title, String description, String icon, String imageUrl) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.icon = icon;
        this.imageUrl = imageUrl;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}

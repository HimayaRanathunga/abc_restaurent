package com.abc.model;

public class Product {
	
	
	 private int productId;
	    private String name;
	    private String description;
	    private Double price;
	    private String imageUrl;
	    
		public Product(int productId, String name, String description, Double price, String imageUrl) {
			this.productId = productId;
			this.name = name;
			this.description = description;
			this.price = price;
			this.imageUrl = imageUrl;
		}

		public Product() {
		}

		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Double getPrice() {
			return price;
		}

		public void setPrice(Double price) {
			this.price = price;
		}

		public String getImageUrl() {
			return imageUrl;
		}

		public void setImageUrl(String imageUrl) {
			this.imageUrl = imageUrl;
		}
		
		
	    
	    

}

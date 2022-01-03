package com.crud.dto;

import com.crud.entity.Category;
import com.crud.entity.ProductReview;

import javax.persistence.*;
import java.util.List;

public class ProductDTO {

    private Long id;
    private String productName;
    private Double productPrice;
    private Long productQuantity;
    private Boolean productStatus;
    private com.crud.entity.Category Category;
    private List<ProductReview> productReviews;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Long getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Long productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Boolean getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Boolean productStatus) {
        this.productStatus = productStatus;
    }

    public com.crud.entity.Category getCategory() {
        return Category;
    }

    public void setCategory(com.crud.entity.Category category) {
        Category = category;
    }

    public List<ProductReview> getProductReviews() {
        return productReviews;
    }

    public void setProductReviews(List<ProductReview> productReviews) {
        this.productReviews = productReviews;
    }
}

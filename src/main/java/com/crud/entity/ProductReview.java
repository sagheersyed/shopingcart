package com.crud.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product_review")
public class ProductReview {

    @Id
    @Column(name = "product_id")
    private Long productReviewId;
    @Column(name = "description")
    private String description;
    @MapsId
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product product;
    private Double ratingCount;
    @ManyToOne(fetch = FetchType.EAGER)
    private UserEntity userEntityList;

    public ProductReview() {}

    public ProductReview(Long productReviewId, String description, Product product, Double ratingCount, UserEntity userEntityList) {
        this.productReviewId = productReviewId;
        this.description = description;
        this.product = product;
        this.ratingCount = ratingCount;
        this.userEntityList = userEntityList;
    }

    public Long getProductReview() {
        return productReviewId;
    }

    public void setProductReview(Long productReviewId) {
        this.productReviewId = productReviewId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(Double ratingCount) {
        this.ratingCount = ratingCount;
    }

    public UserEntity getUserEntityList() {
        return userEntityList;
    }

    public void setUserEntityList(UserEntity userEntityList) {
        this.userEntityList = userEntityList;
    }

    @Override
    public String toString() {
        return "ProductReview{" +
                "productReviewId=" + productReviewId +
                ", description='" + description + '\'' +
                ", ratingCount=" + ratingCount +
                '}';
    }
}

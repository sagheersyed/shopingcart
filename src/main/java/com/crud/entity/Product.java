package com.crud.entity;

import javax.persistence.*;
import com.crud.entity.Category;
import lombok.Data;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "product")
@Data
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;
    @Column(name = "productName" , unique = true , nullable = false)
    private String productName;
    @Column(nullable = false)
    private Double productPrice;
    private Long productQuantity;
    private Boolean productStatus;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category Category;
    @OneToMany
    @JoinColumn(name = "product_id")
    private List<ProductReview> productReviews;
    public Product() {
    }

    public Product(Long id, String productName, Double productPrice, Long productQuantity, Boolean productStatus, com.crud.entity.Category category) {
        this.id = id;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productStatus = productStatus;
        Category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return id.equals(product.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productName='" + productName + '\'' +
                ", productPrice=" + productPrice +
                ", productQuantity=" + productQuantity +
                ", productStatus=" + productStatus +
                ", Category='" + Category + '\'' +
                '}';
    }
}

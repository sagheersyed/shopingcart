package com.crud.entity;

import net.bytebuddy.implementation.bind.annotation.Default;
import org.hibernate.annotations.GeneratorType;

import javax.persistence.*;

@Entity
@Table(name = "product_inventory")
public class ProductInventory {
    @Id
    @Column(name = "product_id")
    private Long id;
    @OneToOne
    @MapsId
    @JoinColumn(name = "product_id")
    private Product product;
    private Long Quantity;

    public ProductInventory() {
    }

    public ProductInventory(Long id, Product product, Long quantity) {
        this.id = id;
        Quantity = quantity;
        this.product = product;
    }

    @Column(scale = 0)
    public Long getQuantity() {
        return Quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(Long quantity) {
        Quantity = quantity;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "ProductInventory{" +
                "id=" + id +
                ", product=" + product +
                ", Quantity=" + Quantity +
                '}';
    }
}

package com.crud.entity;

import javax.persistence.*;
import java.util.Deque;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Stack;

@Entity
@Table(name = "category")
public class Category {
    @Id
    private Long id;
    private String categoryName;
    @Column(length = 150)
    private String description;
    private String imageUrl;
    @OneToMany(fetch = FetchType.LAZY)
    private List<Product> productList;

    public Category() {
    }

    public Category(Long id, String categoryName, List<Product> productList , String description , String imageUrl) {
        this.id = id;
        this.categoryName = categoryName;
        this.productList = productList;
        this.description = description;
        this.imageUrl = imageUrl;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getImageUrl(){
        return imageUrl;
    }

    public void setImageUrl(String imageUrl){
        this.imageUrl = imageUrl;
    }


    @Override
    public String toString() {
//        Deque<Integer> dq = null; int i = dq.removeFirst();
        return "Category{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                ", description='" + description + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
        //PriorityQueue<Category> q = new PriorityQueue<>((a, b) -> a.compareTo(b) );
        //Deque<Integer> dq; int i = dq.removeFirst();
    }



}


package com.crud.service;

import com.crud.entity.ProductInventory;
import com.crud.entity.Product;
import com.crud.entity.ProductReview;
import com.crud.repository.ProductInventoryRepository;
import com.crud.repository.ProductRepository;
import com.crud.repository.ProductReviewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private ProductInventoryRepository productInventoryRepository;

    @Autowired
    private ProductReviewsRepository productReviewsRepository;

    public Product save(Product product){
       Product savedProduct = productRepository.save(product);
        ProductInventory productInventory = new ProductInventory();
        productInventory.setProduct(savedProduct);
        productInventory.setQuantity(0l);
        productInventoryRepository.save(productInventory);
        ProductReview productReview = new ProductReview();
        productReview.setProduct(savedProduct);
        productReview.setDescription("your product is very good");
        productReview.setRatingCount(0D);
        productReviewsRepository.save(productReview);
        return savedProduct;
    }

    public Product getProduct(Long id){
        Product product = productRepository.findById(id).get();
        return product;
    }

    public List<Product> getListProduct(){
        return productRepository.findAll();
    }

    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }

    public boolean updateProduct(Product product){
        Optional<Product> oldProduct = productRepository.findById(product.getId());
        if (oldProduct.isPresent()){
            product.setProductName(product.getProductName());
            product.setProductPrice(product.getProductPrice());
            product.setProductQuantity(product.getProductQuantity());
            product.setProductStatus(product.getProductStatus());
            product.setCategory(product.getCategory());
            productRepository.save(product);
            return true;
        }
        return false;
    }

}

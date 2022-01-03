package com.crud.service;

import com.crud.entity.ProductInventory;
import com.crud.repository.ProductInventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductInventoryService {

    @Autowired
    ProductInventoryRepository productInventoryRepository;

    public ProductInventory saveProduct(ProductInventory productInventory){
        return productInventoryRepository.save(productInventory);
    }

    public ProductInventory getInventory(Long id){
        return productInventoryRepository.getById(id);
    }

    public boolean updateInventory(ProductInventory productInventory){
        Optional<ProductInventory> oldInventory = productInventoryRepository.findById(productInventory.getId());
        if(oldInventory.isPresent()){
            productInventory.setQuantity(productInventory.getQuantity());
            productInventoryRepository.save(productInventory);
            return true;
        }
        return false;
    }

    public List<ProductInventory> getProductInventoryList(){
        return productInventoryRepository.findAll();
    }

}

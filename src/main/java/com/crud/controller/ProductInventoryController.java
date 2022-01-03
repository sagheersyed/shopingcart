package com.crud.controller;

import com.crud.entity.ProductInventory;
import com.crud.repository.ProductInventoryRepository;
import com.crud.service.ProductInventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/productInventory")
public class ProductInventoryController {

    @Autowired
    private ProductInventoryService productInventoryService;

    @GetMapping("/{id}")
    public String getInventory(@PathVariable Long id , ModelMap map){
        map.addAttribute("updateInventory" , productInventoryService.getInventory(id));
        return "product/inventory/update";
    }
    @PostMapping("/update")
    public String updateInventory(ProductInventory inventory){
        productInventoryService.updateInventory(inventory);
        return "success";
    }

}

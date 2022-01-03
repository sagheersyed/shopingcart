package com.crud.controller;

import com.crud.entity.Category;
import com.crud.repository.CategoryRepository;
import com.crud.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String getCategoryForm(ModelMap modelMap , Category category){
        modelMap.addAttribute("category" , category);
        return "category/update_category";
    }

    @GetMapping("/{id}")
    public String getCategory(@PathVariable Long id , ModelMap map){
        map.addAttribute("category" , categoryService.getCategory(id));
        return "category/update_category";
    }

    @PostMapping("/update")
    public String updateCategory(@ModelAttribute("category") Category category){
        categoryService.updateCategory(category);
        return "redirect:/product/home";
    }

}

package com.crud.service;

import com.crud.entity.Category;
import com.crud.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public Category saveCategory(Category category){
        return categoryRepository.save(category);
    }

    public List<Category> categoryList(){
        return categoryRepository.findAll();
    }

    public Category getCategory(Long id){
        return categoryRepository.findById(id).get();
    }

    public boolean updateCategory(Category category){
        Optional<Category> oldCategory = (categoryRepository.findById(category.getId()));
        if(oldCategory.isPresent()){
            Category newCategory = oldCategory.get();
//            newCategory.setId(oldCategory.get().getId());
            newCategory.setCategoryName(category.getCategoryName());
            newCategory.setDescription(category.getDescription());
            categoryRepository.save(newCategory);
            return true;
        }
        return false;
    }

    public void deleteCategory(Long id){
        categoryRepository.deleteById(id);
    }

}

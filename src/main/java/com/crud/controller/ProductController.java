package com.crud.controller;

import com.crud.entity.CartItem;
import com.crud.entity.Category;
import com.crud.entity.Product;
import com.crud.service.CategoryService;
import com.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
//    private Product product;
//    private Category category;

    @GetMapping("/create")
    public String getProduct(ModelMap modelMap, Product product){
        modelMap.addAttribute("product" , product);
        modelMap.addAttribute("listCategory" , categoryService.categoryList());
        return "product/productForm";
    }
    @PostMapping("/save")
    public String newProduct(@ModelAttribute Product product){
        productService.save(product);
        return "redirect:/product/";
    }

    @GetMapping("/")
    public String listProduct(ModelMap map){
        map.addAttribute("listProduct" , productService.getListProduct());
        map.addAttribute("listCategory" , categoryService.categoryList());
        return "product/productList";
    }

    @GetMapping("/edit/{id}")
    public String editProduct(@PathVariable Long id , ModelMap modelMap){
        Product product = productService.getProduct(id);
        modelMap.addAttribute("product" , product);
        modelMap.addAttribute("listCategory" , categoryService.categoryList());
        return "product/update";
    }

    @PostMapping("/update")
    public String updateProduct(@ModelAttribute Product product){
        productService.updateProduct(product);
        return "redirect:/product/";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/product/";
    }

//    public <T> List<T> sortingObjects(T a){
//        if(a == product){
//        List<Product> p =  productService.getListProduct().stream().sorted(
//                    Comparator.comparing(Product::getProductPrice).reversed()).collect(Collectors.toList());
//        return List<p>;
//        }
//        else if(a == category){
//            categoryService.categoryList().stream().sorted(
//                    Comparator.comparing(Category::getCategoryName)).collect(Collectors.toList());
//        }
//        return null;
//    }

    @GetMapping("/home")
    public String form(ModelMap map){
        map.addAttribute("listProduct" , productService.getListProduct().stream().sorted(Comparator.comparing(Product::getProductPrice).reversed()).collect(Collectors.toList()));
        List<Category> list = categoryService.categoryList();
        map.addAttribute("listCategory" , list.stream().sorted(Comparator.comparing(Category::getCategoryName)).collect(Collectors.toList()));
        return "product/homeProduct";
    }



    @RequestMapping(path = "/test", method = RequestMethod.GET,  consumes= MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Product test(@RequestParam long productId){
        Product product = productService.getProduct(productId);
        return product;
    }
}
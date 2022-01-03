package com.crud.controller;

import com.crud.entity.Product;
import com.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/favourite")
public class FavoriteController {

    @Autowired
    private ProductService productService;

//    List<Product> productList = new ArrayList<>();
    @PostMapping("/add/{id}")
    @ResponseBody
    public Set<Product> addFavouriteProducts(@PathVariable Long id, HttpSession httpSession){
        Product product = productService.getProduct(id);
        Set<Product> favouriteProducts = (Set<Product>) httpSession.getAttribute("favorites");
        if(favouriteProducts == null){
            favouriteProducts = new HashSet<>();
            httpSession.setAttribute("favorites", favouriteProducts);
        }
        favouriteProducts.add(product);
        return favouriteProducts;
    }
}
//list of favourite products.


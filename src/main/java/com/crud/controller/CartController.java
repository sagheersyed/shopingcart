package com.crud.controller;

import com.crud.entity.Cart;
import com.crud.entity.CartItem;
import com.crud.entity.Product;
import com.crud.service.ProductInventoryService;
import com.crud.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@RequestMapping("/cart")
@Controller
public class CartController {
    @Autowired
    private ProductService productService;

    @Autowired
    private ProductInventoryService productInventoryService;

    @PostMapping("/add/{productId}")
    public @ResponseBody Cart addToCart(@PathVariable long productId, HttpSession session){
        Product product = productService.getProduct(productId);
        Cart cart = (Cart) session.getAttribute("cart");
        Optional<CartItem> result = cart.getItems().stream().filter(c -> c.getProduct().getId() == productId).findFirst();
        if(result.isPresent()){
            CartItem cartItem = result.get();
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
        else{
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(1);
            cart.getItems().add(cartItem);
        }
        System.out.println(cart.getItems().size());
        return cart;
    }

    @GetMapping("/shoppingCart")
    public String getShoppingCart(HttpSession session , ModelMap modelMap){
        Cart cart = (Cart) session.getAttribute("cart");
        List<CartItem> cartItemList = cart.getItems();
        modelMap.addAttribute("cartItemList" , cartItemList);
        Double totalAmount = 0.0;
        /*for (int i = 0; i < cartItemList.size(); i++) {
            totalAmount += (int) (cartItemList.get(i).getProduct().getProductPrice()*cartItemList.get(i).getQuantity());
        }*/
        totalAmount = cartItemList.stream().map(cartItem -> cartItem.getQuantity() * cartItem.getProduct().getProductPrice()).reduce(0.0, Double::sum);
        //modelMap.addAttribute("totalAmount" , totalAmount);
        System.out.println(totalAmount);
//        System.out.println(cart.getItems().get(1).getProduct().getId());
//        System.out.println(productList.get(1).getId());
        return "cart/carts";
    }


    @GetMapping("/shoppingCart/{id}")
    public void removeProduct(ModelMap modelMap , HttpSession session , @PathVariable Long id){
        Product product = new Product();
        modelMap.addAttribute("product" , product);
        System.out.println("my product " + product);
    }
}



package com.crud.config;

import com.crud.entity.Cart;
import com.crud.entity.CartItem;
import com.crud.entity.Product;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication authentication) {
        HttpSession session = request.getSession(true);
        if (session != null) {
            session.setAttribute("cart", new Cart());
            session.setAttribute("love" , new Product());
            session.setAttribute("totalAmount" , new CartItem());
        }
    }
}

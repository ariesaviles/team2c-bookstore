package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserCartHasBooksEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;


    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String displayCart(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        //Iterable<UserCartHasBooksEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        model.addAttribute("cartForm", books);

        return "cart";
    }

}

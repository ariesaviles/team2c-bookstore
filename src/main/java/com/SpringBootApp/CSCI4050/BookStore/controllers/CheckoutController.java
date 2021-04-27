package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.AddressRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.DecimalFormat;

@Controller
public class CheckoutController {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    private AddressRepository addressRepository;

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String displayCheckout(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        Iterable<BookEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        model.addAttribute("cartForm", books);
        model.addAttribute("total", cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice());
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("addressTable", addressRepository.findByUser_IDuser(user.getIDuser()));

        return "checkout";
    }
}

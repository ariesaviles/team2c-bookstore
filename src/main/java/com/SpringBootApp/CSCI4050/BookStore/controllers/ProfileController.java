package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

@Controller
public class ProfileController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AddressRepository addressRepository;

    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String display(ModelMap model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        model.addAttribute("username", user.getUserName());
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("birthDate", user.getBirthDate());
        model.addAttribute("isPromotion", user.getIsPromotion());
        model.addAttribute("addressForm", addressRepository.findAll());
        return "userProfile";
    }
}

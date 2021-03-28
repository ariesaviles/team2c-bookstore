package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class LoginController {

    @Autowired
    private AccountRepository accountRepo;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model) {
        model.addAttribute("loginForm", new UserAccountEntity());
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Object submitLoginIn(@ModelAttribute("loginForm") UserAccountEntity accountForm, Model model) {
        UserAccountEntity accountInstance = accountRepo.findByEmail("andino.rochon@gmail.com");
        //UserAccountEntity accountInstance = accountRepo.findByEmail(accountForm.getEmail().toLowerCase());
        //password un-encrypt
        if (accountInstance == null || !(accountInstance.getPassword().matches(accountForm.getPassword()))) {
            System.out.println("Email / Password does not exist");
            System.out.println(accountInstance);
            return "login";
        }
        if (!(accountInstance == null || !(accountInstance.getPassword().matches(accountForm.getPassword())))) {
            System.out.println("The email exists");
            return "login";

        }
        return null;
    }
}

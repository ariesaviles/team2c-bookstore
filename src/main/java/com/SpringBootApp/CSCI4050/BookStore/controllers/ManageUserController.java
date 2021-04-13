package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManageUserController {
    @Autowired
    private AccountRepository accountRepository;

    @RequestMapping(value = "/manageUsers", method = RequestMethod.GET)
    public String displayUsers(Model model){
        model.addAttribute("accountForm", accountRepository.findAll());
        return "manageUsers";
    }


}

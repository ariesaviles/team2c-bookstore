package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManageUserController {
    @Autowired
    private AccountRepository accountRepository;

    @RequestMapping(value = "/adminManageUsers", method = RequestMethod.GET)
    public String displayUsers(Model model){
        model.addAttribute("accountForm", accountRepository.findAll());
        return "adminManageUsers";
    }

    @RequestMapping(value = "/changeStatus", method = RequestMethod.GET)
    public String deactivateUser(@RequestParam("email") String email, Model model){
        UserAccountEntity accountForm = accountRepository.findByEmail(email);
        if(accountForm.getUserState().equals("Active")) {
            accountForm.setUserState("Suspended");
        }else{
            accountForm.setUserState("Active");
        }
        accountRepository.save(accountForm);
        return "redirect:/adminManageUsers";
    }

    @RequestMapping(value = "/changeAdminStatus", method = RequestMethod.GET)
    public String changeAdminStatus(@RequestParam("email") String email, Model model){
        UserAccountEntity accountForm = accountRepository.findByEmail(email);
        if(accountForm.getIsAdmin()) {
            accountForm.setIsAdmin(false);
        }else{
            accountForm.setIsAdmin(true);
        }
        accountRepository.save(accountForm);
        return "redirect:/adminManageUsers";
    }

}

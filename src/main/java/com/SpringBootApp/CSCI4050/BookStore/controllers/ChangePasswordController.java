package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import java.io.IOException;
import java.security.Principal;

@Controller
public class ChangePasswordController {
    @Autowired
    private AccountRepository accountRepository;

    private Email sendEmail;

    public ChangePasswordController(AccountRepository accountRepository){
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String showEditProfilePage(ModelMap model, Principal principal){
        return "changePassword";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("accountForm") UserAccountEntity accountForm, Model model, Principal principal) throws IOException, MessagingException {
        UserAccountEntity emailCheck = accountRepository.findByEmail(accountForm.getEmail());
        if(emailCheck == null){
            model.addAttribute("emailMessage", "This email does not have an account");
        }
        else{
            model.addAttribute("emailMessage", "Confirmation Email Has Been Sent");
            sendEmail = new Email();
            sendEmail.sendmail(accountForm.getEmail(), "PASSWORD RESET", "Go to this link to change your password: http://localhost:8080/confirmChangePassword");
        }
        return "changePassword";
    }
}

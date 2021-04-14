package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.security.PermitAll;
import javax.mail.MessagingException;
import java.io.IOException;
import java.security.Principal;

@Controller
public class ChangePasswordController {
    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    private Email sendEmail;
    private String userEmail;

    public ChangePasswordController(AccountRepository accountRepository){
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "/changePasswordEmail", method = RequestMethod.GET)
    public String showChangePasswordEmail(ModelMap model){
        model.addAttribute("passwordForm", new UserAccountEntity());
        return "changePasswordEmail";
    }

    @RequestMapping(value = "/changePasswordEmail", method = RequestMethod.POST)
    public Object sendChangePassword(@ModelAttribute("passwordForm") UserAccountEntity accountForm, Model model) throws IOException, MessagingException {
        UserAccountEntity emailCheck = accountRepository.findByEmail(accountForm.getEmail());
        if(emailCheck == null){
            model.addAttribute("emailMessage", "This email does not have an account");
        }
        else{
            model.addAttribute("emailMessage", "Confirmation Email Has Been Sent");
            sendEmail = new Email();
            userEmail = accountForm.getEmail();
            sendEmail.sendmail(userEmail, "PASSWORD RESET", "Go to this link to change your password: http://localhost:8080/changePasswordConfirm");
        }
        return "changePasswordEmail";
    }

    @RequestMapping(value = "/changePasswordConfirm", method = RequestMethod.GET)
    public String showChangePassword(ModelMap model){
        UserAccountEntity user = accountRepository.findByEmail(userEmail);
        model.addAttribute("accountForm", user);
        return "changePasswordConfirm";
    }

    @RequestMapping(value = "/changePasswordConfirm", method = RequestMethod.POST)
    public Object changePassword(@ModelAttribute("accountForm") UserAccountEntity accountForm, Model model) throws IOException, MessagingException {
        UserAccountEntity user = accountRepository.findByEmail(userEmail);
        if(!accountForm.getFirstName().equals(accountForm.getLastName())){
            model.addAttribute("passwordMessage", "Passwords do not macth");
            return "changePasswordConfirm";
        }
        else{
            user.setPassword(passwordEncoder.encode(accountForm.getFirstName()));
            accountRepository.save(user);
            return "redirect:/";
        }

    }

}

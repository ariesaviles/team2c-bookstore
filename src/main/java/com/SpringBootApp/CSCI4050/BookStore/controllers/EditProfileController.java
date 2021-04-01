package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;

@Controller
public class EditProfileController {

    @Autowired
    private AccountRepository accountRepository;

    private Email sendEmail;

    public EditProfileController(AccountRepository accountRepository){
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String showEditProfilePage(ModelMap model, Principal principal){
        //NEED TO PASS USER AS INSTANCE
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        model.addAttribute("accountForm", user);
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        model.addAttribute("userName", user.getUserName());
        model.addAttribute("birthDate", user.getBirthDate());
        return "editProfile";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("accountForm") UserAccountEntity accountForm, BindingResult bindingResult,
                                  Model model, HttpServletRequest request, Principal principal) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        user.setFirstName(accountForm.getFirstName());
        user.setLastName(accountForm.getLastName());
        user.setUserName(accountForm.getUserName());
        user.setBirthDate(accountForm.getBirthDate());

        //accountRepository.save(accountForm);
        //sendEmail = new Email();
        //sendEmail.sendmail(accountForm.getEmail(), "Registration Successful","Thank you for signing up for Team 2C Bookstore Service");
        return "redirect:/login";
    }

}
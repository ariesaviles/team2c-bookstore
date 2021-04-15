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
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("isPromotion", user.getIsPromotion());
        return "editProfile";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("accountForm") UserAccountEntity accountForm, Model model,  Principal principal) throws IOException, MessagingException {

        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        user.setUserName(accountForm.getUserName());
        user.setFirstName(accountForm.getFirstName());
        user.setLastName(accountForm.getLastName());
        user.setBirthDate(accountForm.getBirthDate());

        accountRepository.save(user);

        sendEmail = new Email();
        sendEmail.sendmail(user.getEmail(), "User Info","Some of your user information in your account has been changed.");
        return "redirect:/userProfile";
    }

    @RequestMapping(value = "/changePromoStatus", method = RequestMethod.GET)
    public String promoSet(Principal principal, Model model){
        UserAccountEntity accountForm = accountRepository.findByEmail(principal.getName());
        System.out.println(accountForm.getIsPromotion());
        if(accountForm.getIsPromotion()) {
            accountForm.setIsPromotion(false);
        }else{
            accountForm.setIsPromotion(true);
        }
        accountRepository.save(accountForm);
        return "redirect:/editProfile";
    }



}
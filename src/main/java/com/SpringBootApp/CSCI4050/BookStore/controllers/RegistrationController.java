package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.AddressEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.AddressRepository;
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

@Controller
public class RegistrationController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private PasswordEncoder encoder;

    private Email sendEmail;

    public RegistrationController(AccountRepository accountRepository){
        this.accountRepository = accountRepository;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String showRegistrationPage(ModelMap model){
        model.addAttribute("accountForm", new UserAccountEntity());
        model.addAttribute("addressForm", new AddressEntity());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("accountForm") UserAccountEntity accountForm, @ModelAttribute("addressForm") AddressEntity addressForm,
                                  BindingResult bindingResult, Model model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;
        UserAccountEntity emailCheck = accountRepository.findByEmail(accountForm.getEmail());
        UserAccountEntity userNameCheck = accountRepository.findByUserName(accountForm.getUserName());



        if(emailCheck != null){
            model.addAttribute("emailExist", "This email already has an account");
            problems = true;
        }
        if(userNameCheck != null){
            model.addAttribute("userNameExist", "Username in use");
            problems = true;
        }
        if(accountForm.getFirstName().isEmpty()){
            model.addAttribute("badFirst", "Please enter a first name");
            problems = true;
        }
        if(accountForm.getLastName().isEmpty()){
            model.addAttribute("badLast", "Please enter a last name");
            problems = true;
        }
        if(accountForm.getEmail().isEmpty()){
            model.addAttribute("badEmail", "Please enter an email");
            problems = true;
        }
        if(accountForm.getBirthDate().isEmpty()){
            model.addAttribute("badBirth", "Please enter a birthdate");
            problems = true;
        }
        if(accountForm.getPassword().isEmpty()){
            model.addAttribute("badPass", "Please enter a password");
            problems = true;
        }
        if(accountForm.getUserName().isEmpty()){
            model.addAttribute("badUser", "Please enter a username");
            problems = true;
        }
        if(problems){
            return  "registration";
        }
        accountForm.setFirstName(accountForm.getFirstName());
        accountForm.setEmail(accountForm.getEmail().toLowerCase());
        accountForm.setBirthDate(accountForm.getBirthDate());
        //System.out.println(passwordEncoder.encode(accountForm.getPassword()));
        accountForm.setPassword(encoder.encode(accountForm.getPassword()));
        accountForm.setUserName(accountForm.getUserName());
        accountForm.setLastName(accountForm.getLastName());
        accountForm.setUserState("Active");


        accountRepository.save(accountForm);

        if(!addressForm.getStreet().isEmpty()) {
            addressForm.setStreet(addressForm.getStreet());
            addressForm.setCity(addressForm.getCity());
            addressForm.setState(addressForm.getState());
            addressForm.setZipCode(addressForm.getZipCode());
            addressForm.setUser_IDuser(accountForm);
            addressRepository.save(addressForm);
        }


        sendEmail = new Email();
        sendEmail.sendmail(accountForm.getEmail(), "Registration Successful","Thank you for signing up for Team 2C Bookstore Service");
        return "redirect:/login";
    }



}

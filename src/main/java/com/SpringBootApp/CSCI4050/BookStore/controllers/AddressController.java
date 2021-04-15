package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.AddressEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;

@Controller
public class AddressController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AddressRepository addressRepository;


    public AddressController(AddressRepository addressRepository){
        this.addressRepository = addressRepository;
    }

    @RequestMapping(value = "/addAddress", method = RequestMethod.GET)
    public String showAddAddressPage(ModelMap model){
        model.addAttribute("addressForm", new AddressEntity());
        return "addAddress";
    }

    @RequestMapping(value = "/addAddress", method = RequestMethod.POST)
    public Object addAddress(@ModelAttribute("addressForm") AddressEntity addressForm, BindingResult bindingResult,
                          ModelMap model, Principal principal, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        boolean problems = false;

        if(addressForm.getStreet().isEmpty()){
            model.addAttribute("badStreet", "Please enter a last name");
            problems = true;
        }
        if(addressForm.getCity().isEmpty()){
            model.addAttribute("badCity", "Please enter an email");
            problems = true;
        }
        if(addressForm.getState().isEmpty()){
            model.addAttribute("badState", "Please enter a birthdate");
            problems = true;
        }
        if(addressForm.getZipCode() == 0){
            model.addAttribute("badZip", "Please enter a password");
            problems = true;
        }

        if(problems){
            return  "addAddress";
        }

        addressForm.setState(addressForm.getState());
        addressForm.setStreet(addressForm.getStreet());
        addressForm.setCity(addressForm.getCity());
        addressForm.setZipCode(addressForm.getZipCode());
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        addressForm.setUser_IDuser(user);

        addressRepository.save(addressForm);

        return "redirect:/userProfile";
    }
}

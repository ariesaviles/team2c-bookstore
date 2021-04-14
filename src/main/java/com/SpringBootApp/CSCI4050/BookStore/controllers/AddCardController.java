package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.CardRepository;
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
public class AddCardController {

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private PasswordEncoder cardNumberEncoder;

    public AddCardController(CardRepository cardRepository){
        this.cardRepository = cardRepository;
    }

    @RequestMapping(value = "/addCard", method = RequestMethod.GET)
    public String showRegistrationPage(ModelMap model){
        model.addAttribute("cardForm", new CardEntity());
        return "addCard";
    }

    @RequestMapping(value = "/addCard", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("cardForm") CardEntity cardForm, BindingResult bindingResult,
                                  Model model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;

        if(cardForm.getCardType().isEmpty()){
            model.addAttribute("badLast", "Please enter a last name");
            problems = true;
        }
        if(cardForm.getExpirationDate().equals("")){
            model.addAttribute("badEmail", "Please enter an email");
            problems = true;
        }
        if(cardForm.getCardNumber().isEmpty()){
            model.addAttribute("badBirth", "Please enter a birthdate");
            problems = true;
        }
        if(cardForm.getCardSecurity().isEmpty()){
            model.addAttribute("badPass", "Please enter a password");
            problems = true;
        }

        if(problems){
            return  "addCard";
        }

        cardForm.setCardType(cardForm.getCardType());
        cardForm.setExpirationDate(cardForm.getExpirationDate());
        cardForm.setCardNumber(cardNumberEncoder.encode(cardForm.getCardNumber()));
        cardForm.setCardSecurity(cardForm.getCardSecurity());

        cardRepository.save(cardForm);

        return "redirect:/userProfile";
    }


}

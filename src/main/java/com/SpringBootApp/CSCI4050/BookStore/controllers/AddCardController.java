package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
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
import java.security.Principal;

@Controller
public class AddCardController {

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private PasswordEncoder cardNumberEncoder;

    public AddCardController(CardRepository cardRepository){
        this.cardRepository = cardRepository;
    }

    @RequestMapping(value = "/addCard", method = RequestMethod.GET)
    public String showAddCardPage(ModelMap model){
        model.addAttribute("cardForm", new CardEntity());
        return "addCard";
    }

    @RequestMapping(value = "/addCard", method = RequestMethod.POST)
    public Object addCard(@ModelAttribute("cardForm") CardEntity cardForm, BindingResult bindingResult,
                                  ModelMap model, Principal principal, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        boolean problems = false;

        if(cardForm.getCardType().isEmpty()){
            model.addAttribute("badType", "Please enter a last name");
            problems = true;
        }
        if(cardForm.getExpirationDate().equals("")){
            model.addAttribute("badExp", "Please enter an email");
            problems = true;
        }
        if(cardForm.getCardNumber().isEmpty()){
            model.addAttribute("badNumber", "Please enter a birthdate");
            problems = true;
        }
        if(cardForm.getCardSecurity().isEmpty()){
            model.addAttribute("badSec", "Please enter a password");
            problems = true;
        }

        if(problems){
            return  "addCard";
        }

        cardForm.setCardType(cardForm.getCardType());
        cardForm.setExpirationDate(cardForm.getExpirationDate());
        cardForm.setCardNumber(cardNumberEncoder.encode(cardForm.getCardNumber()));
        cardForm.setCardSecurity(cardNumberEncoder.encode(cardForm.getCardSecurity()));
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        cardForm.setUser_IDuser(user);

        cardRepository.save(cardForm);

        return "redirect:/userProfile";
    }


}

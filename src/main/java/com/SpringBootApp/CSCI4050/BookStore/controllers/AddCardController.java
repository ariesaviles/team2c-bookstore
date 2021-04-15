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
import javax.servlet.http.HttpServletRequest;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.sql.*;
import java.text.SimpleDateFormat;

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
    public String showAddCardPage(ModelMap model, Principal principal) throws SQLException {
        // if > 3 cards redirect:/userProfile
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        // -------------------- set up SQL ------------------
        ResultSet resultSet = setUpSQL(user);

        // count cards for current signed in user
        int amountOfCards = 0;
        while(resultSet.next()) {
            amountOfCards++;
        }

        System.out.println("---------_Card Count Test in AddCardController------------");
        System.out.println("Number: " + amountOfCards);

        if(amountOfCards > 2) {
            return "redirect:/userProfile";
        }

        model.addAttribute("cardForm", new CardEntity());
        return "addCard";
    }

    @RequestMapping(value = "/addCard", method = RequestMethod.POST)
    public Object addCard(@ModelAttribute("cardForm") CardEntity cardForm, BindingResult bindingResult,
                                  ModelMap model, Principal principal, HttpServletRequest request) throws IOException, MessagingException {
        /*
        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }*/

        boolean problems = false;



        if(cardForm.getCardType().isEmpty()){
            model.addAttribute("badType", "Please enter a last name");
            problems = true;
        }
        if(cardForm.getExpirationDate().isEmpty()){
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
        cardForm.setCardHolderName(cardForm.getCardHolderName());
        cardForm.setCardNumber(cardNumberEncoder.encode(cardForm.getCardNumber()));
        cardForm.setCardSecurity(cardNumberEncoder.encode(cardForm.getCardSecurity()));
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        cardForm.setUser_IDuser(user);

        cardRepository.save(cardForm);

        return "redirect:/userProfile";
    }

    public ResultSet setUpSQL(UserAccountEntity user) throws SQLException {
        String driverName = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/mydb";
        //String dbName = "mydb";
        String userId = "adminuser";
        String password = "password";

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        connection = DriverManager.getConnection(connectionUrl, userId, password);
        statement = connection.createStatement();

        String sql = "SELECT * FROM card c WHERE c.user_IDuser = " + user.getIDuser();

        return resultSet = statement.executeQuery(sql);
    }

}

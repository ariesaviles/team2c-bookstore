package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
public class AddBooksController {

    @Autowired
    private BookRepository bookRepository;


    public AddBooksController(BookRepository bookRepository){
        this.bookRepository = bookRepository;
    }

    @RequestMapping(value = "/adminAddBook", method = RequestMethod.GET)
    public String showRegistrationPage(ModelMap model){
        model.addAttribute("bookForm", new BookEntity());
        return "adminAddBook";
    }

    @RequestMapping(value = "/adminAddBook", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("bookForm") BookEntity bookForm, BindingResult bindingResult,
                                  Model model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;
        if(bookForm.getAuthors().isEmpty()){
            model.addAttribute("badFirst", "Please enter a first name");
            problems = true;
        }
        if(bookForm.getEdition() == 0){
            model.addAttribute("badLast", "Please enter a last name");
            problems = true;
        }
        if(bookForm.getCategory().isEmpty()){
            model.addAttribute("badEmail", "Please enter an email");
            problems = true;
        }
        if(bookForm.getISBN().isEmpty()){
            model.addAttribute("badBirth", "Please enter a birthdate");
            problems = true;
        }
        if(bookForm.getPrice() == 0){
            model.addAttribute("badPass", "Please enter a password");
            problems = true;
        }
        if(bookForm.getPublisher().isEmpty()){
            model.addAttribute("badUser", "Please enter a username");
            problems = true;
        }
        if(bookForm.getTitle().isEmpty()){
            model.addAttribute("badEmail", "Please enter an email");
            problems = true;
        }
        if(bookForm.getPublishYear() == 0){
            model.addAttribute("badBirth", "Please enter a birthdate");
            problems = true;
        }
        if(bookForm.getQuantity() == 0){
            model.addAttribute("badPass", "Please enter a password");
            problems = true;
        }
        if(bookForm.getDescription().isEmpty()){
            model.addAttribute("badUser", "Please enter a username");
            problems = true;
        }
        if(bookForm.getBuyPrice() == 0){
            model.addAttribute("badBirth", "Please enter a birthdate");
            problems = true;
        }
        if(bookForm.getImgLink().isEmpty()){
            model.addAttribute("badUser", "Please enter a username");
            problems = true;
        }

        if(problems){
            return  "addBook";
        }

        bookForm.setAuthors(bookForm.getAuthors());
        bookForm.setEdition(bookForm.getEdition());
        bookForm.setCategory(bookForm.getCategory());
        bookForm.setISBN(bookForm.getISBN());
        bookForm.setPrice(bookForm.getPrice());
        bookForm.setPublisher(bookForm.getPublisher());
        bookForm.setPublishYear(bookForm.getPublishYear());
        bookForm.setTitle(bookForm.getTitle());
        bookForm.setDescription(bookForm.getDescription());
        bookForm.setImgLink(bookForm.getImgLink());
        bookForm.setQuantity(bookForm.getQuantity());
        bookForm.setBuyPrice(bookForm.getBuyPrice());



        bookRepository.save(bookForm);

        return "redirect:/admin_page.html";
    }


}

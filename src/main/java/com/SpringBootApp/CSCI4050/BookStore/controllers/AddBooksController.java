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
            model.addAttribute("badAuthors", "Please enter an author");
            problems = true;
        }
        if(bookForm.getEdition() == 0){
            model.addAttribute("badEdition", "Please enter an edition");
            problems = true;
        }
        if(bookForm.getCategory().isEmpty()){
            model.addAttribute("badCategory", "Please enter a category");
            problems = true;
        }
        if(bookForm.getISBN().isEmpty()){
            model.addAttribute("badISBN", "Please enter an ISBN");
            problems = true;
        }
        if(bookForm.getPrice() == 0){
            model.addAttribute("badPrice", "Please enter a price");
            problems = true;
        }
        if(bookForm.getPublisher().isEmpty()){
            model.addAttribute("badPublisher", "Please enter a publisher");
            problems = true;
        }
        if(bookForm.getTitle().isEmpty()){
            model.addAttribute("badTitle", "Please enter a title");
            problems = true;
        }
        if(bookForm.getPublishYear() == 0){
            model.addAttribute("badPublishYear", "Please enter a publish year");
            problems = true;
        }
        if(bookForm.getQuantity() == 0){
            model.addAttribute("badQuantity", "Please enter a quantity");
            problems = true;
        }
        if(bookForm.getDescription().isEmpty()){
            model.addAttribute("badDescription", "Please enter a description");
            problems = true;
        }
        if(bookForm.getBuyPrice() == 0){
            model.addAttribute("badBuyPrice", "Please enter a buy price");
            problems = true;
        }
        if(bookForm.getImgLink().isEmpty()){
            model.addAttribute("badImgLink", "Please enter a sell price");
            problems = true;
        }

        if(problems){
            return  "adminAddBook";
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

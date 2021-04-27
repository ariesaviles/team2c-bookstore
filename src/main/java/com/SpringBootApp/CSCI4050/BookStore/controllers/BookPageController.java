package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
public class BookPageController {
    @Autowired
    private BookRepository bookRepository;

//    @RequestMapping(value = "/bookPage", method = RequestMethod.GET)
//    public String displayBook(Model model, Principal principal) {
//        return "bookPage";
//    }

    @RequestMapping(value = "/bookPage", method = RequestMethod.GET)
    public String display(@RequestParam("title") String title,  ModelMap model, Principal principal) {
        System.out.println("book Form");
        BookEntity bookForm = bookRepository.findByTitle(title);
        System.out.println("============== book title:" + bookForm.getTitle());
        model.addAttribute("title", bookForm.getTitle());
        model.addAttribute("category", bookForm.getCategory());
        model.addAttribute("authors", bookForm.getAuthors());
        model.addAttribute("price", bookForm.getPrice());
        model.addAttribute("isbn", bookForm.getISBN());
        model.addAttribute("description", bookForm.getDescription());
        model.addAttribute("imageURL", bookForm.getImgLink());


//        System.out.println("-----------ProfileController-----------\n\n\n");
//        System.out.println(cardRepository.findByUser_IDuser(bookForm.getIDuser()));
        return "bookPage";
    }

}

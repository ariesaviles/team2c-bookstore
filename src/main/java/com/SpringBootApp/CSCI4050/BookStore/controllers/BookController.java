package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    public BookController(BookRepository bookRepository){
        this.bookRepository = bookRepository;
    }

    @RequestMapping(value = "/book", method = RequestMethod.GET)
    public String showBookPage(Model model){
        model.addAttribute("bookDescrip", new BookEntity());
        return "book";
    }


}

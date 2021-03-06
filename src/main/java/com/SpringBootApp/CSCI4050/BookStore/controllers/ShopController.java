package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.AddressEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserCartEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    private BookRepository bookRepository;

    /*
    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String displayBooks(Model model){
        model.addAttribute("bookForm", new BookEntity());
        return "shop";
    }

    @RequestMapping(value = "/shop", method = RequestMethod.POST)
    public Object searchBooks(@ModelAttribute("bookForm") BookEntity bookForm,
                                  BindingResult bindingResult, Model model, HttpServletRequest request) throws IOException, MessagingException {
        String search = bookForm.getTitle();
        System.out.println(search);

        return "shop";
    }
    */
/*
    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String displayBooks(@ModelAttribute("searchForm") BookEntity searchForm, Model model, Principal principal){

        model.addAttribute("bookForm", bookRepository.findAll());

        return "shop";
    }
*/

    @RequestMapping(value = "/shop", method = RequestMethod.GET)
    public String showResults(@RequestParam("title") String title, Model model){

        List<BookEntity> books = bookRepository.findRelatedTitle(title);
        books.addAll(bookRepository.findRelatedAuthors(title));
        books.addAll(bookRepository.findRelatedCategories(title));
        books.addAll(bookRepository.findRelatedISBN(title));

        model.addAttribute("bookForm", books);
        return "shop";
    }





/*
    @RequestMapping(value = "/changeStatus", method = RequestMethod.GET)
    public String deactivateUser(@RequestParam("email") String email, Model model){
        UserAccountEntity accountForm = accountRepository.findByEmail(email);
        if(accountForm.getUserState().equals("Active")) {
            accountForm.setUserState("Suspended");
        }else{
            accountForm.setUserState("Active");
        }
        accountRepository.save(accountForm);
        return "redirect:/adminManageUsers";
    }

    @RequestMapping(value = "/changeAdminStatus", method = RequestMethod.GET)
    public String changeAdminStatus(@RequestParam("email") String email, Model model){
        UserAccountEntity accountForm = accountRepository.findByEmail(email);
        if(accountForm.getIsAdmin()) {
            accountForm.setIsAdmin(false);
        }else{
            accountForm.setIsAdmin(true);
        }
        accountRepository.save(accountForm);
        return "redirect:/adminManageUsers";
    }
*/

}

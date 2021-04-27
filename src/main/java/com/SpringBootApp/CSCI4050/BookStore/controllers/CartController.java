package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserCartEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;

    private static DecimalFormat decimalFormat = new DecimalFormat("#.##");

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String displayCart(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        Iterable<BookEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        model.addAttribute("cartForm", books);
        model.addAttribute("total", decimalFormat.format(cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice()));
        model.addAttribute("userEmail", user.getEmail());

        return "cart";
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public String addToCart(@RequestParam("title") String title, Model model, Principal principal){
        BookEntity bookForm = bookRepository.findByTitle(title);
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        UserCartEntity thisCart = cartRepository.findByUser_IDuser(user.getIDuser());
        List<BookEntity> listOfBooks = thisCart.getBooksInCart();
        listOfBooks.add(bookForm);
        thisCart.setBooksInCart(listOfBooks);
//        thisCart.setTotalPrice(decimalFormat.format( thisCart.getTotalPrice() + bookForm.getPrice() ));

        cartRepository.save(thisCart);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/removeFromCart", method = RequestMethod.GET)
    public String removeFromCart(@RequestParam("title") String title, Model model, Principal principal){
        BookEntity bookForm = bookRepository.findByTitle(title);
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        UserCartEntity thisCart = cartRepository.findByUser_IDuser(user.getIDuser());
        List<BookEntity> listOfBooks = thisCart.getBooksInCart();
        listOfBooks.remove(bookForm);
        thisCart.setBooksInCart(listOfBooks);
        thisCart.setTotalPrice(thisCart.getTotalPrice() - bookForm.getPrice());

        cartRepository.save(thisCart);
        return "redirect:/cart";
    }

}

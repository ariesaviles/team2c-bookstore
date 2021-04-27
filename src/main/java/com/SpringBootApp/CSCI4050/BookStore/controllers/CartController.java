package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.*;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BooksInCartRepository;
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
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    BooksInCartRepository booksInCartRepository;

    private static DecimalFormat decimalFormat = new DecimalFormat("#.##");

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String displayCart(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        Iterable<UserCartHasBooksEntity> books = booksInCartRepository.findByUserId(user.getIDuser());
        model.addAttribute("cartForm", books);
        model.addAttribute("total", decimalFormat.format(cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice()));
        model.addAttribute("userEmail", user.getEmail());

        return "cart";
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public String addToCart(@RequestParam("title") String title, Model model, Principal principal){
        BookEntity bookForm = bookRepository.findByTitle(title);
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        UserCartEntity cart = cartRepository.findByUser_IDuser(user.getIDuser());
        List<UserCartHasBooksEntity> booksInCart = booksInCartRepository.findByUserId(user.getIDuser());

        boolean isInCart = false;
        double priceToAdd = bookForm.getPrice();
        for (UserCartHasBooksEntity userCartHasBooksEntity: booksInCart) {
            if (userCartHasBooksEntity.getBook().equals(bookForm)) {
                userCartHasBooksEntity.setCount(userCartHasBooksEntity.getCount() + 1);
                isInCart = true;
                booksInCartRepository.save(userCartHasBooksEntity);
            }
        }

        // if isInCart create new usercarthasbooks
        if (!isInCart) {
            UserCartHasBooksEntity newBookInCart = new UserCartHasBooksEntity();
            UserCartHasBooksKey key = new UserCartHasBooksKey();
            key.setIdBook(bookForm.getId());
            key.setIdUserCart(cart.getIdUserCart());
            newBookInCart.setId(key);
            newBookInCart.setBook(bookForm);
            newBookInCart.setUserCart(cart);
            newBookInCart.setCount(1);
            booksInCartRepository.save(newBookInCart);
        }

        cart.setTotalPrice(cart.getTotalPrice() + priceToAdd);
        cartRepository.save(cart);

//        thisCart.setTotalPrice(decimalFormat.format( thisCart.getTotalPrice() + bookForm.getPrice() ));

        return "redirect:/cart";
    }

    @RequestMapping(value = "/removeFromCart", method = RequestMethod.GET)
    public String removeFromCart(@RequestParam("title") String title, Model model, Principal principal){
        BookEntity bookForm = bookRepository.findByTitle(title);
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        UserCartEntity thisCart = cartRepository.findByUser_IDuser(user.getIDuser());
        List<UserCartHasBooksEntity> listOfBooks = thisCart.getBooksInCart();
        listOfBooks.remove(bookForm);
        thisCart.setBooksInCart(listOfBooks);
        thisCart.setTotalPrice(thisCart.getTotalPrice() - bookForm.getPrice());

        cartRepository.save(thisCart);
        return "redirect:/cart";
    }

}

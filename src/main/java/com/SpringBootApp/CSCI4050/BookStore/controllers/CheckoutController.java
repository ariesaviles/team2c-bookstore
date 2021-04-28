package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.OrderEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.*;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.List;

@Controller
public class CheckoutController {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private PromotionRepository promotionRepository;

    @Autowired
    private OrderRepository orderRepository;

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String displayCheckout(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        Iterable<BookEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        model.addAttribute("cartForm", books);
        model.addAttribute("total", cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice());
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("addressTable", addressRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("cardTable", cardRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("orderForm", new OrderEntity());

        return "checkout";
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String enterCheckout(@ModelAttribute("orderForm") OrderEntity orderForm, Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        List<BookEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        orderForm.setBooksInOrder(books);
        orderForm.setOrderDate("2021-04-05");
        orderForm.setAddress_IDaddress(addressRepository.findByUser_IDuser(user.getIDuser()).get(0));
        orderForm.setCard_IDcard(cardRepository.findByUser_IDuser(user.getIDuser()).get(0));
        orderForm.setUser_IDuser(user);

        orderForm.setPromotion_IDpromotion(promotionRepository.findByPromocode(orderForm.getPromotion_IDpromotion().toString()));

        orderRepository.save(orderForm);
        return "checkout";
    }

    @RequestMapping(value = "/confirmCheckout", method = RequestMethod.GET)
    public String confirmCheckout(Model model, Principal principal){

        return "confirmCheckout";
    }
}

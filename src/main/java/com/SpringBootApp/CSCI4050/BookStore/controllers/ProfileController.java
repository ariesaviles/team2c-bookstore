package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.OrderEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.OrderHasBooksEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.AddressRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.BooksInOrderRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.OrderRepository;
import com.SpringBootApp.CSCI4050.BookStore.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.stylesheets.LinkStyle;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private BooksInOrderRepository booksInOrderRepository;

    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String display(ModelMap model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        List<OrderEntity> order = orderRepository.findByUserIDUser(user.getIDuser());
        List<OrderHasBooksEntity> orderHasBooksEntities = new ArrayList<>();

        //System.out.println(order.get(0).getBooksInOrder().get(0).getBook().getTitle());

        for (OrderEntity o : order) {
            orderHasBooksEntities.addAll(booksInOrderRepository.getBooksFromOrder(o.getIdOrder()));
            //System.out.println(orderHasBooksEntities.get(0).getBook().getTitle());
        }


        // foreach book in orderHasBooksEntities get the books
        // foreach order in orderHasBooksEntities get the order
        List<BookEntity> books = new ArrayList<>();
        List<OrderEntity> orders = new ArrayList<>();
        List<Integer> ints = new ArrayList<>();

        for (OrderHasBooksEntity o : orderHasBooksEntities) {
            ints.add(o.getCount());
            books.add(o.getBook());
            orders.add(o.getOrder());

        }

        System.out.println(books.get(0).getAuthors());
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("lastName", user.getLastName());
        model.addAttribute("username", user.getUserName());
        model.addAttribute("userID", user.getIDuser());
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("birthDate", user.getBirthDate());
        model.addAttribute("isPromotion", user.getIsPromotion());
        model.addAttribute("addressTable", addressRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("cardTable", cardRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("bookTable", books);
        model.addAttribute("orderInfo", order);

//        System.out.println("-----------ProfileController-----------\n\n\n");
//        System.out.println(cardRepository.findByUser_IDuser(user.getIDuser()));
        return "userProfile";
    }
}

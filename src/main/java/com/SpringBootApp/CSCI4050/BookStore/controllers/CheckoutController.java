package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.*;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class CheckoutController {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    BooksInOrderRepository booksInOrderRepository;

    @Autowired
    BooksInCartRepository booksInCartRepository;

    @Autowired
    private AddressRepository addressRepository;

    @Autowired
    private CardRepository cardRepository;

    @Autowired
    private PromotionRepository promotionRepository;

    @Autowired
    private OrderRepository orderRepository;

    private static DecimalFormat decimalFormat = new DecimalFormat("#.##");

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String displayCheckout(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        Iterable<UserCartHasBooksEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        model.addAttribute("cartForm", books);
        model.addAttribute("total", decimalFormat.format(cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice()));
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("addressTable", addressRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("cardTable", cardRepository.findByUser_IDuser(user.getIDuser()));
        model.addAttribute("orderForm", new OrderEntity());

        return "checkout";
    }
/*
    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public String enterCheckout(@ModelAttribute("orderForm") OrderEntity orderForm, Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        List<UserCartHasBooksEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        //orderForm.setBooksInOrder(books);

        // get date
        String pattern = "yyyyMMdd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String curDate = simpleDateFormat.format(new Date());
        orderForm.setOrderDate(curDate);

        orderForm.setAddress_IDaddress(addressRepository.findByUser_IDuser(user.getIDuser()).get(0));
        orderForm.setCard_IDcard(cardRepository.findByUser_IDuser(user.getIDuser()).get(0));
        orderForm.setUser_IDuser(user);

        orderForm.setPromotion_IDpromotion(promotionRepository.findByPromocode(orderForm.getPromotion_IDpromotion().toString()));

        orderRepository.save(orderForm);

        // The logic for saving every order_has_books row needed
        for (UserCartHasBooksEntity book: books) {
            OrderHasBooksEntity hasBooks = new OrderHasBooksEntity();
            OrderHasBooksKey hasBooksKey = new OrderHasBooksKey();
            hasBooksKey.setIdBook(book.getBook().getId());
            hasBooksKey.setIdOrder(orderForm.getIdOrder());
            hasBooks.setId(hasBooksKey);
            hasBooks.setBook(book.getBook());
            hasBooks.setOrder(orderForm);
            hasBooks.setCount(book.getCount());
            booksInOrderRepository.save(hasBooks);

            // Also want to delete cart_has_books rows
            booksInCartRepository.delete(book);
        }
        //set usercart to have total price of 0
        UserCartEntity userCart = cartRepository.findByUser_IDuser(user.getIDuser());
        userCart.setTotalPrice(0);
        cartRepository.save(userCart);


        return "checkout";
    }
*/
    @RequestMapping(value = "/confirmCheckout", method = RequestMethod.GET)
    public String confirmCheckout(@RequestParam("address") Long address, @RequestParam("card") Long card, @RequestParam("promo") String promo, Model model, Principal principal){
        Optional<AddressEntity> findAddress = addressRepository.findById(address);
        AddressEntity sendAddress =  findAddress.get();
        Optional<CardEntity> findCard = cardRepository.findById(card);
        CardEntity sendCard = findCard.get();
        PromotionEntity usePromo = promotionRepository.findByPromocode(promo);

        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        double total = cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice();
        if(promo == ""){
            model.addAttribute("message", "");
            model.addAttribute("total", decimalFormat.format(total));
        }
        else if(usePromo == null){
            model.addAttribute("message", "Promo code was not valid");
            model.addAttribute("total", decimalFormat.format(total));
        }else{
            model.addAttribute("message", "Promo has been applied");
            double newTotal = total - (total * ((double)usePromo.getDiscount()/100));
            model.addAttribute("total", decimalFormat.format(newTotal));
            System.out.println(newTotal);
        }
        model.addAttribute("addressTable", sendAddress);
        model.addAttribute("cardTable", sendCard);
        model.addAttribute("name", user.getFirstName());
        model.addAttribute("promo", promo);

        return "confirmCheckout";
    }


    @RequestMapping(value = "/sendOrder", method = RequestMethod.GET)
    public String afterCheckout(@RequestParam("address") Long address, @RequestParam("card") Long card, @RequestParam("promo") String promo, @RequestParam("total") double total, Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        List<UserCartHasBooksEntity> books = cartRepository.findByUser_IDuser(user.getIDuser()).getBooksInCart();
        //orderForm.setBooksInOrder(books);
        OrderEntity orderForm = new OrderEntity();

        // get date
        String pattern = "yyyyMMdd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String curDate = simpleDateFormat.format(new Date());
        orderForm.setOrderDate(curDate);

        orderForm.setAddress_IDaddress(addressRepository.findById(address).get());
        orderForm.setCard_IDcard(cardRepository.findById(card).get());
        orderForm.setUser_IDuser(user);

        orderForm.setPromotion_IDpromotion(promotionRepository.findByPromocode(promo));

        orderRepository.save(orderForm);

        //set usercart to have total price of 0
        UserCartEntity userCart = cartRepository.findByUser_IDuser(user.getIDuser());
        userCart.setTotalPrice(0);

        // The logic for saving every order_has_books row needed
        for (UserCartHasBooksEntity book: books) {
            OrderHasBooksEntity hasBooks = new OrderHasBooksEntity();
            OrderHasBooksKey hasBooksKey = new OrderHasBooksKey();
            hasBooksKey.setIdBook(book.getBook().getId());
            hasBooksKey.setIdOrder(orderForm.getIdOrder());
            hasBooks.setId(hasBooksKey);
            hasBooks.setBook(book.getBook());
            hasBooks.setOrder(orderForm);
            hasBooks.setCount(book.getCount());
            booksInOrderRepository.save(hasBooks);

            // Also want to delete cart_has_books rows
            booksInCartRepository.delete(book);

            // delete book from usercart thing
            userCart.getBooksInCart().remove(book);
        }


        System.out.println("--------------------------------");
        System.out.println("Error happens before saving cart");
        cartRepository.save(userCart);

        return "sendOrder";
    }
}

package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
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

    private Email sendEmail;

    private static DecimalFormat decimalFormat = new DecimalFormat("#.##");

    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String displayCheckout(Model model, Principal principal) {
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        if(cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice() == 0){
            return "redirect:/cart";
        }

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
    public String confirmCheckout(@RequestParam("address") String address, @RequestParam("card") String card, @RequestParam("promo") String promo, Model model, Principal principal){
        AddressEntity sendAddress;
        UserAccountEntity user = accountRepository.findByEmail(principal.getName());
        if(address.equals("true") || addressRepository.findByUser_IDuser(user.getIDuser()).size() == 1){
            sendAddress = addressRepository.findByUser_IDuser(user.getIDuser()).get(0);
        }
        else{
            sendAddress = addressRepository.findByUser_IDuser(user.getIDuser()).get(1);
        }
        CardEntity sendCard;
        if(address.equals("true") || cardRepository.findByUser_IDuser(user.getIDuser()).size() == 1){
            sendCard = cardRepository.findByUser_IDuser(user.getIDuser()).get(0);
        }
        else{
            sendCard = cardRepository.findByUser_IDuser(user.getIDuser()).get(1);
        }

        PromotionEntity usePromo = promotionRepository.findByPromocode(promo);

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

        orderForm.setSubCost(cartRepository.findByUser_IDuser(user.getIDuser()).getTotalPrice());

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
        }

        // delete book from usercart thing
        userCart.getBooksInCart().removeAll(books);
        cartRepository.save(userCart);

        AddressEntity sendAddress = addressRepository.findById(address).get();
        String emailMessage = "Thank you for ordering from Team 2C Bookstore Service on " + curDate + ". Your total was $";
        emailMessage += total;
        emailMessage += ". Your order will be delivered to ";
        emailMessage += sendAddress.getStreet() + " " + sendAddress.getCity() + " "  + sendAddress.getState() + " " + sendAddress.getZipCode();
        sendEmail = new Email();
        sendEmail.sendmail(user.getEmail(), "OrderConfirmed",emailMessage);

        return "sendOrder";
    }
}

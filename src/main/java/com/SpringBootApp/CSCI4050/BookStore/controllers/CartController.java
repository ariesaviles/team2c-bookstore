package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {

    @Autowired
    Cart bookRepository;

    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public String addToCart(@RequestParam("promocode") String promocode, Model model){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        if(promoForm.getHasSent() == 0) {
            System.out.println("Send Emails here");
            promoForm.setHasSent(1);
        }
        promoRepository.save(promoForm);
        return "redirect:/adminManagePromo";
    }
}

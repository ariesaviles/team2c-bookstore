package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.PromotionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

@Controller
public class ManagePromotionController {

    @Autowired
    private PromotionRepository promoRepository;

    public ManagePromotionController(PromotionRepository promoRepository){
        this.promoRepository = promoRepository;
    }

    @RequestMapping(value = "/adminAddPromo", method = RequestMethod.GET)
    public String displayPromos(ModelMap model){
        model.addAttribute("promoForm", new PromotionEntity());
        return "adminAddPromo";
    }

    @RequestMapping(value = "/adminAddPromo", method = RequestMethod.POST)
    public Object addPromo(@ModelAttribute("promoForm") PromotionEntity promoForm, BindingResult bindingResult,
                           ModelMap model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;
        if(promoForm.getPromocode().isEmpty()){
            model.addAttribute("badPromoCode", "Please enter a valid Promo Code");
            problems = true;
        }
        if(promoForm.getDateStart().isEmpty()){
            model.addAttribute("badStart", "Please enter a valid start date");
            problems = true;
        }
        if(promoForm.getDateEnd().isEmpty()){
            model.addAttribute("badEnd", "Please enter a valid expiration date");
            problems = true;
        }
        if(promoForm.getDiscount() <= 0){
            model.addAttribute("badDiscount", "Please enter a valid Discount value");
            problems = true;
        }

        if(problems){
            return "addPromo";
        }

        promoForm.setPromocode(promoForm.getPromocode());
        promoForm.setDateEnd(promoForm.getDateEnd());
        promoForm.setDateStart(promoForm.getDateStart());
        promoForm.setDiscount(promoForm.getDiscount());

        promoRepository.save(promoForm);

        return "redirect:/admin_page.html";
    }


}


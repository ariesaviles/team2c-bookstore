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
public class PromotionsController {

    @Autowired
    private PromotionRepository promoRep;

    public PromotionsController(PromotionRepository promoRep){
        this.promoRep = promoRep;
    }

    @RequestMapping(value = "/adminPromo", method = RequestMethod.GET)
    public String showPromoPage(ModelMap model){
        model.addAttribute("promoForm", new PromotionEntity());
        return "adminPromo";
    }

    @RequestMapping(value = "/adminPromo", method = RequestMethod.POST)
    public Object addPromo(@ModelAttribute("promoForm") PromotionEntity promoForm, BindingResult bindingResult,
                           Model model, HttpServletRequest request) throws IOException, MessagingException {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;
        if(promoForm.getPromocode().isEmpty()){
            model.addAttribute("badPromoCode", "Please enter a valid Promo Code");
            problems = true;
        }
        if(promoForm.getDateStart().before(new Date())){
            model.addAttribute("badStart", "Please enter a valid start date");
            problems = true;
        }
        if(promoForm.getDateEnd().before(new Date())){
            model.addAttribute("badEnd", "Please enter a valid expiration date");
            problems = true;
        }
        if (promoForm.getDateEnd().before(promoForm.getDateStart())) {
            model.addAttribute("badOrder", "The end date should not be before the start date");
            problems = true;
        }
        if(promoForm.getDiscount() <= 0.00){
            model.addAttribute("badDiscount", "Please enter a valid Discount value");
            problems = true;
        }

        if(problems){
            return  "addBook";
        }

        promoForm.setPromocode(promoForm.getPromocode());
        promoForm.setDateEnd(promoForm.getDateEnd());
        promoForm.setDateStart(promoForm.getDateStart());
        promoForm.setDiscount(promoForm.getDiscount());

        promoRep.save(promoForm);

        return "redirect:/admin_page.html";
    }


}

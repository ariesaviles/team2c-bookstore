package com.SpringBootApp.CSCI4050.BookStore.controllers;

import com.SpringBootApp.CSCI4050.BookStore.Email;
import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
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
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;

@Controller
public class ManagePromotionController {

    @Autowired
    private PromotionRepository promoRepository;

    @Autowired
    private AccountRepository accountRepository;

    public ManagePromotionController(PromotionRepository promoRepository){
        this.promoRepository = promoRepository;
    }

    @RequestMapping(value = "/adminManagePromo", method = RequestMethod.GET)
    public String displayPromos(ModelMap model){
        model.addAttribute("promoForm", promoRepository.findAll());
        return "adminManagePromo";
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
    public String deactivateUser(@RequestParam("promocode") String promocode, Model model){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        if(promoForm.getHasSent() == 0) {
            System.out.println("Send Emails here");
            promoForm.setHasSent(1);
        }
        promoRepository.save(promoForm);
        return "redirect:/adminManagePromo";
    }

    @RequestMapping(value = "/editPromo", method = RequestMethod.GET)
    public String editPromoPage(@RequestParam("promocode") String promocode, ModelMap model){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        if(promoForm.getHasSent() == 1){
            return "redirect:/adminManagePromo";
        }
        model.addAttribute("promoForm", promoForm);
        model.addAttribute("promocode", promoForm.getPromocode());
        model.addAttribute("discount", promoForm.getDiscount());
        model.addAttribute("dateStart", promoForm.getDateStart());
        model.addAttribute("dateEnd", promoForm.getDateEnd());
        return "editPromo";
    }

    @RequestMapping(value = "/editPromo", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("promoForm") PromotionEntity promoForm, Model model) throws IOException, MessagingException {
        PromotionEntity promo = promoForm;
        promo.setPromocode(promoForm.getPromocode());
        promo.setDiscount(promoForm.getDiscount());
        promo.setDateStart(promoForm.getDateStart());
        promo.setDateEnd(promoForm.getDateEnd());

        promoRepository.save(promo);

        return "redirect:/adminManagePromo";
    }

    @RequestMapping(value = "/adminAddPromo", method = RequestMethod.GET)
    public String addPromosPage(ModelMap model){
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

        return "redirect:/adminManagePromo";
    }


}


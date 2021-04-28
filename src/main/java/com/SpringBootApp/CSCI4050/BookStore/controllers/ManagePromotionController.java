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
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

@Controller
public class ManagePromotionController {

    @Autowired
    private PromotionRepository promoRepository;

    @Autowired
    private AccountRepository accountRepository;
    private Email sendEmail;
    public ManagePromotionController(PromotionRepository promoRepository){
        this.promoRepository = promoRepository;
    }

    @RequestMapping(value = "/adminManagePromo", method = RequestMethod.GET)
    public String displayPromos(ModelMap model){
        model.addAttribute("promoForm", promoRepository.findAll());
        return "adminManagePromo";
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.GET)
    public String emailPromo(@RequestParam("promocode") String promocode){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        List<UserAccountEntity> users = accountRepository.getAccountsWithSubscription();
        if(promoForm.getHasSent() == 0) {
            System.out.println("Send Emails here");
            for (int i = 0; i < users.size(); i++) {
                sendEmail = new Email();
                sendEmail.sendmail(users.get(i).getEmail(), "New Promotion",promoForm.getPromocode());
                System.out.println("Email sent to:" + users.get(i).getEmail());
            }
            promoForm.setHasSent(1);
        }
        promoRepository.save(promoForm);
        return "redirect:/adminManagePromo";
    }

    @RequestMapping(value = "/deletePromo", method = RequestMethod.GET)
    public String deletePromo(@RequestParam("promocode") String promocode, Model model){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        if(promoForm.getHasSent() == 1){
            return "redirect:/adminManagePromo";
        }
        promoRepository.delete(promoForm);
        return "redirect:/adminManagePromo";
    }

    @RequestMapping(value = "/editPromo", method = RequestMethod.GET)
    public String editPromoPage(@RequestParam("promocode") String promocode, ModelMap model){
        PromotionEntity promoForm = promoRepository.findByPromocode(promocode);
        if(promoForm.getHasSent() == 1){
            return "redirect:/adminManagePromo";
        }

/*
        promoForm.setPromocode(promoForm.getPromocode());
        promoForm.setDiscount(promoForm.getDiscount());
        promoForm.setDateStart(promoForm.getDateStart());
        promoForm.setDateEnd(promoForm.getDateEnd());

        promoRepository.save(promoForm);

        return "redirect:/adminManagePromo";
*/

        model.addAttribute("promoForm", promoForm);
        model.addAttribute("promocode", promoForm.getPromocode());
        model.addAttribute("discount", promoForm.getDiscount());
        model.addAttribute("dateStart", promoForm.getDateStart());
        model.addAttribute("dateEnd", promoForm.getDateEnd());

        return "editPromo";
    }

    @RequestMapping(value = "/editPromo", method = RequestMethod.POST)
    public Object registerAccount(@ModelAttribute("promoForm") PromotionEntity promoForm, ModelMap model) throws IOException, MessagingException {
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
                           ModelMap model, HttpServletRequest request) throws IOException, MessagingException, NumberFormatException{

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        boolean problems = false;
        String pattern = "yyyyMMdd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String curDate = simpleDateFormat.format(new Date());

        PromotionEntity prom = promoRepository.findByPromocode(promoForm.getPromocode());
        if (prom != null) {
            model.addAttribute("badPromo", "Please enter a new promocode that is not already been used.");
            problems = true;
        }

        if(prom == null && promoForm.getPromocode().isEmpty()){
            model.addAttribute("badPromoCode", "Please enter a valid Promo Code");
            problems = true;
        }

        //positive =() before current date
        //0 if same
        // negative =() after current date
        boolean validDates = true;
        if(promoForm.getDateStart().isEmpty() || promoForm.getDateStart().length() != 8
        || curDate.compareTo(promoForm.getDateStart()) > 0) {
            model.addAttribute("badStart", "Please enter a valid start date");
            problems = true;
        }

        //we do not want start date before end date so it has to be negative
        if(promoForm.getDateStart().compareTo(promoForm.getDateEnd()) > 0) {
            model.addAttribute("badDates", "End date must be on or after start date");
            problems = true;
            validDates = false;
        } else {
            validDates = true;
        }

        if(validDates && (promoForm.getDateEnd().isEmpty() || promoForm.getDateEnd().length() != 8
        || curDate.compareTo(promoForm.getDateEnd()) > 0)){
            model.addAttribute("badEnd", "Please enter a valid expiration date");
            problems = true;
        }

        Integer dis;
        if (promoForm.getDiscount() % 1 == 0) {
            dis = promoForm.getDiscount();
        } else {
            dis = -1;
        }

        if (dis == null || dis == -1 || (promoForm.getDiscount() <= 0 || promoForm.getDiscount() >= 100)) {
            model.addAttribute("badPer", "Please enter a valid discount percentage");
            problems = true;
        }
        if(problems){
            return "adminAddPromo";
        }



        promoForm.setPromocode(promoForm.getPromocode());
        promoForm.setDateEnd(promoForm.getDateEnd());
        promoForm.setDateStart(promoForm.getDateStart());
        promoForm.setDiscount(promoForm.getDiscount());

        promoRepository.save(promoForm);

        emailPromo(promoForm.getPromocode());
        //sendEmail = new Email();
        //sendEmail.sendmail(promoForm.getEmail(), "New Promotion",promoForm.getPromocode());//getEmail(), "Registration Successful","Thank you for signing up for Team 2C Bookstore Service");

        return "redirect:/adminManagePromo";
    }


}


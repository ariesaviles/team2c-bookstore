package com.SpringBootApp.CSCI4050.BookStore.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RootController {


//    @RequestMapping(path = "/shop", method = RequestMethod.GET)
//    public String shop(Model model) {
//        return "shop";
//    }

    @RequestMapping(path = "/search", method = RequestMethod.GET)
    public String search(Model model) {
        return "search";
    }
    
//    @RequestMapping(path = "/bookPage", method = RequestMethod.GET)
//    public String bookPage(Model model) {
//        return "bookPage";
//    }

    @RequestMapping(path = "/checkout", method = RequestMethod.GET)
    public String checkout(Model model) {
        return "checkout";
    }

//    @RequestMapping(path="/cart", method = RequestMethod.GET)
//    public String cart(Model model) {
//        return "cart";
//    }

    @RequestMapping(path="/adminPanel", method = RequestMethod.GET)
    public String admin(Model model) {
        return "adminPanel";
    }

}

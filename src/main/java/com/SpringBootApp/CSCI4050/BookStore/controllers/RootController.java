package com.SpringBootApp.CSCI4050.BookStore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/shop")
public class RootController {

    @GetMapping("")
    public String shop(Model model) {
        return "shop";
    }

    /*
    @GetMapping("/cart.html")
    public String cart(Model model) {
        return "cart.html";
    }
    */

}

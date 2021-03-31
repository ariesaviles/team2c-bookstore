package com.SpringBootApp.CSCI4050.BookStore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/index")
public class RootController {

    @GetMapping("/shop")
    public String shop(ModelMap model) {
        return "/index/shop";
    }

    @GetMapping("/cart.html")
    public String cart(ModelMap model) {
        return "cart.html";
    }
}

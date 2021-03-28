package com.SpringBootApp.CSCI4050.BookStore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userProfile")
public class ProfileController {
    @GetMapping(value="")
    public String display(ModelMap Model) {
        return "userProfile";
    }
}

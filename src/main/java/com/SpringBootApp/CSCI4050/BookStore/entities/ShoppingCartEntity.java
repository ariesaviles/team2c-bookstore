package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.Entity;

@Entity(name = "shoppingCart")
public class ShoppingCartEntity {

    private List<BookEntity> books;
    private UserEntity user;

    
  
    
}

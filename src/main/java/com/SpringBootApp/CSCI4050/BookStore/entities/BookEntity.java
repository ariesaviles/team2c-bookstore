package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity(name = "book")
public class BookEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String title;
    private String authors;
    private int ISBN;
    private String genre;
    private int edition;
    private String publisher;
    private int publishYear;
    private double price;
    private String description;
    private String imgLink;
    private int quantity;

    @ManyToMany
    private Set<PromotionEntity> promotions;


    
    public String getTitle() {
        return title;
    }

    public String getAuthors() {
        return authors;
    }

    public int getISBN() {
        return ISBN;
    }

    public String getGenre() {
        return genre;
    }

    public int getEdition() {
        return edition;
    }

    public String getPub() {
        return publisher;
    }
  
    public int getPubYear() {
        return publishYear;
    }
    
    public double price() {
        return price;
    }
    
    public void setPrice(double price) {
      this.price = price;
    }
  
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
      this.description = description; 
    }
  
    public String getImgLink() {
        return imgLink;
    }
    
    public void setImgLink(String imgLink) {
      this.imgLink = imgLink;
    }
    
    public int getQuantity() {
        return quantity;
    }
  
    public void setQuantity(int quantity) {
      this.quantity = quantity;
    }
    
}

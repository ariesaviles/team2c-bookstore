package com.SpringBootApp.CSCI4050.BookStore.entities;


import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.Entity;

@Entity(name = "book")
public class BookEntity {

    private String title;
    private String authors;
    private int ISBN;
    private List<String> genre;
    private int edition;
    private String publisher;
    private int publishYear;
    private double price;
    private String description;
    private String imgLink;
    private int quantity;

    public Book(String title, String authors, int ISBN, List<String> genre, int edition, String publisher, int publishYear, double price, String description, String imgLink) { 
      this.title = title;
      this.authors = authors;
      this.ISBN = ISBN;
      this.genre = genre;
      this.edition = edition;
      this.publisher = publisher;
      this.publishYear = publishYear;
      this.price = price;
      this.description = description;
      this.imgLink = imgLink;
      this.quantity = quantity;
    }
    
    public String getTitle() {
        return title;
    }

    public String getAuthors() {
        return authors;
    }

    public int getISBN() {
        return ISBN;
    }

    public List<String> getGenre() {
        return genre;
    }

    public String getEdition() {
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
  
    public String getDescrip() {
        return description;
    }
    
    public void setDescrip(String description) {
      this.description = description; 
    }
  
    public String getImgLink() {
        return imgLink;
    }
    
    public void setImgLink(String imgLink) {
      this.imgLink = ingLink; 
    }
    
    public int getQuantity() {
        return quantity;
    }
  
    public void setQuantity(int quantity) {
      this.quantity = quantity;
    }
    
}

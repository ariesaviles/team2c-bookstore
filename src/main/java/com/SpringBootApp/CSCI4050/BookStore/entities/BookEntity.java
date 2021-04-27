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

    @Column(name = "isbn")
    private String ISBN;

    @Column(name = "category")
    private String category;

    @Column(name = "title")
    private String title;

    @Column(name = "authors_names")
    private String authors;

//    @Column(name = "genre")
//    private String genre;

    @Column(name = "edition")
    private int edition;

    @Column(name = "publisher")
    private String publisher;

    @Column(name = "publication_year")
    private int publishYear;

    @Column(name = "selling_price")
    private double price;

    @Column(name = "buying_price")
    private double buyPrice;

    @Lob
    @Column(name = "description")
    private String description;

    @Column(name = "cover_picture")
    private String imgLink;

    @Column(name = "quantity_in_stock")
    private int quantity;

//    @Column(name = "minimum_threshold")
//    private int minimumThreshold;

    @OneToMany(mappedBy = "book")
    List<UserCartHasBooksEntity> userCartHasBooks;

    @ManyToMany(mappedBy = "booksInOrder")
    private Set<OrderEntity> areInOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthors() {
        return authors;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
            this.category = category;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public double getPrice() {
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

    public double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(double buyPrice) {
        this.buyPrice = buyPrice;
    }


    
}

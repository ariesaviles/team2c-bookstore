package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import javax.persistence.*;
import java.sql.Date;
import java.util.List;


@Entity(name = "usercart_has_books")
public class UserCartHasBooksEntity {

    @EmbeddedId
    UserCartHasBooksKey id;

    @ManyToOne
    @MapsId("idUserCart")
    @JoinColumn(name = "usercart_idusercart")
    UserCartEntity userCart;

    @ManyToOne
    @MapsId("id")
    @JoinColumn(name = "book_id")
    BookEntity book;

    @Column(name = "count")
    int count;

    public UserCartHasBooksKey getId() {
        return id;
    }

    public void setId(UserCartHasBooksKey id) {
        this.id = id;
    }

    public UserCartEntity getUserCart() {
        return userCart;
    }

    public void setUserCart(UserCartEntity userCart) {
        this.userCart = userCart;
    }

    public BookEntity getBook() {
        return book;
    }

    public void setBook(BookEntity book) {
        this.book = book;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}

package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;

@Entity(name = "usercart")
public class UserCartEntity {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "idusercart")
    private Long idUserCart;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_iduser", referencedColumnName = "iduser")
    private UserAccountEntity user_iduser;

    @Column(name = "totalprice")
    private double totalPrice;

    @ManyToMany
    @JoinTable(
            name = "usercart_has_books",
            joinColumns = @JoinColumn(name = "usercart_idusercart"),
            inverseJoinColumns = @JoinColumn(name = "book_id", referencedColumnName = "id")
    )
    private Set<BookEntity> booksInCart;

    public Long getIdUserCart() {
        return idUserCart;
    }

    public void setIdUserCart(Long idUserCart) {
        this.idUserCart = idUserCart;
    }

    public UserAccountEntity getUser_iduser() {
        return user_iduser;
    }

    public void setUser_iduser(UserAccountEntity user_iduser) {
        this.user_iduser = user_iduser;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

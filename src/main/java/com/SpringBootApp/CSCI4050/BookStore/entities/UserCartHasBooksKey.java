package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class UserCartHasBooksKey implements Serializable {

    @Column(name = "usercart_idusercart")
    Long idUserCart;

    @Column(name = "book_id")
    Long idBook;

    public long getIdUserCart() {
        return idUserCart;
    }

    public void setIdUserCart(Long idUserCart) {
        this.idUserCart = idUserCart;
    }

    public Long getIdBook() {
        return idBook;
    }

    public void setIdBook(Long idBook) {
        this.idBook = idBook;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserCartHasBooksKey that = (UserCartHasBooksKey) o;
        return idUserCart.equals(that.idUserCart) &&
                idBook.equals(that.idBook);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idUserCart, idBook);
    }
}

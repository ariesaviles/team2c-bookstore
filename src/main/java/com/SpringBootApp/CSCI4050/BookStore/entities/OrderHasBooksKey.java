package com.SpringBootApp.CSCI4050.BookStore.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class OrderHasBooksKey implements Serializable {

    @Column(name = "order_idorder")
    Long idOrder;

    @Column(name = "book_id")
    Long idBook;

    public Long getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(Long idOrder) {
        this.idOrder = idOrder;
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
        OrderHasBooksKey that = (OrderHasBooksKey) o;
        return Objects.equals(idOrder, that.idOrder) &&
                Objects.equals(idBook, that.idBook);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idOrder, idBook);
    }
}

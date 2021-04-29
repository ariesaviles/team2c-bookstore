package com.SpringBootApp.CSCI4050.BookStore.entities;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity(name = "order_has_books")
public class OrderHasBooksEntity {

    @EmbeddedId
    OrderHasBooksKey id;

    @ManyToOne
    @MapsId("idorder")
    @JoinColumn(name = "order_idorder", foreignKey = @ForeignKey(name = "none"))
    OrderEntity order;

    @ManyToOne
    @MapsId("id")
    @JoinColumn(name = "book_id")
    BookEntity book;

    @Column(name = "count")
    int count;

    public OrderHasBooksKey getId() {
        return id;
    }

    public void setId(OrderHasBooksKey id) {
        this.id = id;
    }

    public OrderEntity getOrder() {
        return order;
    }

    public void setOrder(OrderEntity order) {
        this.order = order;
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

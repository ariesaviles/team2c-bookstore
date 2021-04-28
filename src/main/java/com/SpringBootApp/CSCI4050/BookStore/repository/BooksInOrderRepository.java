package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface BooksInOrderRepository extends CrudRepository<OrderHasBooksEntity, OrderHasBooksKey> {

    @Query(value = "SELECT * FROM order_has_books INNER JOIN order_table ON " +
            "order_has_books.order_idorder=order_table.idorder WHERE order_table.user_iduser = :id")
    List<OrderHasBooksEntity> getBooksFromUserId(@Param("id") long id);

    @Query(value = "SELECT * FROM order_has_books WHERE order_has_books.order_idorder = :id")
    List<OrderHasBooksEntity> getBooksFromOrder(@Param("id") long id);

}

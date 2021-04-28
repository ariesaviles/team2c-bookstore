package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface BooksInOrderRepository extends CrudRepository<OrderHasBooksEntity, OrderHasBooksKey> {

    @Query(value = "SELECT * FROM order_has_books WHERE order_has_books.order_idorder in " +
            "(SELECT idorder FROM order_table WHERE order_table.user_iduser = :id)", nativeQuery = true)
    List<OrderHasBooksEntity> getBooksFromUserId(@Param("id") long id);

    @Query(value = "SELECT * FROM order_has_books WHERE order_has_books.order_idorder = :id", nativeQuery = true)
    List<OrderHasBooksEntity> getBooksFromOrder(@Param("id") long id);

}

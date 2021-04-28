package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface BooksInCartRepository extends CrudRepository<UserCartHasBooksEntity, UserCartHasBooksKey> {

    @Query(value = "SELECT * FROM usercart_has_books WHERE usercart_idusercart = " +
            "(SELECT idUserCart FROM usercart WHERE user_iduser = :id)", nativeQuery = true)
    List<UserCartHasBooksEntity> findByUserId(@Param("id") long id);

    @Query(value = "SELECT * FROM usercart_has_books WHERE book_id = :book_id AND usercart_idusercart = " +
            "(SELECT idUserCart FROM usercart WHERE user_iduser = :user_id)", nativeQuery = true)
    List<UserCartHasBooksEntity> findByIdAndBook(@Param("book_id") long book_id, @Param("user_id") long user_id);

}

package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserCartEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;


public interface BookRepository extends CrudRepository<BookEntity, Long> {
    Optional<BookEntity> findById(Long id);

    BookEntity findByTitle(String title);

    BookEntity findByAuthors(String authors);

    @Query(value = "SELECT * FROM book WHERE book.title LIKE title", nativeQuery = true)
    BookEntity findRelatedTitle(@Param("title") String title);

}

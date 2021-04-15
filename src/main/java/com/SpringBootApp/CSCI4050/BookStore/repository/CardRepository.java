package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CardRepository extends CrudRepository<CardEntity, Long> {
    Optional<CardEntity> findById(Long idCard);

    @Query(value = "SELECT * FROM card  WHERE card.user_IDuser = :id", nativeQuery = true)
    List<CardEntity> findByUser_IDuser(@Param("id") long id);
}

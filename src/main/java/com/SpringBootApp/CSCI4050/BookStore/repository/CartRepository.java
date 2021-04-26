package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserCartEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CartRepository extends CrudRepository<UserCartEntity, Long> {
    Optional<UserCartEntity> findById(Long idCart);

    @Query(value = "SELECT * FROM usercart  WHERE usercart.user_IDuser = :id", nativeQuery = true)
    UserCartEntity findByUser_IDuser(@Param("id") long id);
}
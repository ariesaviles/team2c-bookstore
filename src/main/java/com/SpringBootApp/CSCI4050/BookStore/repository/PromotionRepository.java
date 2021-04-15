package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.BookEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface PromotionRepository extends CrudRepository<PromotionEntity, Long> {
    Optional<PromotionEntity> findById(Long idPromotion);


}

package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.PromotionEntity;
import org.springframework.data.repository.CrudRepository;

public interface EntityRepository extends CrudRepository<PromotionEntity, Long> {

}

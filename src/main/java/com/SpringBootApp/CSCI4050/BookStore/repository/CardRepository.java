package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.CardEntity;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<CardEntity, Long> {
}

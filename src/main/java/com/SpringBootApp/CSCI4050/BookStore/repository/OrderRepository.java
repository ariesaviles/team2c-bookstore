package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.OrderEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;


public interface OrderRepository extends CrudRepository<OrderEntity, Long> {
    Optional<OrderEntity> findById(Long idOrder);

}

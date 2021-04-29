package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.OrderEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;


public interface OrderRepository extends CrudRepository<OrderEntity, Long> {
    Optional<OrderEntity> findById(Long idOrder);

    @Query(value = "SELECT * FROM order_table WHERE order_table.user_iduser = :idUser", nativeQuery = true)
    List<OrderEntity> findByUserIDUser(@Param("idUser")long idUser);
}

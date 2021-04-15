package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.AddressEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AddressRepository extends CrudRepository<AddressEntity, Long> {
    Optional<AddressEntity> findById(Long idAddress);
}

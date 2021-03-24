package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;


public interface AccountRepository extends CrudRepository<UserAccountEntity, Long> {
    Optional<UserAccountEntity> findById(Long id);

    UserAccountEntity findByUserName(String userName);

    UserAccountEntity findByEmail(String email);
}

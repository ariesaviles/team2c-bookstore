package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;


public interface AccountRepository extends CrudRepository<UserAccountEntity, Long> {
    Optional<UserAccountEntity> findById(Long id);

    UserAccountEntity findByUserName(String userName);

    UserAccountEntity findByEmail(String email);

    @Query(value = "SELECT * FROM user WHERE user.isPromotion = 1", nativeQuery = true)
    List<UserAccountEntity> getAccountsWithSubscription();
}

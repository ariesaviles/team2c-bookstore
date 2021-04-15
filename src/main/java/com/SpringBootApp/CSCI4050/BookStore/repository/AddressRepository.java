package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.AddressEntity;
import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.apache.catalina.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface AddressRepository extends CrudRepository<AddressEntity, Long> {
    Optional<AddressEntity> findById(Long idAddress);

    //AddressEntity findByUser(UserAccountEntity user_IDuser);

    @Query(value = "SELECT * FROM address WHERE address.user_IDuser = :id", nativeQuery = true)
    List<AddressEntity> findByUser_IDuser(@Param("id") long id);

    AddressEntity findByStreet(String street);
}

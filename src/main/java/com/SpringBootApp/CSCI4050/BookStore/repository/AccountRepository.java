package com.SpringBootApp.CSCI4050.BookStore.repository;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;



public interface AccountRepository  {
    //extends CrudRepository<UserAccountEntity, Long>
    UserAccountEntity findByUserName(String userName);

    UserAccountEntity findByEmail(String email);
}

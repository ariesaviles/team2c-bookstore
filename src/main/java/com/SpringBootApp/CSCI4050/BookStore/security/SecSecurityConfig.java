package com.SpringBootApp.CSCI4050.BookStore.security;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import com.SpringBootApp.CSCI4050.BookStore.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
public class SecSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AccountRepository accountRepo;

    @Override
    @Autowired
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        /*
        auth.inMemoryAuthentication()
                .withUser("user1").password(passwordEncoder().encode("user1Pass")).roles("USER")
                .and()
                .withUser("user2").password(passwordEncoder().encode("user2Pass")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("adminPass")).roles("ADMIN");
        */


        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery("SELECT email, password, (userState = 'Active') AS enabled " +
                        "FROM user u " +
                        "WHERE email = ?;")
                .authoritiesByUsernameQuery("SELECT u.username, (u.userState = 'Active') AS enabled " +
                        "FROM user u WHERE u.email = ?;");
                //.passwordEncoder(passwordEncoder())

        /*
                .usersByUsernameQuery("SELECT u.email, u.password, CAST( " +
                        "CASE" +
                        "WHEN u.userState = Active THEN 1 ELSE 0" +
                        "END AS BIT) as permission" +
                        "FROM user u " +
                        "WHERE email = ?")
                .authoritiesByUsernameQuery("SELECT username, CAST( " +
                        "CASE" +
                        "WHEN u.userState = Active THEN 1 ELSE 0" +
                        "END AS BIT) as permission" +
                        "FROM user " +
                        "WHERE email = ?");


         */

                //.withDefaultSchema()
                //.withUser(User.withUsername("user")
                //        .password(passwordEncoder().encode("pass"))
                //        .roles("USER"));


    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/admin_page.html").hasRole("ADMIN")
                .antMatchers("/index").hasRole("USER")
                .antMatchers("/").permitAll()
                .and().formLogin();
                //loginPage("/Users/andino/team2c-bookstore/src/main/webapp/WEB-INF/jsp/logintest.html");
    }



    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

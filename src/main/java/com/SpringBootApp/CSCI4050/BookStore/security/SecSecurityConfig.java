package com.SpringBootApp.CSCI4050.BookStore.security;

import com.SpringBootApp.CSCI4050.BookStore.entities.UserAccountEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
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


    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
/*
        auth.inMemoryAuthentication()
                .withUser("user1").password(passwordEncoder().encode("user1Pass")).roles("USER")
                .and()
                .withUser("user2").password(passwordEncoder().encode("user2Pass")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("adminPass")).roles("ADMIN");
                */

/*
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .passwordEncoder(new BCryptPasswordEncoder())
                .usersByUsernameQuery("SELECT u.email, u.password, u.isAdmin " +
                        "FROM user u " +
                        "WHERE email = ?")
                .authoritiesByUsernameQuery("SELECT username, isAdmin FROM user WHERE email = ?");
*/
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .passwordEncoder(new BCryptPasswordEncoder())
                .usersByUsernameQuery("SELECT u.email, u.password, (u.userState = 'Active') AS enabled " +
                        "FROM user u " +
                        "WHERE u.email = ?;")
                .authoritiesByUsernameQuery("SELECT u.email, CAST(u.isAdmin AS CHAR) as authority " +
                        "FROM user u WHERE u.email = ?;");


/*
        auth.jdbcAuthentication()
                .dataSource(dataSource);
                //.withDefaultSchema()
                //.withUser(User.withUsername("user")
                //        .password(passwordEncoder().encode("pass"))
                //        .roles("USER"));
*/
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/admin_page.html").hasAuthority("1")
                .antMatchers("/userProfile").hasAnyAuthority("0", "1")
                .antMatchers("/cart.html").hasAnyAuthority("0", "1")
                .antMatchers("/").permitAll()
                .antMatchers("/changePasswordEmail").permitAll()
                .and().formLogin().defaultSuccessUrl("/index").permitAll()
                .and().logout().logoutSuccessUrl("/");
                //.loginPage("/login")
                //.defaultSuccessUrl("/index", true)
                //.permitAll();
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

}

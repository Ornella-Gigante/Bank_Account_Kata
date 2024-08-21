package com.demo_bank_v1.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;


// Set Up of all the columns of the table Users
@Entity
public class User {

    @Id
    private int user_id;

    @NotEmpty(message = "The First name field cannot be empty :(")
    @Size(min = 3, message = "The First name field must be greater than 3 characters")
    private String first_name;

    @NotEmpty(message = "The Last name field cannot be empty :(")
    @Size(min = 3, message = "The Last name field must be greater than 3 characters")
    private String last_name;


    @NotEmpty(message = "The Email field cannot be empty")
    @Pattern(regexp = "([a-zA-Z0-9]+(?:[._+-][a-zA-Z0-9]+)*)@([a-zA-Z0-9]+(?:[a-zA-Z0-9]+)*\\.[a-zA-Z]{2,})", message = "Please enter a valid email")
    private String email;

    @NotEmpty(message = "The Password field cannot be empty")
    @NotNull(message = "The Password field cannot be null")
    private String password;

    private String token;
    private String code;
    private int verified;
    private LocalDate verified_at;
    private LocalDateTime created_at;
    private LocalDateTime updated_at;


//Getters and setters


    // Getters
    public int getUser_id() {
        return user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getToken() {
        return token;
    }

    public String getCode() {
        return code;
    }

    public int getVerified() {
        return verified;
    }

    public LocalDate getVerified_at() {
        return verified_at;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    // Setters
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setVerified(int verified) {
        this.verified = verified;
    }

    public void setVerified_at(LocalDate verified_at) {
        this.verified_at = verified_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }






}

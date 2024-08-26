package com.demo_bank_v1.restControllers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Transaction {

    @PostMapping("/accounts/{accountID}/transactions")
    @ResponseStatus(HttpStatus.CREATED)
    public void createTransaction(@PathVariable(name="accountID")String account_id){

        System.out.println(account_id);

    }
}

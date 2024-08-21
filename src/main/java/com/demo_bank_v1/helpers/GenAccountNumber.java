package com.demo_bank_v1.helpers;

import java.util.Random;

public class GenAccountNumber {

    //This class will generate an account number

    public static int generateAccountNumber(){

        int accountNumber;

        Random random= new Random();
        int bound= 1000;
        accountNumber= bound * random.nextInt(bound);


        return accountNumber;
    }


    // End of generating the account number
}

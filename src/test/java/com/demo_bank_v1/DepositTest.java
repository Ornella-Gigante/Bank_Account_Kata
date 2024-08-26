package com.demo_bank_v1;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;

import static io.restassured.RestAssured.given;


// Test feature of deposit
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
class DepositTest{

    @LocalServerPort
    private int port;




    /**GIVEN
     a bank account with id 1234
     and a balance of $100
     and a deposit payload for $2000
     WHEN
     a POST request is made to /accounts/1234/transactions including the payload
     THEN
     a response is obtained with status code 201
     WHEN
     a GET request is made to /accounts/1234
     THEN
     a response is obtained with status code 200
     and the account balance is $2100

     **/
    @Test
    public void make_deposit_happy_path() {

        String requestBody= """
                    {
                        amount: 1000,
                        currency: "$",
                        transactionType: "deposit"
                    }
                """;


        given()
                .port(this.port)
                .body(requestBody)
        .when()
                .post("/transactions")

        .then()
                .statusCode(201);

    }

}


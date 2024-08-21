package com.demo_bank_v1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCrypt;

// $2a$10$4PlO3fwumgAVAqKc3gqfLe0YC/ny9E67QDUn4ROygQ.qnOu.NcsMu = HASH PASSWORD (IMP!)
@SpringBootApplication
public class DemoBankV1Application {

	public static void main(String[] args) {


		SpringApplication.run(DemoBankV1Application.class, args);

		//String password= BCrypt.hashpw("ornelita93", BCrypt.gensalt());

		//System.out.println(password);



}
}
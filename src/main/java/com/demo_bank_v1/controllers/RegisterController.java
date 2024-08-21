package com.demo_bank_v1.controllers;

import com.demo_bank_v1.helpers.HTML;
import com.demo_bank_v1.helpers.Token;
import com.demo_bank_v1.mailMessenger.MailMessenger;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.UserRepository;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Random;

@RestController
public class RegisterController {

    //This is going to perfom the statements of the BBDD and connect with it
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/register")
    public ModelAndView getRegister() {
        ModelAndView getRegisterPage = new ModelAndView("register");
        System.out.println("In Register Page Controller");
        getRegisterPage.addObject("PageTitle", "Register");
        return getRegisterPage;
    }

    // Debido a que se debe verificar los POST hechos por el usuario, es necesario @PostMapping
    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password) throws MessagingException {

        ModelAndView registrationPage = new ModelAndView("register");

        // Check For Errors
        if (result.hasErrors() && confirm_password.isEmpty()) {
            registrationPage.addObject("confirm_pass", "The confirm Field is required");
            return registrationPage;
        }

        // TODO: CHECK FOR PASSWORD MATCH
        if (!password.equals(confirm_password)) {
            registrationPage.addObject("passwordMisMatch", "Passwords don't match");
            return registrationPage;
        }

        // TODO: CHECK IF EMAIL ALREADY EXISTS
        int emailCount = userRepository.countByEmail(email);
        if (emailCount > 0) {
            registrationPage.addObject("emailExists", "Email is already registered");
            return registrationPage;
        }

        // TODO: GET TOKEN STRING
        String token = Token.generateToken();

        // TODO: GENERATE RANDOM CODE
        Random rand = new Random();
        int bound = 123;
        int code = bound * rand.nextInt(bound);

        // TODO: GET EMAIL HTML BODY
        String emailBody = HTML.htmlEmailTemplate(token, Integer.toString(code));

        // TODO: HASH PASSWORD
        String hashed_password = BCrypt.hashpw(password, BCrypt.gensalt());

        // TODO: REGISTER USER
        userRepository.registerUser(first_name, last_name, email, hashed_password, token, Integer.toString(code));

        // TODO: SEND EMAIL NOTIFICATION
        MailMessenger.htmlEmailMessenger("moon.alex.nells@gmail.com", email, "Verify the account", emailBody);

        // TODO: RETURN TO REGISTER PAGE
        String successMessage = "Account Registered Successfully, Please Check your Email and Verify the Account! :)";
        registrationPage.addObject("success", successMessage);
        return registrationPage;
    }
}
